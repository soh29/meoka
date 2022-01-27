package org.zerock.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.FoodThemeVO;
import org.zerock.domain.FoodVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.ThemeVO;
import org.zerock.persistence.FoodDAO;
import org.zerock.persistence.FoodThemeDAO;

@Service
public class FoodThemeServiceImpl implements FoodThemeService {

	@Inject
	private FoodThemeDAO dao;
	
	@Inject
	private FoodDAO foodDAO;
	

	@Override
	public List<FoodThemeVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	// 레시피 작성
	@Override
	public int write(FoodThemeVO vo) throws Exception {
		return dao.write(vo);
	}
	// 게시물 조회
	@Override
	public FoodThemeVO view(FoodThemeVO vo) throws Exception {

		return dao.view(vo);
	}

	// 게시물 삭제
	public void delete(FoodThemeVO vo) throws Exception {
		dao.delete(vo);
	}

	public List<FoodVO> getFoodList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return foodDAO.listSearch(scri);
	}

	@Override
	public List<String> getThemeTypes() {
		// TODO Auto-generated method stub
		return dao.getThemeTypes();
	}

	public int countSearch(SearchCriteria scri) throws Exception {
		return foodDAO.countSearch(scri);
	}

	@Override
	public List<ThemeVO> getThemes(String themeType) {
		// TODO Auto-generated method stub
		return dao.getThemes(themeType);
	}

	@Override
	public int foodThemeExists(FoodThemeVO vo) {
		// TODO Auto-generated method stub
		return dao.foodThemeExists(vo);
	}

	@Override
	public List<RecipeVO> listByTheme(ThemeVO themeVO) {
		// TODO Auto-generated method stub
		return dao.listByTheme(themeVO);
	}
}
