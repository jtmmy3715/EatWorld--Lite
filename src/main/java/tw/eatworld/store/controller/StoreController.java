package tw.eatworld.store.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;

import javax.mail.internet.InternetAddress;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tw.eatworld.booking.model.StoreMemberBean;
import tw.eatworld.client.model.ClientMember;
import tw.eatworld.client.model.ClientMemberDetail;
import tw.eatworld.store.model.StoreClassification;
import tw.eatworld.store.model.StoreMember;
import tw.eatworld.store.model.StoreMemberService;




@Controller
@RequestMapping("/store")
@SessionAttributes(names = {"storeAccount","user","store_id"})
public class StoreController {
	
	@Autowired
	private StoreMemberService storeService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
    private JavaMailSender javaMailSender;
	private Map<String, Object> resultMap = new HashMap<>();
	

	/*****??????????????????????????????*****/
	@GetMapping("/reg")
	public String checkReg(Model m) {
		StoreMember store = new StoreMember();
		//m.addAttribute("store", store);
		return "frontJsp/frontStoreMember/regisStore";
	}
	
	@PostMapping("/saveReg")
	public String saveRegStore (@RequestParam("sUsername") String sUsername, 
								@RequestParam("sPwd") String sPwd,
								@RequestParam("sName") String sName, 
								@RequestParam("sAddress") String sAddress,
								@RequestParam("sPhone") String sPhone,
								@RequestParam("sEmail") String sEmail,
								@RequestParam("openTime") String openTime,
								@RequestParam("endTime") String endTime,
								@RequestParam("sIntroduction") String sIntroduction,
								@RequestParam("sCategory") int sCategory,
								@RequestParam String identify,
								RedirectAttributes attributes
								) throws IllegalStateException, IOException {
		System.out.println("????????????");
		//??????:?????? ?????????????????????StoreClassification?????????
		StoreClassification classification = new StoreClassification();
		classification.setcId(sCategory);
		StoreMember store = new StoreMember(sUsername,sPwd,sName,sAddress,sPhone,sEmail,openTime,endTime,sIntroduction,classification);
		
//		String bcPwd = new BCryptPasswordEncoder().encode(store.getsPwd());
//		store.setsPwd(bcPwd);
		//??????????????????
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		String addDate = sdFormat.format(new Date());
		store.setAddDate(addDate);
		//???????????????
		String fileName = "StoreDefault.jpg";
		store.setsLogo(fileName);
		store.setsBooking(0);
		//??????
		
		String requestHash = resultMap.get("hash").toString();
		String tamp = resultMap.get("tamp").toString();
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");//????????????
        Calendar c = Calendar.getInstance();
        String currentTime = sf.format(c.getTime());
        if (tamp.compareTo(currentTime) > 0) {
            String hash =  MD5Utils.code(identify);//MD5???
            if (hash.equalsIgnoreCase(requestHash)){
                //??????
                attributes.addFlashAttribute("m", "?????????????????????????????????");
                storeService.inset(store);
        		return "redirect:/login";
            }else {
                //???????????????
                System.out.println("??????????????????");
                attributes.addFlashAttribute("message", "??????????????????");
                return "redirect:/store/reg";
            }
        } else {
            //OverTime
            System.out.println("???????????????");
            attributes.addFlashAttribute("message", "???????????????");
            return "redirect:/store/reg";
        }

	}
	/*****??????????????????*****/
	@GetMapping("/storequeryallmain.controller")
	public String processQueryAllMainAction() {
		return "backendJsp/backendStoreMember/storeList";
	}
	
	//?????????storeForm
	@GetMapping("/addStore") 
	public String addStore(Model m) {
		StoreMember store = new StoreMember();
		m.addAttribute("store", store);
		System.out.println("Log1");
		return "backendJsp/backendStoreMember/storeForm";
	}
	

