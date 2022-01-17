package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ValuationVO;

public interface ValuationDAO {
 
	public List<ValuationVO> list(Integer recipeno) throws Exception;
	public void create(ValuationVO vo) throws Exception;
	public void update(ValuationVO vo) throws Exception;
	public void delete(ValuationVO vo) throws Exception;
	public List<ValuationVO> listPage(Integer recipeno, Criteria cri) throws Exception;
	public int count(Integer recipeno) throws Exception;
	public void deleteRecipeValuation(Integer recipeno) throws Exception;
	//후기평균
	public int avg(Integer recipeno) throws Exception;
	public List<ValuationVO> getValuationList() throws Exception;
	public ValuationVO getValuationDetail(ValuationVO vo) throws Exception;
	public List<ValuationVO> getValuationList2(String memberid) throws Exception;
	public void valuationRestrict(ValuationVO vo) throws Exception;
}
