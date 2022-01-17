package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.PageMaker;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.ThemeVO;
import org.zerock.service.ThemeService;

@Controller
@RequestMapping("/theme/*")
public class ThemeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	ThemeService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {

		if (scri.getSearchType() == null)
			scri.setSearchType("t");
		if (scri.getKeyword() == null)
			scri.setKeyword("");

		List<ThemeVO> list = service.listSearch(scri);
		//list.addAll(service.list());
		model.addAttribute("list", list);
		//List<ThemeVO> list2 = service.list();
		//model.addAttribute("list2", list2);

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.countSearch(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {

	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public void getWrite(ThemeVO themeVO) throws Exception {
		service.write(themeVO);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(int themeNo) throws Exception {
		service.delete(themeNo);
		return "redirect:/theme/list";
	}

	@RequestMapping(value = "/listSearch", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("get list search");

		List<ThemeVO> list = service.listSearch(scri);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		// pageMaker.setTotalCount(service.listCount());
		pageMaker.setTotalCount(service.countSearch(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

}
