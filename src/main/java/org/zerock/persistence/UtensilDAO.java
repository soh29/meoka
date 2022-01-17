package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.RecipeRequest;
import org.zerock.domain.UtensilVO;

public interface UtensilDAO {

	
	// 도구 작성
	public RecipeRequest recipeno(int recipeno) throws Exception;

	public void writeUtensil(UtensilVO rd) throws Exception;
	
		//db에 도구 없을 떄
	public void writeFirstUtensil(UtensilVO rd) throws Exception;

	// 도구 조회
	public List<UtensilVO> getUtensilList(int recipeno) throws Exception;

	// 도구 수정
	public void modifyUtensil(UtensilVO vo) throws Exception;
	
	// 게시물 삭제
	public void deleteUtensil(int recipeno) throws Exception;

	public UtensilVO utensilExist(String utensilName);
		
}
