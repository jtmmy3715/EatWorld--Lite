package tw.eatworld.client.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;


@Component
@SessionAttributes(names = { "user" })
public class GoogleLoginHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Autowired
	private ClientMemberService cService;
	
	@Override 
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		System.out.println("GoogleLoginHandler");
		CustomOAuth2User oauthUser = (CustomOAuth2User) authentication.getPrincipal();
		System.out.println(oauthUser.getAuthorities());
		ClientMember client = cService.findByEmail(oauthUser.getEmail());
		request.getSession().setAttribute("googleUser", client);
		response.sendRedirect("/EatWorld/");
		
	}
	
	

}
