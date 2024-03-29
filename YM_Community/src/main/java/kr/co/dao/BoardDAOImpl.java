package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
	}

	// list 조회
	@Override
	public List<BoardVO> list(SearchCriteria Scriteria) throws Exception {
		return sqlSession.selectList("boardMapper.listPage", Scriteria);
	}
	
	// list 총 개수
	@Override
	public int listCount(SearchCriteria Scriteria) throws Exception {
		return sqlSession.selectOne("boardMapper.listCount", Scriteria);
	}
	
	// detail 조회
	@Override
	public BoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.read", bno);
	}
	
	@Override
	public BoardVO getPrev(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.getPrev", bno);
	}
	
	@Override
	public BoardVO getNext(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.getNext",bno);
	}
	
	@Override
	public void update(BoardVO boardVO) throws Exception {
		sqlSession.update("boardMapper.update", boardVO);
	}
	
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("boardMapper.delete", bno);
	}
	
	@Override
	public void hit(int bno) throws Exception {
		sqlSession.update("boardMapper.hit", bno);
	}

}