	@PostMapping("/saveStore")
	public String saveStore (@ModelAttribute("store") StoreMember store,@RequestParam("sfiles") MultipartFile mf) throws IllegalStateException, IOException {
		System.out.println("LogSave");
		//????????????
		String bcPwd = new BCryptPasswordEncoder().encode(store.getsPwd());
		store.setsPwd(bcPwd);
		//??????????????????
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		String addDate = sdFormat.format(new Date());
		store.setAddDate(addDate);
		//??????????????????????????????
		String fileName = mf.getOriginalFilename();
		String extension = FilenameUtils.getExtension(fileName);
		//??????:??????????????????????????????????????????????????????????????????
		if (fileName.equals("")) {
			fileName = "StoreDefault.jpg";
		}else {
			fileName = "IMG_"+store.getsUsername()+"."+extension;
			//??????????????????????????????&????????????&???????????????????????????
			String saveFileDir = "D:/upload";
			File saveFile = new File(saveFileDir, fileName);
			mf.transferTo(saveFile);
		}
		//??????
		store.setsLogo(fileName);
		//??????
		storeService.inset(store);
		return "redirect:storeList";
	}
	

	@GetMapping("/updateStoreForm")
	public String updateStore(@RequestParam("id") Integer storeId, Model model) {
		System.out.println("??????");
		StoreMember store = storeService.findById(storeId);
		model.addAttribute("store", store);
		return "backendJsp/backendStoreMember/storeFormUpdate";
	}
	
	@PostMapping("/saveStoreUpdate")
	public String saveStoreUpdate(@ModelAttribute("store") StoreMember store,@RequestParam("sfiles") MultipartFile mf,Model m) throws IOException {
		//??????????????????????????????
		String fileName = mf.getOriginalFilename();
		String extension = FilenameUtils.getExtension(fileName);
		if (fileName.isEmpty()) 
		{	
		fileName = store.getsLogo();
		}else {
			fileName = "IMG_"+store.getsUsername()+"."+extension;
			String saveFileDir = "D:/upload";
			File saveFile = new File(saveFileDir, fileName);
			mf.transferTo(saveFile);
		}
		//??????
		store.setsLogo(fileName);
		//??????
		storeService.update(store);
		m.addAttribute("user",store);
		//return "redirect:storeList";
		return "redirect:/backendStore";
	}
	//???
	@GetMapping("/deleteStore")
	public String deleteStore(@RequestParam("id") int storeId) {
		storeService.delete(storeId);
		return "redirect:storeList";
	}
	
	@GetMapping("/storeList")
	public String StoreQueryAllAction(Model m) {
		List<StoreMember> store = storeService.findAll();
		m.addAttribute("store",store);
		return "backendJsp/backendStoreMember/storeList";
	}
	//????????????
	@GetMapping("/four")
	public String showFour(Model m) {
		List<StoreMember> store = storeService.findAll();
		m.addAttribute("store",store);
		return "frontJsp/frontProduct/shop-four";
	}
	
	@GetMapping("/four3")
	public String fourTime(Model m) {
		
		List<StoreMember> store =storeService.findByTime();
		m.addAttribute("store",store);
		return "frontJsp/frontProduct/shop-four";
	}
	
	@GetMapping("/four2")
	public String showFour2(int cId,Model m) {
		List<StoreMember> store =storeService.findByCategory(cId);
		m.addAttribute("store",store);
		return "frontJsp/frontProduct/shop-four4";
	}
	//?????????????????????
		@GetMapping("/sort")
		@ResponseBody
		public List<StoreMember> sort(int cId,Model m) {
			List<StoreMember> store =storeService.findByCategory(cId);
			m.addAttribute("store",store);
			return store;
		}
		//?????????????????????
		@GetMapping("/json") 
		@ResponseBody
		public List<StoreMember> Four4() {
			System.err.println("???????????????");
			List<StoreMember> store =storeService.findAll();
//			System.out.println(store.get(0).getStoreclassification().getcId());
//			List<StoreMember> store = storeService.findAll();
			return store;
		}
		
