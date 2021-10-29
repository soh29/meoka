package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/recipe")
public class RecipeController {

	private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);

	@Inject
	private BoardService boardService;

	@RequestMapping(value = "/recipe-full-width")
	public void boardList(Model model) throws Exception {
		//logger.info("// /board/list");

		List<BoardVO> list = boardService.selectBoardList();

		//logger.info("// list.toString()=" + list.toString());

		model.addAttribute("list", list);
	}

}
