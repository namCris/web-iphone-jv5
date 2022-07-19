package edu.poly.shop.controller.site;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.poly.shop.domain.Customer;
import edu.poly.shop.model.CustomerDto;
import edu.poly.shop.service.CustomerService;
import javassist.expr.NewArray;

@Controller
@RequestMapping("site/updateProfile")
public class SiteUpdateProfileController {
	@Autowired
	private CustomerService customerService;
	@RequestMapping("view")
	public String viewString (ModelMap model) {
		model.addAttribute("customer",new CustomerDto());
		return "site/customers/profile";
	}
	
	@PostMapping("saveOrUpdate/{customerId}")
	public ModelAndView saveOrUpdate(ModelMap model,@PathVariable("customerId") Long customerId,
			@Validated @ModelAttribute("customer") CustomerDto dto,BindingResult result) {
		Optional<Customer> optional = customerService.findById(customerId);
		if(result.hasErrors()) {
			return new ModelAndView("site/customers/profile");
		}
		if(optional.isPresent()) {
			Customer entity = optional.get();
			BeanUtils.copyProperties(dto, entity);//copy dto sang entity
			
			customerService.save(entity);//lưu
			model.addAttribute("message","You is successful!");
			
			return new ModelAndView("site/customers/profile",model);
		}
		return new ModelAndView("forward:/customers/registered",model);
		
	}
	//update profile
	@RequestMapping("update/{customerId}")
	public ModelAndView update(ModelMap model, @PathVariable("customerId") Long customerId) {
		Optional<Customer> optional = customerService.findById(customerId);
		CustomerDto dto = new CustomerDto();
		if(optional.isPresent()) {
			Customer cus = optional.get();
			BeanUtils.copyProperties(cus, dto);
			dto.setIsEdit(true);
			model.addAttribute("customer",dto);
			model.addAttribute("message","Customer is success");
			return new ModelAndView("site/customers/profile",model);
		}else {
			model.addAttribute("message","Customer is not success");
		}
		return new ModelAndView("forward:/site/updateProfile/view",model);
	}
	

}
