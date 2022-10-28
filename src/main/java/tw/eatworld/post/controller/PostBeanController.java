package tw.eatworld.post.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.eatworld.client.model.MailSenderService;
import tw.eatworld.post.model.PostBean;
import tw.eatworld.post.model.PostBeanService;
import tw.eatworld.post.model.PostMailSenderService;
import tw.eatworld.postcommit.model.PostcommitBeanService;
import tw.eatworld.store.model.StoreMember;
import tw.eatworld.store.model.StoreMemberService;

@Controller
@RequestMapping("/backendBlog")
public class PostBeanController {
	
	@Autowired
	private PostBeanService pbService;
	
	@Autowired
	private StoreMemberService sService;
	
	@Autowired
	private PostcommitBeanService pcService;
	
	@Autowired
	PostMailSenderService pmailSender;

	
	@GetMapping("/listpost")		
    public String listPost(Model model) {
		int state1 = pbService.findByPostStateOrderByCountViewDesc(1).size();
		int state2 = pbService.findByPostStateOrderByCountViewDesc(2).size();
		int state3 = pbService.findByPostStateOrderByCountViewDesc(3).size();
	    model.addAttribute("countstate1", state1);
	    model.addAttribute("countstate2", state2);
	    model.addAttribute("countstate3", state3);
		model.addAttribute("postBean", pbService.findAll());
		return "backendJsp/backendBlog/postlist";
	}
	
	@GetMapping("/liststatepost/{postState}")		
    public String liststatePost(@PathVariable int postState,Model model) {
		model.addAttribute("postBean", pbService.findByPostStateOrderByCountViewDesc(postState));
		return "backendJsp/backendBlog/postlist";
	}
	
	@GetMapping("/addPostForm")		
	public String ShowFormForAdd(Model model) {
	    PostBean postBean = new PostBean();
	    model.addAttribute("postBean", postBean);
	    return "backendJsp/backendBlog/postform";
	}
	 
	@PostMapping("/savePost")  
	public String savePost(@ModelAttribute("postBean") PostBean postBean,@RequestParam("myFile") MultipartFile mf) throws IOException{
	    if(postBean.getPostId()==null) {
	    	postBean.setPostDate(new Date());
	    	postBean.setPostState(1);
	    	postBean.setCountView(0);
	    	
	    }else {
	        postBean.setUpdateDate(new Date());
	        postBean.setPostState(1);
	    }
		    String fileName =mf.getOriginalFilename();
			System.out.println("fileName: "+ fileName);
			
			String saveFileDir = "C:/upload";
			File saveFilePath = new File(saveFileDir,fileName);
			
			mf.transferTo(saveFilePath);
			postBean.setTitlePhoto(fileName);
	    	pbService.savepost(postBean);
	    	return "redirect:/backendBlog/listpost";
	}
	 
	@GetMapping("/updatePostForm/{postId}")
	 public String ShowFormForUpdate(@PathVariable("postId") Integer postId,
	    Model model) {
	    PostBean postBean = pbService.findById(postId);
	    model.addAttribute("postBean", postBean);
	    return "backendJsp/backendBlog/postformEdit";
	 }
	
	@GetMapping("/checkPostForm/{postId}")
	 public String ShowFormForCheck(@PathVariable("postId") Integer postId,
	    Model model) {
	    PostBean postBean = pbService.findById(postId);
	    model.addAttribute("postBean", postBean);
	    return "backendJsp/backendBlog/postformCheck";
	 }
	 
	 @GetMapping("/deletePost/{postId}")
	 public String deletePost(@PathVariable("postId") Integer postId) {
		pbService.deleteById(postId);
	    return "redirect:/backendBlog/listpost";
	 }
	 
