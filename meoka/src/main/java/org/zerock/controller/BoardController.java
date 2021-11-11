package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PagingVO;
import org.zerock.domain.UserVO;
import org.zerock.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService boardService;

	@RequestMapping(value = "/list")
	public ModelAndView boardList(PagingVO vo, Model model, @RequestParam(defaultValue = "title") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") String nowPage,
			@RequestParam(defaultValue = "10") String cntPerPage) throws Exception {
		logger.info("// /board/list");

		// List<BoardVO> list = boardService.selectBoardList();
		// logger.info("// list.toString()=" + list.toString());
		// model.addAttribute("list", list);

		int count = boardService.countArticle(searchOption, keyword);

		vo = new PagingVO(count, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		List<BoardVO> list = boardService.listAll(searchOption, keyword, vo.getStart(), vo.getEnd());

		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		mav.addObject("paging", vo);
		mav.addObject("map", map);
		mav.setViewName("board/list");
		return mav;
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register(Model model) throws Exception {
		logger.info("// /board/register");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(Model model, BoardVO vo) throws Exception {
		logger.info("// /board/register");
		// System.out.println("vo:****" + vo);

		boardService.register(vo);

		return "redirect:/board/list";

	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, Model model, HttpServletRequest req) throws Exception {
		logger.info("// /board/readPage");
		model.addAttribute(boardService.read(bno));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modify(@RequestParam("bno") int bno, Model model) throws Exception {
		logger.info("// /board/modify");
		model.addAttribute(boardService.read(bno));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPost(BoardVO boardVO, Model model) throws Exception {
		logger.info("// /board/modifyPost vo: " + boardVO);
		boardService.modify(boardVO);
		return "redirect:/board/readPage?bno=" + boardVO.getBno();

	}

	@RequestMapping(value = "/deletePage", method = RequestMethod.GET)
	public String delete(@RequestParam("bno") int bno, Model model) throws Exception {
		logger.info("// /board/delete");
		boardService.delete(bno);
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/replyPage", method = RequestMethod.GET)
	public void reply(@RequestParam("bno") int bno, Model model) throws Exception {

		model.addAttribute(boardService.read(bno));
		logger.info("// /board/reply");
	}

	@RequestMapping(value = "/replyPage", method = RequestMethod.POST)
	public String replyPost(Model model, BoardVO vo) throws Exception {
		logger.info("// /board/replyPost");

		boardService.reply(vo);
		return "redirect:/board/list";
	}

	@RequestMapping("/getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno") Integer bno) throws Exception {

		return boardService.getAttach(bno);
	}
}
