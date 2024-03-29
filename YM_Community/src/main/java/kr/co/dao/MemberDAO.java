package kr.co.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.vo.BoardVO;
import kr.co.vo.MemberVO;

public interface MemberDAO {
	public void join(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public int listCount(String userId) throws Exception;
	
	public List<BoardVO> memberPosting(HashMap<String, Object> map) throws Exception;

	public void delAll(int[] delNums) throws Exception;
}
