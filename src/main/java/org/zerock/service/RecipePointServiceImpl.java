package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.RecipeDetailVO;
import org.zerock.domain.RecipeRequest;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.RecipePointDAO;

@Service
public class RecipePointServiceImpl implements RecipePointService {

	@Inject
	private RecipePointDAO dao;

	@Override
	public List<RecipeVO> list() throws Exception {

		return dao.list();

	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}

	// 게시물 목록 + 페이징
	@Override
	public List<RecipeVO> listPage(Criteria cri) throws Exception {
		 return dao.listPage(cri);
	}

	public int listCount() throws Exception {
		return dao.listCount();

	}

	// 목록+페이징+검색
	public List<RecipeVO> listSearch(SearchCriteria scri) throws Exception {
		return dao.listSearch(scri);
	}

	// 게시물 검색
	public int countSearch(SearchCriteria scri) throws Exception {
		return dao.countSearch(scri);
	}




}
