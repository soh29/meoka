package org.zerock.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.RecipeDetailVO;
import org.zerock.domain.RecipeRequest;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;

@Repository
public class RecipeDAOImpl implements RecipeDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "org.zerock.mapper.RecipeMapper";

	@Override
	public List<RecipeVO> list() throws Exception {

		return sql.selectList(namespace + ".list");

	}

	// 레시피 작성
	@Override
	public int write(RecipeRequest recipeRequest) throws Exception {

		sql.insert(namespace + ".write", recipeRequest);
		return sql.selectOne(namespace+".recipeno");
	}

	// 레시피 디테일 작성
	public RecipeRequest recipeno(int recipeno) throws Exception {
		return sql.selectOne(namespace + ".recipeno", recipeno);
	}

	public void writeRecipeDetail(RecipeDetailVO rd) throws Exception {
		sql.insert(namespace + ".writeRecipeDetail", rd);
	}

	@Override
	// 게시물 조회
	public RecipeVO view(int RECIPENO) throws Exception {

		return sql.selectOne(namespace + ".view", RECIPENO);
	}
	
	//섬네일 보기
	public String show(int recipeno) throws Exception{
		return sql.selectOne(namespace + ".show", recipeno);
	}

	

	// 게시물 수정
	@Override
	public void modify(RecipeRequest recipeRequest) throws Exception {
		sql.update(namespace + ".modify", recipeRequest);
	}

	// 게시물 삭제
	public void delete(int recipeno) throws Exception {
		sql.delete(namespace + ".delete", recipeno);
	}

	// 레시피 세부내용 삭제
	public void deleteRecipeDetail(int recipeno) throws Exception{
		sql.delete(namespace+".deleteRecipeDetail", recipeno);
	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");
	}

	// 게시물 목록 + 페이징
	@Override
	public List<RecipeVO> listPage(Criteria cri) throws Exception {

		return sql.selectList(namespace + ".listPage", cri);

	}

	public int listCount() throws Exception {

		return sql.selectOne(namespace + ".listCount");
	}

	// 목록+페이징+검색
	   public List<RecipeVO> listSearch(SearchCriteria scri) throws Exception {
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

	@Override
	public List<RecipeDetailVO> getRecipeDetailList(int recipeno) throws Exception {
		return sql.selectList(namespace + ".getRecipeDetailList", recipeno);

	}

}
