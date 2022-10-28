package tw.eatworld.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/backendAdmin").setViewName("backendJsp/index");
		registry.addViewController("/").setViewName("frontJsp/frontIndex");
		registry.addViewController("/backendStore").setViewName("backendJsp/storeIndex");
		registry.addViewController("/login").setViewName("frontJsp/frontClientMember/frontLogin");
		registry.addViewController("/register").setViewName("frontJsp/frontClientMember/frontRegister");
		registry.addViewController("/errorPage").setViewName("frontJsp/frontClientMember/errorPage");
	}
	
	@Override
	 public void addResourceHandlers(ResourceHandlerRegistry registry) {
	  registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	  registry.addResourceHandler("/images/**").addResourceLocations("/resources/images/");
	  registry.addResourceHandler("/css/**").addResourceLocations("/resources/css/");
	  registry.addResourceHandler("/icons/**").addResourceLocations("/resources/icons/");
	  registry.addResourceHandler("/plugins/**").addResourceLocations("/resources/plugins/");
	  registry.addResourceHandler("/js/**").addResourceLocations("/resources/js/");
	  registry.addResourceHandler("/assets/**").addResourceLocations("/resources/assets/");
	  registry.addResourceHandler("/photo/**").addResourceLocations("file:D:/upload/");
	 }


}
