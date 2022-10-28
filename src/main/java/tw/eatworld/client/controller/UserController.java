package tw.eatworld.client.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import tw.eatworld.booking.model.BookingService;
import tw.eatworld.booking.model.StoreMemberBean;
import tw.eatworld.client.model.ClientCollection;
import tw.eatworld.client.model.ClientMember;
import tw.eatworld.client.model.ClientMemberDetail;
import tw.eatworld.client.model.ClientMemberService;
import tw.eatworld.client.model.MailSenderService;
import tw.eatworld.order.model.OrderBean;
import tw.eatworld.order.model.OrderService;
import tw.eatworld.store.model.StoreMember;
import tw.eatworld.store.model.StoreMemberService;

@Controller
@SessionAttributes(names = { "user", "store", "admin" ,"orderList","store_id"})
public class UserController {
//test
	@Autowired
	private ClientMemberService clientService;

	@Autowired
	private StoreMemberService sService;
	
	@Autowired
	private OrderService oService;

	@Autowired
	MailSenderService mailSender;
	
	@Autowired
	private BookingService bService;
	
	@PostMapping("/user/saveAccountInfo")
	public String saveAccountInfo(@ModelAttribute("user") ClientMember client, @RequestParam("clientName") String name,
			@RequestParam("clientPhone") String phone, @RequestParam("clientEmail") String email,
			@RequestParam("clientBirthday") String birthday, @RequestParam("clientLogo") MultipartFile mf)
			throws IOException {

		client.setClientName(name);
		client.setClientEmail(email);
		String fileName = mf.getOriginalFilename();
		String filePath = "D:/upload";
		ClientMemberDetail detail = client.getClientMemberDetail();
		detail.setClientPhone(phone);
		detail.setClientBirthday(birthday);

		if (fileName.isEmpty()) {
			String oldLogo = detail.getClientLogo();
			detail.setClientLogo(oldLogo);

		} else {
			File saveFilePath = new File(filePath, fileName);
			byte[] b = mf.getBytes();
			mf.transferTo(saveFilePath);
			detail.setClientLogo(fileName);
		}

		clientService.saveClient(client);
		return "redirect:accountInfo";
	}

	@PostMapping("/checkUsername")
	@ResponseBody
	public String checkClientUsername(@RequestParam(name = "username") String name) {
		System.out.println("checkUsername" + name);
		ClientMember checkUsername = clientService.checkUsername(name);
		if (checkUsername == null) {
			return "true";
		}
		return "false";
	}

	@PostMapping("/checkEmail")
	@ResponseBody
	public String checkClientEmail(@RequestParam(name = "email") String email) {
		System.out.println("checkEmail" + email);
		boolean checkEmail = clientService.checkEmail(email);
		System.out.println(checkEmail);
		if (checkEmail) {
			return "true";
		}
		return "false";
	}
	
	@PostMapping("/checkPwd")
	@ResponseBody
	public String checkClientPwd(@RequestParam(name = "pwd") String pwd,@RequestParam(name = "clientId") String id) {
		System.out.println("checkPwd:" + pwd);
		ClientMember client = clientService.getClientById(Integer.parseInt(id));
		
		if ((new BCryptPasswordEncoder().matches(pwd,client.getClientPassword()))) {
			return "true";
		}
		return "false";
	}

	@PostMapping("/user/changePwd")
	public String changePassword(@RequestParam("clientId") int id, @RequestParam("newpwd") String pwd) {

		clientService.changePwd(pwd, id);
		return "redirect:myAccount/accountInfo";
	}

	@PostMapping("/registerClient")
	public String register(@RequestParam("clientUsername") String uName, @RequestParam("clientPassword") String pwd,
			@RequestParam("clientName") String name, @RequestParam("clientEmail") String email)
			throws MessagingException {

		System.out.println("註冊會員");
		String bcPwd = new BCryptPasswordEncoder().encode(pwd); // 密碼加密
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		String clientAdddate = sdFormat.format(new Date());
		String clientLogo = "user.png";
		String clientPermission = "0";
		String uuid = UUID.randomUUID().toString();
		ClientMemberDetail detail = new ClientMemberDetail(clientAdddate, clientLogo);
		ClientMember client = new ClientMember(uName, bcPwd, name, email, uuid, clientPermission, detail);
		System.out.println("要發信");
		mailSender.sendVerifyMail(email, name, uuid);
		clientService.saveClient(client);
		return "frontJsp/frontClientMember/checkVerify";
	}

	@GetMapping("/verify") //驗證信回傳頁面
	public String verifyMember(@RequestParam("token") String uuid) {
		System.out.println("驗證");
		System.out.println("token:"+uuid);
		ClientMember client = clientService.findByClientVerify(uuid);
		if (client != null) {
			client.setClientPermission("1");
			clientService.saveClient(client);
			System.out.println("驗證成功");
			return "frontJsp/frontClientMember/verified";
		}
		return "frontJsp/frontClientMember/errorPage";
	}
	