	 //審核
	 @PostMapping("/statePost")  
		public String statePost(@ModelAttribute("postBean") PostBean postBean,String msg) {
		 	
		 	String ptitle = postBean.getTitle();
			
			if(postBean.getPostState()==2) {
				
				
				String pstate = "審核成功";
				String pmsg = " ";
			 	System.out.println(msg);
			 	if(postBean.getStoreMember()==null) {
			 		String name = postBean.getClientMember().getClientName();
					String toEmail = postBean.getClientMember().getClientEmail();
					pmailSender.sendPostStateMail(toEmail, name, ptitle, pstate, pmsg);
			 		
			 	}else {
					String name = postBean.getStoreMember().getsName();
					String toEmail = postBean.getStoreMember().getsEmail();
					pmailSender.sendPostStateMail(toEmail, name, ptitle, pstate, pmsg);
			 	}
			 	
			}
		 
		 	if(postBean.getPostState()==3) {
		 		String pstate = "審核失敗";
		 		String pmsg = "失敗原因"+msg;
		 		System.out.println(msg);
		 		System.out.println("審核失敗");
		 		if(postBean.getStoreMember()==null) {
			 		String name = postBean.getClientMember().getClientName();
					String toEmail = postBean.getClientMember().getClientEmail();
					pmailSender.sendPostStateMail(toEmail, name, ptitle, pstate, pmsg);
			 		
			 	}else {
					String name = postBean.getStoreMember().getsName();
					String toEmail = postBean.getStoreMember().getsEmail();
					pmailSender.sendPostStateMail(toEmail, name, ptitle, pstate, pmsg);
			 	}
		 	}
		    pbService.savepost(postBean);
		    return "redirect:/backendBlog/listpost";
		}
	 
	 //廠商
	 
	 @GetMapping("/checkstorePostForm/{postId}")
	 public String ShowFormForstoreCheck(@PathVariable("postId") Integer postId,
	    Model model) {
	    PostBean postBean = pbService.findById(postId);
	    model.addAttribute("postBean", postBean);
	    return "backendJsp/backendBlog/storepostformCheck";
	 }
	 
	 @GetMapping("/storelistpost/{id}")		
	    public String storelistPost(@PathVariable("id") Integer id,Model model) {
			StoreMember storeMember = sService.findById(id);
		    model.addAttribute("postBean", pbService.findByStoreMember(storeMember));
			return "backendJsp/backendBlog/storepostlist";
		}
	 
	 @GetMapping("/addstorePostForm")		
		public String ShowFormForstoreAdd(Model model) {
		    PostBean postBean = new PostBean();
		    model.addAttribute("postBean", postBean);
		    return "backendJsp/backendBlog/storepostform";
		}
	 
	 @PostMapping("/savestorePost")  
		public String savestorePost(@ModelAttribute("postBean") PostBean postBean,@RequestParam("myFile") MultipartFile mf) throws IOException{
		    if(postBean.getPostId()==null) {
		    	postBean.setPostDate(new Date());
		    	postBean.setPostState(1);
		    	postBean.setCountView(0);
		    	System.out.println("新增");
		    }else {
		        postBean.setUpdateDate(new Date());
		        postBean.setPostState(1);
		        System.out.println("修改");
		    }
			    String fileName =mf.getOriginalFilename();
				System.out.println("fileName: "+ fileName);
				
				String saveFileDir = "D:/upload";
				File saveFilePath = new File(saveFileDir,fileName);
				
				mf.transferTo(saveFilePath);
				postBean.setTitlePhoto(fileName);
				int id = postBean.getStoreMember().getId();
		    	pbService.savepost(postBean);
		    	return "redirect:/backendBlog/storelistpost/"+id;
		}
	 
	 @GetMapping("/updatestorePostForm/{postId}")
	 public String ShowFormForstoreUpdate(@PathVariable("postId") Integer postId,
	    Model model) {
	    PostBean postBean = pbService.findById(postId);
	    model.addAttribute("postBean", postBean);
	    return "backendJsp/backendBlog/storepostformEdit";
	 }
	 
	 @GetMapping("/deletestorePost/{postId}")
	 public String deletestorePost(@PathVariable("postId") Integer postId) {
		PostBean postBean = pbService.findById(postId);
		int id = postBean.getStoreMember().getId();
		pbService.deleteById(postId);
		return "redirect:/backendBlog/storelistpost/"+id;
	 }
	 
}
