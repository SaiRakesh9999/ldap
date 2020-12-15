package in.iaf.cdma.inventroy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.iaf.cdma.inventroy.model.UserData;
import in.iaf.cdma.inventroy.service.UserDataService;

@Controller
public class MainController {
	
	@Autowired
	UserDataService userDataService;

    @GetMapping("/admin**")
    public ModelAndView welcomePage(HttpServletRequest request){
    	ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			String username=userDetail.getUsername();
			
			UserData user=userDataService.findByUsername(username);
			request.getSession().setAttribute("userDetails", user);
			mav.addObject("username", userDetail.getUsername());
			mav.setViewName("welcome");
		}
		else {
			mav.setViewName("403");
		}

		
		return mav;
    }

    @GetMapping("/")
    public String loginPage(){
        System.out.println("Welcome Page");
        BCryptPasswordEncoder b= new BCryptPasswordEncoder();
		System.out.println(b.encode("Test@123"));
        return "login";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error",  required = false) String error,
								@RequestParam(value = "logout", required = false)String logout,
								HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("login");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(error != null){
				mav.addObject("error", "Invalid username and password!");
		}
		if(logout != null && auth!=null){
			request.getSession().removeAttribute("userDetails");
			new SecurityContextLogoutHandler().logout(request, response, auth);
			mav.addObject("msg","You have been logged out successfully");
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}


}
