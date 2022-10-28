package tw.eatworld.client.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.eatworld.store.model.StoreMember;
import tw.eatworld.store.model.StoreMemberService;

@Component
@SessionAttributes(names = { "user" })
public class LoginHandler implements AuthenticationSuccessHandler {

	@Autowired
	private ClientMemberService cService;

	@Autowired
	private StoreMemberService sService;
	
	@Override 
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		System.out.println("SuccessHandler");
		User user = (User) authentication.getPrincipal();
		
		String page = "";
		String authority = user.getAuthorities().toString();
		System.out.println(authority);
		switch (authority) {
		case "[user]":
			page = "/EatWorld/";
			ClientMember client = cService.checkUsername(user.getUsername());
			request.getSession().setAttribute("user", client);
			break;
			
		case "[active]":
			page = "/EatWorld/";
			ClientMember clientActive = cService.checkUsername(user.getUsername());
			request.getSession().setAttribute("user", clientActive);
			break;
			
		case "[admin]":
			page = "/EatWorld/backendAdmin";
			ClientMember admin = cService.checkUsername(user.getUsername());
			request.getSession().setAttribute("user", admin);
			break;
			
		case "[store]":
			page = "/EatWorld/backendStore";
			StoreMember store = sService.findBysUsername(user.getUsername());
			request.getSession().setAttribute("user", store);
			break;
		}
		System.out.println(page);
		response.sendRedirect(page);
		
	}

}
