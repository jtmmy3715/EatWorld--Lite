package tw.eatworld.client.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class CustomOAuth2User implements OAuth2User {

	private OAuth2User oauth2User;
    
    public CustomOAuth2User(OAuth2User oauth2User) {
        this.oauth2User = oauth2User;
    }
 
    @Override
    public Map<String, Object> getAttributes() {
        return oauth2User.getAttributes();
    }
 
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
    	List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
    	list.add(new SimpleGrantedAuthority("active"));
    	return list;
    }
    
//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//    	return oauth2User.getAuthorities();
//    }
 
    @Override
    public String getName() {  
        return oauth2User.getAttribute("name");
    }
 
    public String getEmail() {
        return oauth2User.<String>getAttribute("email");     
    }
    
    public String getPicture() {
        return oauth2User.<String>getAttribute("picture");     
    }

}
