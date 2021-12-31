package org.zerock.service;

import java.util.List;

import org.zerock.domain.FoodVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;

public interface FoodService {

	public List<FoodVO> list() throws Exception;

	// 레피시 작성
	public int write(FoodVO vo) throws Exception;
	// 게시물 조회
	public FoodVO view(int foodNo) throws Exception;
	// 게시물 삭제
	public void delete(int foodNo) throws Exception;
	
	// 목록+페이징+검색
	public List<FoodVO> listSearch(SearchCriteria scri) throws Exception;

	// 게시물 검색
	public int countSearch(SearchCriteria scri) throws Exception;
}
