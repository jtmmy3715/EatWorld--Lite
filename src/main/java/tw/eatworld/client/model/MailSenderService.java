package tw.eatworld.client.model;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

@Service
public class MailSenderService {

	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
    private TemplateEngine templateEngine;
	
	public void sendSimpleMail(String toEmail, String subject, String content){
        SimpleMailMessage simpleMessage = new SimpleMailMessage();
        String fromEmail = "EatWorld2022@gmail.com";
        simpleMessage.setFrom(fromEmail);
        simpleMessage.setTo(toEmail);
        simpleMessage.setSubject(subject);
        simpleMessage.setText(content);
        
        mailSender.send(simpleMessage);
        System.out.println("發信成功");
    }
	
	public void sendVerifyMail(String toEmail, String name, String uuid) {
		
		
		System.out.println("驗證信即將發送");
		 try {
		Context context = new Context();
	    context.setVariable("name",name);
	    context.setVariable("uuid",uuid);
        String templateContent = templateEngine.process("registerTemplate2", context); //把資料傳進模板
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
        mimeMessageHelper.setTo(toEmail);
       
		mimeMessageHelper.setSubject("EatWorld註冊驗證信");
        mimeMessageHelper.setText(templateContent,true);
        mimeMessageHelper.setFrom(new InternetAddress("EatWorld吃窩 <EatWorld2022@gmail.com>"));
        
        mailSender.send(mimeMessage);
        System.out.println("驗證信發信成功");
		 } catch (MessagingException e) {
			 System.out.println("驗證信發信失敗");
				e.printStackTrace();
			}
 
    }
	
	public void sendPwdMail(String toEmail, String name, String url) throws MessagingException {
		
		Context context = new Context();
	    context.setVariable("name",name);
	    context.setVariable("url",url);
        String templateContent = templateEngine.process("resetPwdTemplate", context); //把資料傳進模板
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
        mimeMessageHelper.setTo(toEmail);
        mimeMessageHelper.setSubject("EatWorld重設密碼信");
        mimeMessageHelper.setText(templateContent,true);
        mimeMessageHelper.setFrom(new InternetAddress("EatWorld吃窩 <EatWorld2022@gmail.com>"));
        
        mailSender.send(mimeMessage);
        System.out.println("PwdMail發信成功");
    }


}
