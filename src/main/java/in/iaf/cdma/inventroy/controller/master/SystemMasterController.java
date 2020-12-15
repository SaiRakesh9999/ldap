package in.iaf.cdma.inventroy.controller.master;

import javax.persistence.PersistenceException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.iaf.cdma.inventroy.model.SystemMaster;
import in.iaf.cdma.inventroy.model.UserData;
import in.iaf.cdma.inventroy.service.SystemMasterService;

@Controller
@RequestMapping("/master")
public class SystemMasterController {
	
	@Autowired
	SystemMasterService systemMasterService;
	
	@GetMapping("/systems")
	public ModelAndView systemPage(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		if(userDetails!=null && userDetails.getRoleId().getRoleName().equals("ADMIN")) {
			mav.addObject("systems", systemMasterService.findAll());
			mav.setViewName("system");
		}
		else {
			mav.setViewName("redirect:/login?logout");
		}
		return mav;
	}

	@PostMapping("/addsystem")
	public ModelAndView saveSystem(@ModelAttribute("systemMaster") SystemMaster systemMaster,
			HttpServletRequest request,RedirectAttributes rd) {
		ModelAndView mav= new ModelAndView();
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		if(userDetails!=null) {
			try {
			systemMasterService.save(systemMaster);
			rd.addFlashAttribute("msg", "Successfully added System");
			}
			catch (PersistenceException p) {
				rd.addFlashAttribute("msg", "System Name "+systemMaster.getSystemName()+" is already exists.");
			}
			catch (Exception e) {
				rd.addFlashAttribute("msg", "Something went wrong try again");
			}
			mav.setViewName("redirect:/master/systems");
		}
		else {
			mav.setViewName("redirect:/login?logout");
		}
		return mav;
	}
	
	@RequestMapping(value= {"deletesystem"}, method=RequestMethod.GET)
	public ModelAndView deleteUser(@RequestParam("systemId") Integer systemId, HttpServletRequest request,
			RedirectAttributes redir) {
		ModelAndView mav=new ModelAndView();
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		if(userDetails!=null) {
			systemMasterService.delete(systemId);
			redir.addFlashAttribute("msg", "System deleted successfully!");
		}
		mav.setViewName("redirect:/master/systems");
		return mav;
	}
	
}
