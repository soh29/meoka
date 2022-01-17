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
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.IngredientVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.RecipeDetailVO;
import org.zerock.domain.RecipeRequest;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UtensilVO;
import org.zerock.domain.ValuationVO;
import org.zerock.service.IngredientService;
import org.zerock.service.RecipePointService;
import org.zerock.service.UtensilService;
import org.zerock.service.ValuationService;

@Controller
@RequestMapping("/rec/*")
public class RecipePointController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	RecipePointService service;


	// 게시물 목록 리스트페이지 기능 추가
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	      
	      if(scri.getSearchType() == null)
	         scri.setSearchType("t");
	      if(scri.getKeyword() == null)
	         scri.setKeyword("");
	      
	      //logger.info("get list page");

	      List<RecipeVO> list = service.listSearch(scri);
	      model.addAttribute("list", list);

	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(scri);
	      pageMaker.setTotalCount(service.countSearch(scri));
	      
	      
	      System.out.println("PAGEMAKER: " + pageMaker.toString());
	      model.addAttribute("pageMaker", pageMaker);
	   }
	   
	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/listSearch", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("get list search");

		List<RecipeVO> list = service.listSearch(scri);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		// pageMaker.setTotalCount(service.listCount());
		pageMaker.setTotalCount(service.countSearch(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

}
