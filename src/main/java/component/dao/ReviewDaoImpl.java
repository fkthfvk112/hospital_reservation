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
	public List<ReviewDto> recentList(ReviewDto dto) {
		return session.selectList(ns + "recentList", dto);
	}


	@Override
	public List<ReviewDto> scoreUplist(ReviewDto dto) {
		return session.selectList(ns + "scoreUplist", dto);
	}


	
	@Override
	public List<ReviewDto> scoreDownlist(ReviewDto dto) {
		return session.selectList(ns+ "scoreDownlist", dto);
	}



	


	
	
	
	
	
}
