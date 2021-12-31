package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.CommentVO;
import org.zerock.domain.FoodThemeVO;
import org.zerock.domain.FoodVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.ThemeVO;
import org.zerock.service.FoodThemeService;

@Controller
@RequestMapping("/foodTheme/*")
public class FoodThemeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	FoodThemeService service;

	// 게시물 목록 리스트페이지 기능 추가
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		// logger.info("get list page");
		List<FoodThemeVO> list = service.list();
		model.addAttribute("list", list);
	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(Model model) throws Exception {

		List<String> themeTypes = service.getThemeTypes();
		// System.out.println("*********" + themeTypes.toString());
		model.addAttribute("themeTypes", themeTypes);
	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String getWrite(FoodThemeVO vo) throws Exception {

		System.out.println("******FoodThemeVO:" + vo.toString());
		service.write(vo);
		return "redirect:/foodTheme/list";
	}

	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(FoodThemeVO vo, Model model) throws Exception {

		FoodThemeVO foodThemeVO = service.view(vo);
		model.addAttribute("view", foodThemeVO);
		logger.info(model.toString());
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(FoodThemeVO vo) throws Exception {

		service.delete(vo);
		System.out.println("음식테마 삭제 완료");

		return "redirect:/foodTheme/list";
	}

	// 게시물 삭제
	@RequestMapping(value = "/foodList", method = RequestMethod.GET)
	public void getFoodList(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {

		if (scri.getSearchType() == null)
			scri.setSearchType("t");
		if (scri.getKeyword() == null)
			scri.setKeyword("");

		// logger.info("get list page");

		List<FoodVO> list = service.getFoodList(scri);
		model.addAttribute("list", list);

		System.out.println("list************/" + list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.countSearch(scri));

		System.out.println("PAGEMAKER: " + pageMaker.toString());
		model.addAttribute("pageMaker", pageMaker);
	}

	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/foodListSearch", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("get list search");

		List<FoodVO> list = service.getFoodList(scri);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		// pageMaker.setTotalCount(service.listCount());
		pageMaker.setTotalCount(service.countSearch(scri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	
	@RequestMapping(value = "/themes", method = RequestMethod.GET)
	public ResponseEntity<List<ThemeVO>> getThemeList(@RequestParam("themeType") String themeType) throws Exception {
		// logger.info("get list page");
		ResponseEntity<List<ThemeVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.getThemes(themeType), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/foodThemeExists", method = RequestMethod.GET)
	public ResponseEntity<Integer> foodThemeExists(FoodThemeVO vo) throws Exception {
		// logger.info("get list page");
		ResponseEntity<Integer> entity = null;
		try {
			entity = new ResponseEntity<>(service.foodThemeExists(vo), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;

	}
}
