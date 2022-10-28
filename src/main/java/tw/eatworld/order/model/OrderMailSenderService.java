package tw.eatworld.order.model;

import java.io.File;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
@Service
public class OrderMailSenderService {

	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
    private TemplateEngine templateEngine;
	
	//private static final String FROM_MAIL = "EatWorld2022@gmail.com";
	/*
	* @param toMail 收件人
	* @param subject 主題
	* @param order_sum 訂單總數
	* @param template 模板
	* @param allOrderDetail 全訂單明細資訊
	* @param orderid 訂單ID
	* @param ordertime 訂單時間
	*/

	public void sendOrderHtmlMail(String toMail, String subject,
			Integer order_sum,String template,List<OrderDetailBean> allOrderDetail,String orderid,String ordertime,List<OrderDetailBean> allOrderDetailCombo) {

		MimeMessage message = mailSender.createMimeMessage();
		try {
			Context context = new Context();
			context.setVariable("order_sum", order_sum);
			context.setVariable("orderid", orderid);
			context.setVariable("ordertime", ordertime);
			context.setVariable("allOrderDetail", allOrderDetail);
			context.setVariable("allOrderDetailCombo", allOrderDetailCombo);
			
			String templateContent = templateEngine.process(template, context);
			// 第二个参数true表示需要创建一个multipart message
//			File file = new File("/resources/images/logo.png");
//			FileSystemResource resource = new FileSystemResource(file);
			
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom(new InternetAddress("EatWorld吃窩 <EatWorld2022@gmail.com>"));
			helper.setTo(toMail);
			helper.setSubject(subject);
			helper.setText(templateContent, true);
//			helper.addInline("logo_id", resource);
			mailSender.send(message);
			System.out.println("HTML發信成功");
		} catch (MessagingException e){
			System.out.println("發送郵件錯誤");
		}
	}



}




