package org.zerock.persistence;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.FoodThemeVO;
import org.zerock.domain.FoodVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.ThemeVO;

@Repository
public class FoodThemeDAOImpl implements FoodThemeDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "org.zerock.mapper.FoodThemeMapper";

	@Override
	public List<FoodThemeVO> list(SearchCriteria scri) throws Exception {
		return session.selectList(namespace + ".list", scri);
	}

	public int write(FoodThemeVO vo) throws Exception {
		return session.insert(namespace + ".write", vo);
	}

	public FoodThemeVO view(FoodThemeVO vo) throws Exception {
		return session.selectOne(namespace + ".view", vo);
	}

	public void delete(FoodThemeVO vo) throws Exception {
		session.delete(namespace + ".delete", vo);
	}

	@Override
	public List<FoodVO> getFoodList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listSearch", scri);
	}

	public int countSearch(SearchCriteria scri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("scri", scri);
		return session.selectOne(namespace + ".countSearch", map);
	}

	@Override
	public List<String> getThemeTypes() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getThemeTypes");
	}

	@Override
	public List<ThemeVO> getThemes(String themeType) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getThemes", themeType);
	}

	@Override
	public int foodThemeExists(FoodThemeVO vo) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".foodThemeExists", vo);
	}

	@Override
	public List<RecipeVO> listByTheme(ThemeVO themeVO) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listByTheme", themeVO);
	}

}
