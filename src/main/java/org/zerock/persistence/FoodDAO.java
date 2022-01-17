package org.zerock.persistence;

import java.util.List;
import org.zerock.domain.FoodVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;

public interface FoodDAO {
	public List<FoodVO> list() throws Exception;
	public int write(FoodVO vo) throws Exception;
	public FoodVO view(int foodNo) throws Exception;
	public void delete(int foodNo) throws Exception;
	// 목록+페이징+검색
	public List<FoodVO> listSearch(SearchCriteria scri) throws Exception;
	// 게시물 검색
	public int countSearch(SearchCriteria scri) throws Exception;
}