		@GetMapping("/{storeID}")
		@ResponseBody
		public StoreMember findById(@PathVariable int storeID) {
			StoreMember storeBean = storeService.findById(storeID);
			return storeBean;
		}
		
		
		
		//???????????????AJAX??????
		@GetMapping("/check")
		public String Check(Model m) {
//			List<StoreMember> store =storeService.findAll();
//			m.addAttribute("store",store);
			return "frontJsp/frontProduct/shop-four4";
		}
		
		//???????????????AJAX??????
				@GetMapping("/set")
				public String set(Model m) {
//					List<StoreMember> store =storeService.findAll();
//					m.addAttribute("store",store);
					return "frontJsp/frontStoreMember/shop-four-fake";
				}
		
		@GetMapping("/sortArray")
		@ResponseBody
		public List<StoreMember> sortArray(int[] cId,Model m) {
			cId = new int[]{4,5,11}; 
			List<StoreMember> store = null;
			List<StoreMember> result = null;
			for (int i = 0; i < cId.length; i++) {
				
				store =storeService.findByCategory(cId[i]);
				result.addAll(store);
			}
			return result;	
		}
		
		//??????count??????
		@ResponseBody
		@GetMapping("/sort2")
		public int countCategry(int cId){
			return storeService.count(cId);
		}
		@GetMapping("/num")
		public void num() {
			int a = countCategry(14);
			System.err.println(a);
		}
		

		
		@GetMapping("/check2")
		public String Check2(Model m) {
//			List<StoreMember> store =storeService.findAll();
//			m.addAttribute("store",store);
			return "frontJsp/frontBooking/bookingList";
		}

		//??????????????????
		@GetMapping("/storeProfile")
		public String showStoreProfile(@ModelAttribute("user") StoreMember user, Model model) {
			StoreMember store = storeService.findById(user.getId());
			model.addAttribute("store", store);
			return "backendJsp/backendStoreMember/storeProfile";
		}
		
		@RequestMapping("/sendEmail")
	    //??????json??????  @ResponseBody
	    @ResponseBody
	    public String sendEmail(String email) {
	        SimpleMailMessage message = new SimpleMailMessage();
	        String sender="EatWorld?????? <EatWorld2022@gmail.com>";
	        
	        String code = VerifyCode(6);    //????????????6??????????????????
	        message.setFrom(sender);
	        message.setTo(email);
	        message.setSubject("EatWorld?????????");// ??????
	        message.setText("???sys????????????????????????"+code+"??????????????????5??????(???????????????????????????????????????)");// ??????
	        try {
	            javaMailSender.send(message);
	            logger.info("?????????????????????");
	            saveCode(code);
	            return "success";
	        }catch (MailSendException e){
	            logger.error("???????????????");
	            return "false";
	        } catch (Exception e) {
	            logger.error("?????????????????????", e);
	            return "failure";
	        }
	    }

	    private String VerifyCode(int n){
	        Random r = new Random();
	        StringBuffer sb =new StringBuffer();
	        for(int i = 0;i < n;i ++){
	            int ran1 = r.nextInt(10);
	            sb.append(String.valueOf(ran1));
	        }
//	        System.out.println(sb);
	        return sb.toString();
	    }

	    //????????????????????????
	    private void saveCode(String code){
	        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
	        Calendar c = Calendar.getInstance();
	        c.add(Calendar.MINUTE, 5);
	        String currentTime = sf.format(c.getTime());// ????????????????????????????????????????????????

	        String hash =  MD5Utils.code(code);//MD5??????
	        resultMap.put("hash", hash);
	        resultMap.put("tamp", currentTime);
	    }
	    
	    @GetMapping("/getMenu/{storeId}")
		public String getMenu(@PathVariable("storeId") String id,Model model) {
			model.addAttribute("store_id", id);
			return "redirect:/FrontProductController/initData";
		}

}
