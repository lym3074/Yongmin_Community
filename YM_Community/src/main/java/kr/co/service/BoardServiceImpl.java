package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.BoardDAO;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}
	
	@Override
	public List<BoardVO> list(SearchCriteria Scriteria) throws Exception {
		return dao.list(Scriteria);
	}
	
	@Override
	public int listCount(SearchCriteria Scriteria) throws Exception {
		return dao.listCount(Scriteria);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int bno) throws Exception {
			   dao.hit(bno);
		return dao.read(bno);
	}
	
	@Override
	public BoardVO getPrev(int bno) throws Exception {
		return dao.getPrev(bno);
	}
	
	@Override
	public BoardVO getNext(int bno) throws Exception {
		return dao.getNext(bno);
	}
	
	@Override
	public void update(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}
	
	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

}
