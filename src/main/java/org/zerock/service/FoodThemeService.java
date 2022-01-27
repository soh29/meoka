package org.zerock.service;

import java.util.List;

import org.zerock.domain.FoodThemeVO;
import org.zerock.domain.FoodVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.ThemeVO;

public interface FoodThemeService {

	public List<FoodThemeVO> list(SearchCriteria scri) throws Exception;

	// 레피시 작성
	public int write(FoodThemeVO vo) throws Exception;
	// 게시물 조회
	public FoodThemeVO view(FoodThemeVO vo) throws Exception;
	// 게시물 삭제
	public void delete(FoodThemeVO vo) throws Exception;


	public List<String> getThemeTypes();

	public List<FoodVO> getFoodList(SearchCriteria scri) throws Exception;
	
	public int countSearch(SearchCriteria scri) throws Exception;

	public List<ThemeVO> getThemes(String themeType);

	public int foodThemeExists(FoodThemeVO vo);

	public List<RecipeVO> listByTheme(ThemeVO themeVO);

}
