package in.iaf.cdma.inventroy.controller.inventory;

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

import in.iaf.cdma.inventroy.model.InventoryMaster;
import in.iaf.cdma.inventroy.model.UserData;
import in.iaf.cdma.inventroy.service.InventoryMasterService;
import in.iaf.cdma.inventroy.service.SystemMasterService;

@Controller
@RequestMapping("/inventory")
public class InventoryMasterController {
	
	@Autowired
	InventoryMasterService inventoryMasterService;
	
	@Autowired
	SystemMasterService systemMasterService;
	
	
	@GetMapping("/inventoryfrom")
	public ModelAndView inventroyFormPage(HttpServletRequest request,@RequestParam(required=false) Integer invId) {
		ModelAndView mav=new ModelAndView();
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		if(userDetails!=null) {
			mav.addObject("systems", systemMasterService.findAll());
			mav.setViewName("inventoryform");
			if(invId!=null) {
				mav.addObject("inventoryMaster", inventoryMasterService.find(invId));
			}
		}
		else {
			mav.setViewName("redirect:/login?logout");
		}
		return mav;
	}

	
	@GetMapping("/inventorylist")
	public ModelAndView inventroyPage(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		if(userDetails!=null) {
			mav.addObject("inventoryList", inventoryMasterService.findAll());
			mav.setViewName("inventory");
		}
		else {
			mav.setViewName("redirect:/login?logout");
		}
		return mav;
	}

	@PostMapping("/addinventory")
	public ModelAndView saveSystem(@ModelAttribute("inventoryMaster") InventoryMaster inventoryMaster,
			HttpServletRequest request,RedirectAttributes rd) {
		ModelAndView mav= new ModelAndView();
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		if(userDetails!=null) {
			try {
			InventoryMaster inv=inventoryMasterService.findBySystemSystemIdAndSubSystemSubSystemIdAndItemSerailNo(inventoryMaster.getSystem().getSystemId(), inventoryMaster.getSubSystem().getSubSystemId(), inventoryMaster.getItemSerailNo());
				if(inv!=null && inventoryMaster.getInvId()==null) {
					rd.addFlashAttribute("msg", "Select System with Sub System and Item Serial No already exists");
					mav.setViewName("redirect:/inventory/inventoryfrom");
					rd.addFlashAttribute("inventoryMaster", inventoryMaster);
				}
				else {
					inventoryMasterService.save(inventoryMaster);
					rd.addFlashAttribute("msg", "Successfully added Inventory Item");
					mav.setViewName("redirect:/inventory/inventorylist");
				}
			}
			
			catch (Exception e) {
				rd.addFlashAttribute("msg", "Something went wrong try again");
				mav.setViewName("redirect:/inventory/inventoryfrom");
				rd.addFlashAttribute("inventoryMaster", inventoryMaster);
			}
			
		}
		else {
			mav.setViewName("redirect:/login?logout");
		}
		return mav;
	}
	
	@RequestMapping(value= {"deleteinventory"}, method=RequestMethod.GET)
	public ModelAndView deleteUser(@RequestParam("invId") Integer invId, HttpServletRequest request,
			RedirectAttributes redir) {
		ModelAndView mav=new ModelAndView();
		UserData userDetails=(UserData) request.getSession().getAttribute("userDetails");
		if(userDetails!=null) {
			inventoryMasterService.delete(invId);
			redir.addFlashAttribute("msg", "Item deleted successfully!");
		}
		mav.setViewName("redirect:/inventory/inventorylist");
		return mav;
	}
	
}
