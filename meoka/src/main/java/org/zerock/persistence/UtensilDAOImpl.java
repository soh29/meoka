package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.RecipeRequest;
import org.zerock.domain.UtensilVO;

@Repository
public class UtensilDAOImpl implements UtensilDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "org.zerock.mapper.ToolMapper";

	// 도구 작성
	public RecipeRequest recipeno(int recipeno) throws Exception {
		return sql.selectOne(namespace + ".recipeno", recipeno);
	}
	
	public void writeUtensil(UtensilVO rd) throws Exception {
		sql.insert(namespace + ".writeUtensil", rd);
	}
		//db에 도구 없을 떄
	public void writeFirstUtensil(UtensilVO rd) throws Exception{
		sql.insert(namespace + ".writeFirstUtensil", rd);
	}

	// 도구 삭제
	public void deleteUtensil(int recipeno) throws Exception{
		sql.delete(namespace+".deleteUtensil", recipeno);
	}
	
	// 도구 수정
	public void modifyUtensil(UtensilVO vo) throws Exception{
		sql.update(namespace+".modifyUtensil");
	}

	@Override
	public List<UtensilVO> getUtensilList(int recipeno) throws Exception {
		return sql.selectList(namespace + ".listUtensil", recipeno);
	}

	@Override
	public UtensilVO utensilExist(String utensilName) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".utensilExist", utensilName);
	}
	
	
}
