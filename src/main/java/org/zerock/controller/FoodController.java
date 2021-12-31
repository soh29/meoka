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
import org.zerock.domain.FoodVO;
import org.zerock.domain.IngredientVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.RecipeDetailVO;
import org.zerock.domain.RecipeRequest;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UtensilVO;
import org.zerock.domain.ValuationVO;
import org.zerock.service.FoodService;

@Controller
@RequestMapping("/food/*")
public class FoodController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	FoodService service;

	// 게시물 목록 리스트페이지 기능 추가
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	      
	      if(scri.getSearchType() == null)
	         scri.setSearchType("t");
	      if(scri.getKeyword() == null)
	         scri.setKeyword("");
	      
	      //logger.info("get list page");

	      List<FoodVO> list = service.listSearch(scri);
	      model.addAttribute("list", list);
	      
	      
	      System.out.println("list************/"+list);

	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(scri);
	      pageMaker.setTotalCount(service.countSearch(scri));
	      
	      
	      System.out.println("PAGEMAKER: " + pageMaker.toString());
	      model.addAttribute("pageMaker", pageMaker);
	   }
	   
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {

	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String getWrite(FoodVO vo) throws Exception {

		service.write(vo);
		return "redirect:/food/list";
	}

	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("foodNo") int foodNo, Model model) throws Exception {

		FoodVO vo = service.view(foodNo);
		model.addAttribute("view", vo);
		System.out.println("실행중입니다.");
		logger.info(model.toString());
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("foodNo") int foodNo) throws Exception {

		System.out.println("*****foodNo : ******" + foodNo);
		service.delete(foodNo);
		System.out.println("음식 삭제 완료");

		return "redirect:/food/list";
	}
	
	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/listSearch", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("get list search");

		List<FoodVO> list = service.listSearch(scri);
		model.addAttribute("list", list);


		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		// pageMaker.setTotalCount(service.listCount());
		pageMaker.setTotalCount(service.countSearch(scri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
}
