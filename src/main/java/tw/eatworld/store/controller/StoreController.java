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
	

	/*****後台商店登入功能部分*****/
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
		System.out.println("開始註冊");
		//外鍵:分類 本身要存的值為StoreClassification物件。
		StoreClassification classification = new StoreClassification();
		classification.setcId(sCategory);
		StoreMember store = new StoreMember(sUsername,sPwd,sName,sAddress,sPhone,sEmail,openTime,endTime,sIntroduction,classification);
		
//		String bcPwd = new BCryptPasswordEncoder().encode(store.getsPwd());
//		store.setsPwd(bcPwd);
		//產生加入日期
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		String addDate = sdFormat.format(new Date());
		store.setAddDate(addDate);
		//給預設圖片
		String fileName = "StoreDefault.jpg";
		store.setsLogo(fileName);
		store.setsBooking(0);
		//新增
		
		String requestHash = resultMap.get("hash").toString();
		String tamp = resultMap.get("tamp").toString();
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");//現在時間
        Calendar c = Calendar.getInstance();
        String currentTime = sf.format(c.getTime());
        if (tamp.compareTo(currentTime) > 0) {
            String hash =  MD5Utils.code(identify);//MD5值
            if (hash.equalsIgnoreCase(requestHash)){
                //成功
                attributes.addFlashAttribute("m", "註冊成功，現在已可登錄");
                storeService.inset(store);
        		return "redirect:/login";
            }else {
                //驗證碼不對
                System.out.println("驗證碼不正確");
                attributes.addFlashAttribute("message", "驗證碼不正確");
                return "redirect:/store/reg";
            }
        } else {
            //OverTime
            System.out.println("驗證碼過期");
            attributes.addFlashAttribute("message", "驗證碼過期");
            return "redirect:/store/reg";
        }

	}
	/*****後臺頁面部分*****/
	@GetMapping("/storequeryallmain.controller")
	public String processQueryAllMainAction() {
		return "backendJsp/backendStoreMember/storeList";
	}
	
	//傳值進storeForm
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
		//密碼加密
		String bcPwd = new BCryptPasswordEncoder().encode(store.getsPwd());
		store.setsPwd(bcPwd);
		//產生加入日期
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		String addDate = sdFormat.format(new Date());
		store.setAddDate(addDate);
		//取得檔案名稱和副檔名
		String fileName = mf.getOriginalFilename();
		String extension = FilenameUtils.getExtension(fileName);
		//判斷:若沒圖片給預設值、有圖片上傳就保存到指定位址
		if (fileName.equals("")) {
			fileName = "StoreDefault.jpg";
		}else {
			fileName = "IMG_"+store.getsUsername()+"."+extension;
			//指定路徑、新檔案名稱&保存圖片&保存新名稱至資料庫
			String saveFileDir = "D:/upload";
			File saveFile = new File(saveFileDir, fileName);
			mf.transferTo(saveFile);
		}
		//設值
		store.setsLogo(fileName);
		//新增
		storeService.inset(store);
		return "redirect:storeList";
	}
	

	@GetMapping("/updateStoreForm")
	public String updateStore(@RequestParam("id") Integer storeId, Model model) {
		System.out.println("有進");
		StoreMember store = storeService.findById(storeId);
		model.addAttribute("store", store);
		return "backendJsp/backendStoreMember/storeFormUpdate";
	}
	
	@PostMapping("/saveStoreUpdate")
	public String saveStoreUpdate(@ModelAttribute("store") StoreMember store,@RequestParam("sfiles") MultipartFile mf,Model m) throws IOException {
		//取得檔案名稱和副檔名
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
		//設值
		store.setsLogo(fileName);
		//更新
		storeService.update(store);
		m.addAttribute("user",store);
		//return "redirect:storeList";
		return "redirect:/backendStore";
	}
	//刪
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
	//商家列表
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
	//資料，分類商家
		@GetMapping("/sort")
		@ResponseBody
		public List<StoreMember> sort(int cId,Model m) {
			List<StoreMember> store =storeService.findByCategory(cId);
			m.addAttribute("store",store);
			return store;
		}
		//資料，全部商家
		@GetMapping("/json") 
		@ResponseBody
		public List<StoreMember> Four4() {
			System.err.println("確定進方法");
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
		
		
		
		//頁面，確定AJAX方法
		@GetMapping("/check")
		public String Check(Model m) {
//			List<StoreMember> store =storeService.findAll();
//			m.addAttribute("store",store);
			return "frontJsp/frontProduct/shop-four4";
		}
		
		//頁面，確定AJAX方法
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
		
		//資料count分類
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

		//商家資料頁面
		@GetMapping("/storeProfile")
		public String showStoreProfile(@ModelAttribute("user") StoreMember user, Model model) {
			StoreMember store = storeService.findById(user.getId());
			model.addAttribute("store", store);
			return "backendJsp/backendStoreMember/storeProfile";
		}
		
		@RequestMapping("/sendEmail")
	    //轉換json數據  @ResponseBody
	    @ResponseBody
	    public String sendEmail(String email) {
	        SimpleMailMessage message = new SimpleMailMessage();
	        String sender="EatWorld吃窩 <EatWorld2022@gmail.com>";
	        
	        String code = VerifyCode(6);    //隨機生成6位數字驗證碼
	        message.setFrom(sender);
	        message.setTo(email);
	        message.setSubject("EatWorld驗證碼");// 標題
	        message.setText("【sys】你的驗證碼為："+code+"，有效時間為5分鐘(若非本人操作，請忽略此郵件)");// 内容
	        try {
	            javaMailSender.send(message);
	            logger.info("信件發送成功！");
	            saveCode(code);
	            return "success";
	        }catch (MailSendException e){
	            logger.error("信箱不存在");
	            return "false";
	        } catch (Exception e) {
	            logger.error("信件發送異常！", e);
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

	    //保存驗證碼和時間
	    private void saveCode(String code){
	        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
	        Calendar c = Calendar.getInstance();
	        c.add(Calendar.MINUTE, 5);
	        String currentTime = sf.format(c.getTime());// 生成五分鐘後的時間，檢驗是否過期

	        String hash =  MD5Utils.code(code);//MD5加密
	        resultMap.put("hash", hash);
	        resultMap.put("tamp", currentTime);
	    }
	    
	    @GetMapping("/getMenu/{storeId}")
		public String getMenu(@PathVariable("storeId") String id,Model model) {
			model.addAttribute("store_id", id);
			return "redirect:/FrontProductController/initData";
		}

}
