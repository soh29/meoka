package org.zerock.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PagingVO;
import org.zerock.domain.RecipeDetailVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.ThemeVO;

@Repository
public class ThemeDAOImpl implements ThemeDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "org.zerock.mapper.ThemeMapper";

	@Override
	public List<ThemeVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}

	@Override
	public int write(ThemeVO themeVo) throws Exception {
		// TODO Auto-generated method stub
		return sql.insert(namespace + ".write", themeVo);
	}

	@Override
	public void delete(int themeNo) throws Exception {
		sql.delete(namespace + ".delete", themeNo);
	}

	@Override
	public ThemeVO view(int themeNo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".view", themeNo);
	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");
	}

	// 게시물 목록 + 페이징
	@Override
	public List<ThemeVO> listPage(Criteria cri) throws Exception {

		return sql.selectList(namespace + ".listPage", cri);

	}

	public int listCount() throws Exception {

		return sql.selectOne(namespace + ".listCount");
	}

	// 목록+페이징+검색
	   public List<ThemeVO> listSearch(SearchCriteria scri) throws Exception {
		      String[] keywords = scri.getKeyword().split(",");
		      List<String> keywordsList = new ArrayList<String>();

		      if(scri.getSearchType().equalsIgnoreCase("i")
		            && keywords.length > 0)   {
		         for(int i=0; i< keywords.length; i++){
		              keywordsList.add(keywords[i].toString());
		          }
		      }

		      Map<String, Object> map = new HashMap<String, Object>();
		      System.out.println("*****SearchCriteria: " + scri);
		      map.put("scri", scri);
		      map.put("keywords", keywordsList);
		      
		      return sql.selectList(namespace + ".listSearch", map);
		   }

	// 게시물 검색
	public int countSearch(SearchCriteria scri) throws Exception {
		      Map<String, Object> map = new HashMap<String, Object>();
		      map.put("scri", scri);
		      return sql.selectOne(namespace + ".countSearch", map);
		   }





}