	@GetMapping("/forgetPwd") //忘記密碼頁面
	public String forgetPwd() {
		return "frontJsp/frontClientMember/forgetPwd";
	}

	@PostMapping("/sendPwd") //發送重設密碼信
	public String SendPwdAction(@RequestParam("clientEmail") String email) {

		ClientMember client = clientService.findByEmail(email);
		String name = client.getClientName();
		String mail = email;
		String uuid = UUID.randomUUID().toString();
		String url = "email=" + mail + "&token=" + uuid;
		try {
			mailSender.sendPwdMail(mail, name, url);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		client.setClientVerify(uuid);
		clientService.saveClient(client);
		return "frontJsp/frontClientMember/frontLogin";
	}
	
	@GetMapping("/resetPwd") //重設密碼頁面
	public String resetpage(@RequestParam("email") String email, @RequestParam("token") String uuid,Model m) {
		System.out.println("重設密碼");
		System.out.println(email);
		m.addAttribute("email", email);
		ClientMember client = clientService.findByEmail(email);
		if (client != null) {
			return "frontJsp/frontClientMember/resetPwd";
		}
		return "frontJsp/frontClientMember/errorPage";
		
	}
	
	@PostMapping("/resetPwd") //重設密碼動作
	public String resetPwd(@ModelAttribute("email") String email, @RequestParam("clientPassword") String pwd) {
		System.out.println("email="+email);
		ClientMember client = clientService.findByEmail(email);
		if (client != null) {
			String bcPwd = new BCryptPasswordEncoder().encode(pwd);
			client.setClientPassword(bcPwd);
			clientService.saveClient(client);
			System.out.println("重設密碼成功");
			return "frontJsp/frontClientMember/reseted";
		}
		return "frontJsp/frontClientMember/errorPage";
		
	}
	
	@GetMapping("/user/wishList")
	public String showWishList(@ModelAttribute("user") ClientMember client,Model model) {
		ClientMember updateClient = clientService.getClientById(client.getClientId());
		Set<ClientCollection> collections = updateClient.getCollection();
		Set<StoreMember> stores = new LinkedHashSet<StoreMember>();
		for (ClientCollection clientCollection : collections) {
			StoreMember store = clientCollection.getStore();
			stores.add(store);
			System.out.println("收藏店家:"+store.getsName());
		}
		if(stores.isEmpty()) {
			System.out.println("無收藏");
			return "frontJsp/frontClientMember/my-wishList";
		}else {
			model.addAttribute("collections", stores);
			return "frontJsp/frontClientMember/my-wishList";
		}
	}
	
	@ResponseBody
	@PostMapping("/user/addCollection") //新增收藏
	public void addCollection(@RequestParam("clientId") int clientId, @RequestParam("storeId") int storeId) {
		System.out.println("addCollection:"+clientId);
		ClientMember client = clientService.getClientById(clientId);
		StoreMember store = sService.findById(storeId);
		ClientCollection newCollection = new ClientCollection(client,store);
		clientService.saveCollection(newCollection);
		System.out.println("addCollection完成");
	}
	
	@ResponseBody
	@PostMapping("/user/deleteCollection") //刪除收藏
	public void deleteCollection(@RequestParam("clientId") int clientId, @RequestParam("storeId") int storeId) {
		System.out.println("deleteCollection");
		System.out.println(clientId+":"+storeId);
		clientService. deleteCollection(clientId,storeId);
		System.out.println("deleteCollection完成");
	}
	
	@ResponseBody
	@GetMapping("/user/getCollection")
	public String getCollection(@RequestParam("clientId") int clientId, @RequestParam("storeId") int storeId) {
		ClientMember client = clientService.getClientById(clientId);
		Set<ClientCollection> collections = client.getCollection();
		System.out.println("getCollection");
		for (ClientCollection clientCollection : collections) {
			int store = clientCollection.getStore().getId();
			if(storeId == store) {
				System.out.println("getCollectionIN");
				return "true";
			}
		}
		return "false";
	}
	
	@GetMapping("/login") //登入頁面
	public String processLoginAction() {
		return "frontJsp/frontClientMember/frontLogin";
	}

	@PostMapping("/loginError") //登入錯誤
	public String processLoginErrorAction(Model model) {
		model.addAttribute("error", "帳號密碼有誤，請重新輸入");
		return "frontJsp/frontClientMember/frontLogin";
	}

	@GetMapping("/logout") // 登出
	public String processLogoutAction(SessionStatus status) {
		status.setComplete();
		return "frontJsp/frontClientMember/frontLogin";
	}

	@GetMapping("/user/accountInfo")
	public String processAccountInfoAction() {
		return "frontJsp/frontClientMember/my-account";
	}



	@GetMapping("/user/changePwd")
	public String processChangePwdAction() {
		return "frontJsp/frontClientMember/changePwd";
	}
	
	@GetMapping("/getMenu/{storeId}")
	public String getMenu(@PathVariable("storeId") String id,Model model) {
		model.addAttribute("store_id", id);
		return "redirect:/FrontProductController/initData";
	}
	
	
}
