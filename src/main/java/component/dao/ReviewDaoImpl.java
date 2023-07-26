package component.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import component.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	
	@Autowired
	SqlSession session;
	String ns = "Review.";
	
	
	@Override
	public int reviewWrite(ReviewDto dto) {
		return session.insert(ns + "reviewWrite", dto);
	}


	@Override
	public List<ReviewDto> recentList(int hosId) {
		return session.selectList(ns + "recentList", hosId);
	}


	@Override
	public List<ReviewDto> scoreUplist(int hosId) {
		return session.selectList(ns + "scoreUplist", hosId);
	}


	
	@Override
	public List<ReviewDto> scoreDownlist(int hosId) {
		return session.selectList(ns+ "scoreDownlist", hosId);
	}


	@Override
	public int reviewDelete(ReviewDto dto) {
		return session.delete(ns + "reviewDelete", dto);
	}



	


	
	
	
	
	
}
