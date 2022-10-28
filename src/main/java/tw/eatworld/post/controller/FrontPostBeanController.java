package tw.eatworld.post.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.eatworld.post.model.PostBean;
import tw.eatworld.post.model.PostBeanService;
import tw.eatworld.postcommit.model.PostcommitBeanService;

@Controller
@RequestMapping("/frontBlog")
public class FrontPostBeanController {

	@Autowired
	private PostBeanService pbService;
	
	@Autowired
	private PostcommitBeanService pcService;
	
	@GetMapping("/frontlistpost")		
    public String listPost(Model model,@PageableDefault(value= 6) Pageable pageable) {
		Page<PostBean> pages = pbService.findAllByPostState(2,pageable);
		model.addAttribute("number", pages.getNumber());
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("totalElements", pages.getTotalElements());
		model.addAttribute("size", pages.getSize());
		model.addAttribute("postBean",pages.getContent());
		int countTag1 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 1).size();
		 System.out.println("Tag: "+countTag1);
		 model.addAttribute("countTag1", countTag1);
		 int countTag2 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 2).size();
		 model.addAttribute("countTag2", countTag2);
		 int countTag3 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 3).size();
		 model.addAttribute("countTag3", countTag3);
		 int countTag4 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 4).size();
		 model.addAttribute("countTag4", countTag4);
		model.addAttribute("postTop", pbService.findTop3ByPostStateOrderByCountViewDesc(2));
        return "frontJsp/frontBlog/blog";
	}
	
	 
	 @GetMapping("/serchPostForm/{postId}")
	 public String ShowFormForUpdate(@PathVariable("postId") Integer postId,
	    Model model) {
		//瀏覽
	    PostBean postBean = pbService.findById(postId);
	    int i = postBean.getCountView();
	    i += 1;
	    System.out.println(i);
	    postBean.setCountView(i);
	    System.out.println(postBean.getCountView());
	    pbService.savepost(postBean);
	    
//	    System.out.println("回覆文章id"+postBean.getPostId());
	    model.addAttribute("pcommitBean", pcService.findByPostBeanAndPid(postBean,0));
	    System.out.println("回覆內容"+pcService.findByPostBean(postBean).size());
	    model.addAttribute("recommitBean", pcService.findByPid(postId));
	    //標籤
	    int countpcommit = pcService.findByPostBean(postBean).size();
	    model.addAttribute("countpcommit", countpcommit);
	    model.addAttribute("postBean", postBean);
	    int countTag1 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 1).size();
		 model.addAttribute("countTag1", countTag1);
		 int countTag2 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 2).size();
		 model.addAttribute("countTag2", countTag2);
		 int countTag3 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 3).size();
		 model.addAttribute("countTag3", countTag3);
		 int countTag4 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 4).size();
		 model.addAttribute("countTag4", countTag4);
		//熱門
	    model.addAttribute("postTop", pbService.findTop3ByPostStateOrderByCountViewDesc(2));
	    return "frontJsp/frontBlog/blog-details";
	 }
	 
	 @PostMapping("/frontlistpostkey")
		public String queryTitle(@RequestParam("keyword") String keyword, Model model) {
			HashMap<String, String> errorMsgMap = new HashMap<String, String>();
			model.addAttribute("errorMsgMap", errorMsgMap);
			List<PostBean> list = pbService.findByTitleLike("%" + keyword + "%");
			if (keyword == "" || keyword.length() == 0) {
				return "redirect:/frontlistpost";
			}
			if (list.isEmpty()) {
				errorMsgMap.put("QueryError", "<font color=red size=5>查無資料!!</font>");
			}
			if (errorMsgMap != null && !errorMsgMap.isEmpty()) {
				return "redirect:/frontlistpost";
			}
			model.addAttribute("postBeans", list);
			int countTag1 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 1).size();
			 model.addAttribute("countTag1", countTag1);
			 int countTag2 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 2).size();
			 model.addAttribute("countTag2", countTag2);
			 int countTag3 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 3).size();
			 model.addAttribute("countTag3", countTag3);
			 int countTag4 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 4).size();
			 model.addAttribute("countTag4", countTag4);
			return "frontJsp/frontBlog/searchblog";

		}
	 
	 @GetMapping("/frontlistpost1")		
	  public String listPostsByPostTag1(Model model,@PageableDefault(value= 6) Pageable pageable) {
		 Page<PostBean> pages = pbService.findAllByPostStateAndPostTag(2,1,pageable);
		 model.addAttribute("number", pages.getNumber());
		 model.addAttribute("totalPages", pages.getTotalPages());
		 model.addAttribute("totalElements", pages.getTotalElements());
		 model.addAttribute("size", pages.getSize());
		 model.addAttribute("postBean1",pages.getContent());
		 int countTag1 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 1).size();
		 System.out.println("Tag: "+countTag1);
		 model.addAttribute("countTag1", countTag1);
		 int countTag2 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 2).size();
		 model.addAttribute("countTag2", countTag2);
		 int countTag3 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 3).size();
		 model.addAttribute("countTag3", countTag3);
		 int countTag4 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 4).size();
		 model.addAttribute("countTag4", countTag4);
		 model.addAttribute("postTop", pbService.findTop3ByPostStateOrderByCountViewDesc(2));
		 
		 return "frontJsp/frontBlog/searchblog";//傳回搜尋結果
	}
	 
	 @GetMapping("/frontlistpost2")		
	  public String listPostsByPostTag2(Model model,@PageableDefault(value= 6) Pageable pageable) {
		 Page<PostBean> pages = pbService.findAllByPostStateAndPostTag(2,2,pageable);
		 model.addAttribute("number", pages.getNumber());
		 model.addAttribute("totalPages", pages.getTotalPages());
		 model.addAttribute("totalElements", pages.getTotalElements());
		 model.addAttribute("size", pages.getSize());
		 model.addAttribute("postBean2",pages.getContent());
		 int countTag1 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 1).size();
		 model.addAttribute("countTag1", countTag1);
		 int countTag2 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 2).size();
		 model.addAttribute("countTag2", countTag2);
		 int countTag3 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 3).size();
		 model.addAttribute("countTag3", countTag3);
		 int countTag4 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 4).size();
		 model.addAttribute("countTag4", countTag4);
		 model.addAttribute("postTop", pbService.findTop3ByPostStateOrderByCountViewDesc(2));
		 
		 return "frontJsp/frontBlog/searchblog";//傳回搜尋結果
	}
	 @GetMapping("/frontlistpost3")		
	  public String listPostsByPostTag3(Model model,@PageableDefault(value= 6) Pageable pageable) {
		 Page<PostBean> pages = pbService.findAllByPostStateAndPostTag(2,3,pageable);
		 model.addAttribute("number", pages.getNumber());
		 model.addAttribute("totalPages", pages.getTotalPages());
		 model.addAttribute("totalElements", pages.getTotalElements());
		 model.addAttribute("size", pages.getSize());
		 model.addAttribute("postBean3",pages.getContent());
		 int countTag1 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 1).size();
		 model.addAttribute("countTag1", countTag1);
		 int countTag2 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 2).size();
		 model.addAttribute("countTag2", countTag2);
		 int countTag3 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 3).size();
		 model.addAttribute("countTag3", countTag3);
		 int countTag4 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 4).size();
		 model.addAttribute("countTag4", countTag4);
		 model.addAttribute("postTop", pbService.findTop3ByPostStateOrderByCountViewDesc(2));
		 
		 return "frontJsp/frontBlog/searchblog";//傳回搜尋結果
	}
	 @GetMapping("/frontlistpost4")		
	  public String listPostsByPostTag4(Model model,@PageableDefault(value= 6) Pageable pageable) {
		 Page<PostBean> pages = pbService.findAllByPostStateAndPostTag(2,4,pageable);
		 model.addAttribute("number", pages.getNumber());
		 model.addAttribute("totalPages", pages.getTotalPages());
		 model.addAttribute("totalElements", pages.getTotalElements());
		 model.addAttribute("size", pages.getSize());
		 model.addAttribute("postBean4",pages.getContent());
		 int countTag1 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 1).size();
		 model.addAttribute("countTag1", countTag1);
		 int countTag2 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 2).size();
		 model.addAttribute("countTag2", countTag2);
		 int countTag3 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 3).size();
		 model.addAttribute("countTag3", countTag3);
		 int countTag4 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 4).size();
		 model.addAttribute("countTag4", countTag4);
		 model.addAttribute("postTop", pbService.findTop3ByPostStateOrderByCountViewDesc(2));
		 
		 return "frontJsp/frontBlog/searchblog";//傳回搜尋結果
	}
	 
	 @GetMapping("/frontlistpostDate22")		
	  public String listPostsByPostDate22(Model model) {
		 model.addAttribute("postBeans",pbService.findByPostDateLike("2022"));
		 int countTag1 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 1).size();
		 model.addAttribute("countTag1", countTag1);
		 int countTag2 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 2).size();
		 model.addAttribute("countTag2", countTag2);
		 int countTag3 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 3).size();
		 model.addAttribute("countTag3", countTag3);
		 int countTag4 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 4).size();
		 model.addAttribute("countTag4", countTag4);
		 model.addAttribute("postTop", pbService.findTop3ByPostStateOrderByCountViewDesc(2));
		 
		 return "frontJsp/frontBlog/searchblog";//傳回搜尋結果
	}
	
	 @GetMapping("/frontlistpostDate21")		
	  public String listPostsByPostDate21(Model model) {
		 model.addAttribute("postBeans",pbService.findByPostDateLike("2021"));
		 int countTag1 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 1).size();
		 model.addAttribute("countTag1", countTag1);
		 int countTag2 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 2).size();
		 model.addAttribute("countTag2", countTag2);
		 int countTag3 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 3).size();
		 model.addAttribute("countTag3", countTag3);
		 int countTag4 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 4).size();
		 model.addAttribute("countTag4", countTag4);
		 model.addAttribute("postTop", pbService.findTop3ByPostStateOrderByCountViewDesc(2));
		 
		 return "frontJsp/frontBlog/searchblog";//傳回搜尋結果
	}
	 
	 @GetMapping("/frontlistpostDate20")		
	  public String listPostsByPostDate20(Model model) {
		 model.addAttribute("postBeans",pbService.findByPostDateLike("2020"));
		 int countTag1 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 1).size();
		 model.addAttribute("countTag1", countTag1);
		 int countTag2 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 2).size();
		 model.addAttribute("countTag2", countTag2);
		 int countTag3 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 3).size();
		 model.addAttribute("countTag3", countTag3);
		 int countTag4 = pbService.findByPostStateAndPostTagOrderByCountViewDesc(2, 4).size();
		 model.addAttribute("countTag4", countTag4);
		 model.addAttribute("postTop", pbService.findTop3ByPostStateOrderByCountViewDesc(2));
		 
		 return "frontJsp/frontBlog/searchblog";//傳回搜尋結果
	}
	
	 
}
