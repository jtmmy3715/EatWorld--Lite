package tw.eatworld.client.model;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.eatworld.store.model.StoreMember;
import tw.eatworld.store.model.StoreMemberService;

@Service
public class AuthUserDetailsService implements UserDetailsService {

	@Autowired
	private ClientMemberService cService;

	@Autowired
	private StoreMemberService sService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		String authority ="";
		ClientMember user = cService.checkUsername(username);
		if (user == null) {
			StoreMember store = sService.findBysUsername(username);
			authority = "store";
			if (store == null) {
				throw new UsernameNotFoundException("此用戶不存在");
			} else {
				return new User(store.getsUsername(), store.getsPwd(),
						AuthorityUtils.commaSeparatedStringToAuthorityList(authority));
			}

		} else {
			switch (user.getClientPermission()) {
			case "0":
				authority = "user";
				break;
				
			case "1":
				authority = "active";
				break;
				
			case "2":
				authority = "admin";
				break;
			}
			return new User(user.getClientUsername(), user.getClientPassword(),
					AuthorityUtils.commaSeparatedStringToAuthorityList(authority));
		}
	}
}
