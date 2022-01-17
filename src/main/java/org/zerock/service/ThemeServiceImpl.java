package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.ThemeVO;
import org.zerock.persistence.ThemeDAO;

@Service
public class ThemeServiceImpl implements ThemeService {
	
	@Inject
	private ThemeDAO dao;

	@Override
	public List<ThemeVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public int write(ThemeVO themeVo) throws Exception {
		// TODO Auto-generated method stub
		return dao.write(themeVo);
	}

	@Override
	public void delete(int themeNo) throws Exception {
		dao.delete(themeNo);
	}

	@Override
	public ThemeVO view(int themeNO) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(themeNO);
	}
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}

	// 게시물 목록 + 페이징
	@Override
	public List<ThemeVO> listPage(Criteria cri) throws Exception {
		 return dao.listPage(cri);
	}

	public int listCount() throws Exception {
		return dao.listCount();

	}

	// 목록+페이징+검색
	public List<ThemeVO> listSearch(SearchCriteria scri) throws Exception {
		return dao.listSearch(scri);
	}

	// 게시물 검색
	public int countSearch(SearchCriteria scri) throws Exception {
		return dao.countSearch(scri);
	}







}
