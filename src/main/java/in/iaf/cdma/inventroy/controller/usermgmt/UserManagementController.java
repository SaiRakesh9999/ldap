package in.iaf.cdma.inventroy.controller.usermgmt;

import java.util.List;

import javax.persistence.PersistenceException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.iaf.cdma.inventroy.model.RoleMaster;
import in.iaf.cdma.inventroy.model.UserData;
import in.iaf.cdma.inventroy.service.RoleMasterService;
import in.iaf.cdma.inventroy.service.UserDataService;

@Controller
@RequestMapping("/user")
public class UserManagementController {
	
	@Autowired
	RoleMasterService roleMasterService;
	
	@Autowired
	UserDataService userDataService;
	
	@RequestMapping(value= {"/usermanagement"}, method=RequestMethod.GET)
	public ModelAndView userManagement(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav= new ModelAndView("/usermanagement/usermgmt");
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		
		if(userDetails!=null && userDetails.getRoleId().getRoleName().equals("ADMIN")) {
			List<UserData> userList=userDataService.findAll();
			mav.addObject("users", userList);
			List<RoleMaster> roleList=roleMasterService.findAll();
			mav.addObject("roles", roleList);
			mav.addObject("username", userDetails.getUserName());
		}
		else {
			mav.setViewName("redirect:/login?logout");
		}
		return mav;
	}
	
	@RequestMapping(value= {"adduser"}, method=RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("userData")UserData userData, 
			HttpServletRequest req, RedirectAttributes redir) {
		ModelAndView mav= new ModelAndView();
		UserData userDetails=(UserData) req.getSession().getAttribute("userDetails");
		if(userDetails!=null) {
			try {
			BCryptPasswordEncoder b= new BCryptPasswordEncoder();
			userData.setPassword(b.encode(userData.getPassword()));
			userDataService.save(userData);
				redir.addFlashAttribute("msg", "User added successfully!");
			}
			catch(PersistenceException p ) {
				String msg="Username Already exist... try with some other name";
				redir.addFlashAttribute("userexist", msg);
			}
		 mav.setViewName("redirect:/user/usermanagement");
		}
		else {
			mav.setViewName("redirect:/login?logout");
		}
		return mav;
	}
	
	
	
	/*This Method for checking username*/
	@RequestMapping(value="/checkusername", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody Boolean check(@RequestParam("username") String username) {
		UserData user=userDataService.findByUsername(username);
		Boolean flag=false;
		if(user!=null) {
			flag=true;
		}
		return flag;
	}
	
	@RequestMapping(value= {"deleteuser"}, method=RequestMethod.GET)
	public ModelAndView deleteUser(@RequestParam("username") String username, HttpServletRequest request,
			RedirectAttributes redir) {
		ModelAndView mav=new ModelAndView();
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		if(userDetails!=null) {
			userDataService.delete(username);
			redir.addFlashAttribute("msg", "User deleted successfully!");
		}
		mav.setViewName("redirect:/user/usermanagement");
		return mav;
	}
}
