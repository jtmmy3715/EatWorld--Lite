package tw.eatworld.client.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
	@Autowired
	private ClientMemberService cService;
	
	@Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User user =  super.loadUser(userRequest);
        String email = user.<String>getAttribute("email");
        boolean exist = cService.checkEmail(email);
        if(exist) {
        	System.out.println("用google創建帳號");
        	String uName =  email.replace("@gmail.com","");
        	String name = user.<String>getAttribute("name");
        	SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
    		String clientAdddate = sdFormat.format(new Date());
    		String clientLogo = user.<String>getAttribute("picture");
    		String clientPermission = "1";
    		ClientMemberDetail detail = new ClientMemberDetail(clientAdddate, clientLogo);
    		ClientMember client = new ClientMember(uName, "null", name, email, clientPermission, detail);
    		cService.saveClient(client);
        }
        System.out.println(user.getAuthorities());
        System.out.println("經過google第三方登入");
        return new CustomOAuth2User(user);
    }
	

}
