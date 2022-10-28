package tw.eatworld.client.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.lowagie.text.DocumentException;

import tw.eatworld.client.model.ClientCollection;
import tw.eatworld.client.model.ClientMember;
import tw.eatworld.client.model.ClientMemberDetail;
import tw.eatworld.client.model.ClientMemberService;
import tw.eatworld.client.model.ClientPDFExporter;
import tw.eatworld.store.model.StoreMember;
import tw.eatworld.store.model.StoreMemberService;

@Controller
@SessionAttributes(names = { "Vip1", "Vip2", "Vip3" ,"Vip4","Vip5"})
@RequestMapping("/clientMember")
public class ClientMemberController {

	@Autowired
	private ClientMemberService clientService;
	
	@Autowired
	private StoreMemberService storeService;

	@GetMapping("/clientList")
	public String showClientList(Model model) {
		List<ClientMember> allClients = clientService.showAllClients();
		model.addAttribute("allClients", allClients);
		return "backendJsp/backendClientMember/clientList";
	}

	@GetMapping("/clientForm") // 虛擬網址新增頁面 綁定新增Form Form
	public String addClientFormAction(Model model) {
		ClientMember client = new ClientMember();
		model.addAttribute("client", client);
		return "backendJsp/backendClientMember/clientForm";
	}

	@PostMapping("/saveClientForm")
	public String saveClientForm (@ModelAttribute("client") ClientMember client,@RequestParam("clientLogo") MultipartFile mf) throws IllegalStateException, IOException {
		
		String fileName = mf.getOriginalFilename();
		String filePath = "D:/upload";
		String bcPwd = new BCryptPasswordEncoder().encode(client.getClientPassword());
		client.setClientPassword(bcPwd);
		ClientMemberDetail detail = client.getClientMemberDetail();
		if (!fileName.isEmpty()) {
			File saveFilePath = new File(filePath,fileName);
			byte[] b = mf.getBytes();
			mf.transferTo(saveFilePath);
			detail.setClientLogo(fileName);
		}else {
		    detail.setClientLogo("user.png");
		   }
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		String clientAdddate = sdFormat.format(new Date());
		detail.setClientAdddate(clientAdddate);
		  
		clientService.saveClient(client);
		return "redirect:clientList";

	}

	@GetMapping("/updateForm/{clientId}") // 虛擬網址修改頁面 綁定修改Form Form
	public String updateClientFormAction(@PathVariable("clientId") int Id, Model model) {
		ClientMember client = clientService.getClientById(Id);
		model.addAttribute("client", client);
		return "backendJsp/backendClientMember/clientEditForm";
	}
	
	@PutMapping("/saveClientEditForm")
	public String saveClientEditForm(@ModelAttribute("client") ClientMember client, @RequestParam("clientDetailId") String id, @RequestParam("clientPhone") String phone,
			@RequestParam("clientBirthday") String birthday,@RequestParam("clientPoint") String points, @RequestParam("clientVip") String vip, @RequestParam("clientLogo") MultipartFile mf) throws IOException {
		String fileName = mf.getOriginalFilename();
		String filePath = "D:/upload";
		ClientMemberDetail detail = clientService.getClientDetailById(Integer.parseInt(id));
		detail.setClientPhone(phone);
		detail.setClientBirthday(birthday);
		detail.setClientPoint(Integer.parseInt(points));
		detail.setClientVip(Integer.parseInt(vip));
		String oldLogo = detail.getClientLogo();
		if (!fileName.isEmpty()) {
		File saveFilePath = new File(filePath,fileName);
		byte[] b = mf.getBytes();
		mf.transferTo(saveFilePath);
		detail.setClientLogo(fileName);
		
		}else {
			detail.setClientLogo(oldLogo);
		}
		
		client.setClientMemberDetail(detail);
		clientService.saveClient(client);
		return "redirect:clientList";
	}
	
	@GetMapping("/deleteClient")
	public String deleteClient(@RequestParam("clientId") int clientId) {
		clientService.deleteClient(clientId);
		return "redirect:clientList";
	}
	
