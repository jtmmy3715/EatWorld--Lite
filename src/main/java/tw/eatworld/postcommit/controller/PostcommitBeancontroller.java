package tw.eatworld.postcommit.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.eatworld.postcommit.model.PostcommitBean;
import tw.eatworld.postcommit.model.PostcommitBeanService;

@Controller
@RequestMapping("/frontBlog")
public class PostcommitBeancontroller {
	
	@Autowired
	private PostcommitBeanService pcService;
	
	@PostMapping("/commitsave")
	@ResponseBody
	public PostcommitBean saveCommit(@RequestBody PostcommitBean commitBean) {
		commitBean.setCommitDate(new Date());
		return pcService.savecommit(commitBean);
	}
	
	 @GetMapping("/deletecommit/{postcommitId}")
	 public String deletePost(@PathVariable("postcommitId") Integer postcommitId) {
		 PostcommitBean commitBean = pcService.findById(postcommitId);
		 int postId = commitBean.getPostBean().getPostId();
		 pcService.delcommit(postcommitId);
	    return "redirect:/frontBlog/serchPostForm/"+postId;
	 }

}
