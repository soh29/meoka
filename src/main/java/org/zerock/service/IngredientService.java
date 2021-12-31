package org.zerock.service;

import java.util.List;

import org.zerock.domain.IngredientVO;
import org.zerock.domain.RecipeRequest;
import org.zerock.domain.UtensilVO;

public interface IngredientService {

	public IngredientVO ingredientExist(String ingredientName);
	
	// 재료 작성
	public RecipeRequest recipeno(int recipeno) throws Exception;

	public void writeIngredient(IngredientVO rd) throws Exception;
	
	
	//db에 재료 없을 떄
	public void writeFirstIngredient(IngredientVO rd) throws Exception;
	

	// 재료 삭제
	public void deleteIngredient(int recipeno) throws Exception;
	
	// 재료 수정
	public void modifyIngredient(IngredientVO vo) throws Exception;

	// 재료 조회
	public List<IngredientVO> getIngredientList(int recipeno) throws Exception;
	


}
