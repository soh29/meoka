package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.CommentVO;
import org.zerock.domain.PagingVO;
import org.zerock.service.CommentService;
import org.zerock.util.IPUtils;

@RestController
@RequestMapping("/comment")
public class CommentController {

	@Inject
	private CommentService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CommentVO vo, HttpServletRequest req) {

		vo.setIpaddress(IPUtils.getClientIp(req));
		
		ResponseEntity<String> entity = null;
		//System.out.println("controller*****************vo.getBno(): " + vo.getBno());
	    
		try {
			service.addComment(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<CommentVO>> list(@PathVariable("bno") Integer bno) {

		ResponseEntity<List<CommentVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listComment(bno), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/{cno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("cno") Integer cno, @RequestBody CommentVO vo) {

		ResponseEntity<String> entity = null;
		try {
			vo.setCno(cno);
			service.modifyComment(vo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{cno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("cno") Integer cno) {

		ResponseEntity<String> entity = null;
		try {
			service.removeComment(cno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") Integer bno,
			@PathVariable("page") Integer page) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			/*
			 * Criteria cri = new Criteria(); cri.setPage(page);
			 * 
			 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(cri);
			 */
			PagingVO pagingVO = new PagingVO(service.count(bno),
											page,
											10);
			Map<String, Object> map = new HashMap<String, Object>();
			List<CommentVO> list = service.listCommentPage(bno, pagingVO);

			map.put("list", list);
/*
			int commentCount = service.count(bno);
			pageMaker.setTotalCount(commentCount);
*/
			map.put("pagingVO", pagingVO);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "replyComment", method = RequestMethod.POST)
	public ResponseEntity<String> reply(@RequestBody CommentVO vo, HttpServletRequest req) {

		vo.setIpaddress(IPUtils.getClientIp(req));
		
		ResponseEntity<String> entity = null;
		//System.out.println("controller*****************vo.getBno(): " + vo.getBno());
	    
		try {
			service.replyComment(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/lastPage/{bno}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getLastPage(@PathVariable("bno") Integer bno) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			/*
			 * Criteria cri = new Criteria(); cri.setPage(page);
			 * 
			 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(cri);
			 */
			int cntPerPage = 10;
			int total = service.count(bno);
			int lastPage = (int) Math.ceil((double) total/ (double)cntPerPage);
			PagingVO pagingVO = new PagingVO(total,
											lastPage,
											cntPerPage);
			Map<String, Object> map = new HashMap<String, Object>();
			List<CommentVO> list = service.listCommentPage(bno, pagingVO);

			map.put("list", list);
/*
			int commentCount = service.count(bno);
			pageMaker.setTotalCount(commentCount);
*/
			map.put("pagingVO", pagingVO);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
