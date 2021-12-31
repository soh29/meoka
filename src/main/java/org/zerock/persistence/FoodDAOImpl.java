package org.zerock.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.FoodVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.ValuationVO;

@Repository
public class FoodDAOImpl implements FoodDAO {
	
	@Inject
	private SqlSession session;
	private static String namespace = "org.zerock.mapper.FoodMapper";
	
	@Override
	public List<FoodVO> list()  throws Exception {
	return session.selectList(namespace + ".list");
	}
	public int write(FoodVO vo) throws Exception{
		session.insert(namespace+".write", vo);
		return session.selectOne(namespace+".foodNo");
	}
	public FoodVO view(int foodNo) throws Exception{
		return session.selectOne(namespace+".view",foodNo);
	}
	public void delete(int foodNo) throws Exception{
		session.delete(namespace + ".delete", foodNo);
	}
	// 목록+페이징+검색
	   public List<FoodVO> listSearch(SearchCriteria scri) throws Exception {
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
		      return session.selectList(namespace + ".listSearch", map);
		   }

	// 게시물 검색
	public int countSearch(SearchCriteria scri) throws Exception {
		      Map<String, Object> map = new HashMap<String, Object>();
		      map.put("scri", scri);
		      return session.selectOne(namespace + ".countSearch", map);
		   }

}
