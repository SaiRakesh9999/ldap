package in.iaf.cdma.inventroy.controller.master;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.iaf.cdma.inventroy.model.SubSystemMaster;
import in.iaf.cdma.inventroy.model.UserData;
import in.iaf.cdma.inventroy.service.SubSystemMasterService;
import in.iaf.cdma.inventroy.service.SystemMasterService;

@Controller
@RequestMapping("/master")
public class SubSystemMasterController {

	@Autowired
	SubSystemMasterService subSystemMasterService;
	
	@Autowired
	SystemMasterService systemMasterService;
	
	@GetMapping("/subsystems")
	public ModelAndView subSystemPage(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		if(userDetails!=null && userDetails.getRoleId().getRoleName().equals("ADMIN")) {
			mav.addObject("subsystems", subSystemMasterService.findAll());
			mav.addObject("systems", systemMasterService.findAllActive());
			mav.setViewName("subsystem");
		}
		else {
			mav.setViewName("redirect:/login?logout");
		}
		return mav;
	}

	@PostMapping("/addsubsystem")
	public ModelAndView saveSubSubSystem(@ModelAttribute("subSystemMaster") SubSystemMaster subSystemMaster,
			HttpServletRequest request,RedirectAttributes rd) {
		ModelAndView mav= new ModelAndView();
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		if(userDetails!=null) {
			
			try {
				SubSystemMaster sub=subSystemMasterService.findBySubSystemNameAndSystemId(subSystemMaster.getSubSystemName(), subSystemMaster.getSystemMaster().getSystemId());
				if(sub!=null && sub.isActive()==subSystemMaster.isActive()) {
					rd.addFlashAttribute("msg", "Enteried Sub System already exist with selected system");
				}
				else {
				subSystemMasterService.save(subSystemMaster);
				rd.addFlashAttribute("msg", "Successfully added Sub System");
				}
			}
			catch (Exception e) {
				rd.addFlashAttribute("msg", "Something went wrong try again");
			}
			mav.setViewName("redirect:/master/subsystems");
		}
		else {
			mav.setViewName("redirect:/login?logout");
		}
		return mav;
	}
	
	@RequestMapping(value= {"deletesubsystem"}, method=RequestMethod.GET)
	public ModelAndView deleteUser(@RequestParam("subSystemId") Integer subSystemId, HttpServletRequest request,
			RedirectAttributes redir) {
		ModelAndView mav=new ModelAndView();
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		if(userDetails!=null) {
			subSystemMasterService.delete(subSystemId);
			redir.addFlashAttribute("msg", "Sub System deleted successfully!");
		}
		mav.setViewName("redirect:/master/subsystems");
		return mav;
	}
	
	@PostMapping("findbysystemId")
	public @ResponseBody List<SubSystemMaster> findBySystem(@RequestParam("systemId") Integer systemId){
		return subSystemMasterService.findBySystemId(systemId);
	}
	
	
}