	 @GetMapping("/exportPDF") //匯出PDF
	    public void exportToPDF(HttpServletResponse response) throws DocumentException, IOException {
	        response.setContentType("application/pdf");
	        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
	        String currentDateTime = dateFormatter.format(new Date());
	         
	        String headerKey = "Content-Disposition";
	        String headerValue = "attachment; filename=Clients_" + currentDateTime + ".pdf";
	        response.setHeader(headerKey, headerValue);
	         
	        List<ClientMember> Clients = clientService.showAllClients();
	         
	        ClientPDFExporter exporter = new ClientPDFExporter(Clients);
	        exporter.export(response);
	         
	    }
	 
	 @ResponseBody
	 @PostMapping("/countMember") //計算會員
		public String countMember() {
		 	List<ClientMember> allClients = clientService.showAllClients();
		 	int count = 0;
		 	for(ClientMember client : allClients) {
		 		count++;
		 	}
			return String.valueOf(count);
		}
	 
	 @ResponseBody
	 @PostMapping("/countStore") //計算商家
		public String countStore() {
		 	List<StoreMember> allStores = storeService.findAll();
		 	int count = 0;
		 	for(StoreMember store : allStores) {
		 		count++;
		 	}
			return String.valueOf(count);
		}
	 
	 @ResponseBody
	 @PostMapping("/countCollection") //計算收藏
		public String countCollection(@RequestParam("storeId") String id) {
		 System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~來了");
		 	StoreMember store = storeService.findById(Integer.parseInt(id));
		 	int count = 0;
		 	Set<ClientCollection> collections = store.getCollection();
		 	for(ClientCollection collection : collections) {
		 		count++;
		 	}
			return String.valueOf(count);
		}
	 
	 @ResponseBody
	 @PostMapping("/countVip") //計算vip
		public int[] countVip() {
		 int a = 0; int b=0; int c=0; int d=0; int e=0;
		 List<ClientMember> allClients = clientService.showAllClients();
			for (ClientMember client : allClients) {
				switch (client.getClientMemberDetail().getClientVip()) {
				case 1:
					a++;
					break;
				case 2:
					b++;
					break;
				case 3:
					c++;
					break;
				case 4:
					d++;
					break;
				case 5:
					e++;
					break;
				}
			}

			int[] countVip = {a,b,c,d,e};
			return countVip;
		}
	 
	 
	 @ResponseBody
	 @PostMapping("/countReg") //計算註冊
		public int[] countReg() {
		 int cQ1= 0; int cQ2=0; int cQ3=0; int cQ4=0;
		 int sQ1= 0; int sQ2=0; int sQ3=0; int sQ4=0;
		 List<ClientMember> allClients = clientService.showAllClients();
		 for (ClientMember client : allClients) {
			 String date = client.getClientMemberDetail().getClientAdddate();
			 switch (date.substring(5,7)) {
			 	case "01":
			 	case "02":
			 	case "03":
				 	cQ1++;
				 	break;
			 	case "04":
			 	case "05":
			 	case "06":
			 		cQ2++;
					break;
			 	case "07":
			 	case "08":
			 	case "09":
					cQ3++;
					break;
			 	case "10":
			 	case "11":
			 	case "12":
					cQ4++;
					break;
			 }
		 }
		 
		 List<StoreMember> stores = storeService.findAll();
		 for (StoreMember store : stores) {
			 String date = store.getAddDate();
			 switch (date.substring(5,7)) {
			 	case "01":
			 	case "02":
			 	case "03":
				 	sQ1++;
				 	break;
			 	case "04":
			 	case "05":
			 	case "06":
			 		sQ2++;
					break;
			 	case "07":
			 	case "08":
			 	case "09":
					sQ3++;
					break;
			 	case "10":
			 	case "11":
			 	case "12":
					sQ4++;
					break;
			 }
		 }
		 int[] countReg = {cQ1,cQ2,cQ3,cQ4,sQ1,sQ2,sQ3,sQ4};
			return countReg;
		}
	 
}
