package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.FoodThemeVO;
import org.zerock.domain.FoodVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.ThemeVO;

public interface FoodThemeDAO {
	public List<FoodThemeVO> list() throws Exception;
	public int write(FoodThemeVO vo) throws Exception;
	public FoodThemeVO view(FoodThemeVO vo) throws Exception;
	public void delete(FoodThemeVO vo) throws Exception;

	public List<String> getThemeTypes();
	public List<FoodVO> getFoodList(SearchCriteria scri) throws Exception;
	// 게시물 검색
	public int countSearch(SearchCriteria scri) throws Exception;
	public List<ThemeVO> getThemes(String themeType);
	public int foodThemeExists(FoodThemeVO vo);
}
