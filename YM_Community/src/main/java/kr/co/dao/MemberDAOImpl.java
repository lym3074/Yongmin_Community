package kr.co.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
import kr.co.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void join(MemberVO vo) throws Exception {
		sqlSession.insert("memberMapper.join",vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sqlSession.selectOne("memberMapper.login",vo);
	}
	
	@Override
	public int listCount(String userId) throws Exception {
		return sqlSession.selectOne("memberMapper.listCount",userId);
	}
	
	@Override
	public List<BoardVO> memberPosting(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList("memberMapper.memberPosting",map);
	}
	
	@Override
	public void delAll(int[] delNums) throws Exception {
		sqlSession.selectOne("memberMapper.deleteAll", delNums);
	}
}
