package tw.eatworld.post.model;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

@Service
public class PostMailSenderService {

	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
    private TemplateEngine templateEngine;
	
	
	public void sendPostStateMail(String toEmail, String name, String ptitle, String pstate, String pmsg) {
		
		
		System.out.println("信即將發送");
		 try {
//		String fromEmail = "EatWorld2022@gmail.com";
		Context context = new Context();
	    context.setVariable("name",name);//廠商名稱
	    context.setVariable("ptitle",ptitle);
	    context.setVariable("pstate",pstate);
	    context.setVariable("pmsg",pmsg);
        String templateContent = templateEngine.process("postStateTemplate", context); //把資料傳進模板
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
        mimeMessageHelper.setTo(toEmail);
       
		mimeMessageHelper.setSubject("EatWorld文章審核結果通知");
        mimeMessageHelper.setText(templateContent,true);
        mimeMessageHelper.setFrom(new InternetAddress("EatWorld吃窩 <EatWorld2022@gmail.com>"));
        
        mailSender.send(mimeMessage);
        System.out.println("發信成功");
		 } catch (MessagingException e) {
			 System.out.println("發信失敗");
				e.printStackTrace();
			}
 
    }
	
}
