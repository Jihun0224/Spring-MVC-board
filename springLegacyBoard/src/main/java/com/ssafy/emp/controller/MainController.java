package com.ssafy.emp.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.emp.model.Emp;
import com.ssafy.emp.service.EmpService;


@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private EmpService empService;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("/register")
	public String register() {
		return "index";
	}
	@PostMapping("/register")
	public String register(Emp emp, Model model) throws Exception {
		logger.debug("emp info : {}", emp);
		empService.registerEmp(emp);
		return "redirect:/list";
	}
	@GetMapping("/list")
	public ModelAndView list(@RequestParam Map<String, Object> map) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<Emp> list = empService.listEmp(map);
		mav.addObject("emps", list);
		mav.addObject("key", map.get("key"));
		mav.addObject("word", map.get("word"));
		mav.setViewName("list");
		return mav;
	}
	@GetMapping("/delete")
	public String delete(@RequestParam("eno") int eno, Model model, RedirectAttributes redirectAttributes)
		throws Exception {
		empService.deleteEmp(eno);
		redirectAttributes.addFlashAttribute("msg", "사원삭제 성공!!!");
		return "redirect:/list";
	}
	@GetMapping("/modify")
	public ModelAndView modify(@RequestParam("eno") int eno) throws Exception {
		ModelAndView mav = new ModelAndView();
		Emp emp = empService.getEmp(eno);
		mav.addObject("emp", emp);
		mav.setViewName("modify");
		return mav;
	}
	@PostMapping("/modify")
	public String modify(Emp emp, Model model, RedirectAttributes redirectAttributes)
			throws Exception {
		logger.info("수정 {}", emp);
		empService.updateEmp(emp);
		redirectAttributes.addFlashAttribute("msg", "글수정 성공!!!");
		return "redirect:/list";
	}
}
