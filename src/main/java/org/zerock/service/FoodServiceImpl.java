package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.FoodVO;
import org.zerock.domain.RecipeDetailVO;
import org.zerock.domain.RecipeRequest;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.FoodDAO;

@Service
public class FoodServiceImpl implements FoodService {

	@Inject
	private FoodDAO dao;

	@Override
	public List<FoodVO> list() throws Exception {
		return dao.list();
	}

	// 레시피 작성
	@Override
	public int write(FoodVO vo) throws Exception {
		return dao.write(vo);
	}
	// 게시물 조회
	@Override
	public FoodVO view(int foodNo) throws Exception {

		return dao.view(foodNo);
	}

	// 게시물 삭제
	public void delete(int foodNo) throws Exception {
		dao.delete(foodNo);
	}

	// 목록+페이징+검색
	public List<FoodVO> listSearch(SearchCriteria scri) throws Exception {
		return dao.listSearch(scri);
	}

	// 게시물 검색
	public int countSearch(SearchCriteria scri) throws Exception {
		return dao.countSearch(scri);
	}

	
}
