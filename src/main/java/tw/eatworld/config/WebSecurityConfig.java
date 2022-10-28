package tw.eatworld.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import tw.eatworld.client.model.AuthUserDetailsService;
import tw.eatworld.client.model.CustomOAuth2UserService;
import tw.eatworld.client.model.GoogleLoginHandler;
import tw.eatworld.client.model.LoginHandler;


@SuppressWarnings("deprecation")
@EnableWebSecurity
@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthUserDetailsService auDetailService;
	
	@Autowired
	private LoginHandler loginHandler;
	
	@Autowired
	private LogoutSuccessHandler logoutHandler;
	
	@Autowired
	private CustomOAuth2UserService oauthUserService;
	
	@Autowired
	private GoogleLoginHandler googleLoginHandler;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		  .userDetailsService(auDetailService)
		  .passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
	}

	@Override //設定驗證範圍
	protected void configure(HttpSecurity http) throws Exception {
		http
		  .authorizeRequests()
		  .antMatchers(HttpMethod.GET,"/user/**").hasAnyAuthority("user","active")
		  .antMatchers(HttpMethod.GET,"/backendStore/**").hasAuthority("store")
		  .antMatchers(HttpMethod.GET,"/backendAdmin/**").hasAuthority("admin")
		  .antMatchers(HttpMethod.GET,"/front/**").hasAuthority("active")
//		  .antMatchers(HttpMethod.GET,"/clientMember/**").authenticated()
//		  .antMatchers(HttpMethod.GET,"/storeMember/**").authenticated()
//		  .antMatchers(HttpMethod.GET,"/booking/**").authenticated()
		  .antMatchers(HttpMethod.GET,"/backendBlog/**").authenticated()
		  .antMatchers(HttpMethod.GET,"/OrderController/**").authenticated()
		  //.antMatchers(HttpMethod.POST,"/OrderController/**").authenticated()
//		  .antMatchers(HttpMethod.GET,"/product/**").authenticated()
//		  .antMatchers(HttpMethod.GET,"/event/**").authenticated()
		  .anyRequest().permitAll()
		  .and()
		  .rememberMe().tokenValiditySeconds(86400).key("remember-key") //記住我設定
		  .and()
		  .csrf().disable()
		  .formLogin().loginPage("/login") 
		  .successHandler(loginHandler)
		  .failureForwardUrl("/loginError")
		  .and()
		  .oauth2Login().loginPage("/login") 
		  .userInfoEndpoint().userService(oauthUserService)
		  .and()
		  .successHandler(googleLoginHandler)
		  .and()
		  .logout()
		  .deleteCookies("JSESSIONID")
		  .logoutSuccessHandler(logoutHandler)
		  .and()
		  .exceptionHandling()
		  .accessDeniedPage("/errorPage");
	}
	
	

}
