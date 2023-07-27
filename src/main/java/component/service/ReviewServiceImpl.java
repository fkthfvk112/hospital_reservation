package component.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.ReviewDao;
import component.dto.MyReviewDto;
import component.dto.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewDao dao;

	@Override
	public boolean reviewWrite(ReviewDto dto) {
		
		return dao.reviewWrite(dto)>0?true:false;
	}

	
	@Override
	public List<ReviewDto> recentList(int hosId) {
		return dao.recentList(hosId);
	}
	
	@Override
	public List<ReviewDto> scoreUplist(int hosId) {
		return dao.scoreUplist(hosId);
	}


	@Override
	public List<ReviewDto> scoreDownlist(int hosId) {
		return dao.scoreDownlist(hosId);
	}


	@Override
	public boolean reviewDelete(ReviewDto dto) {
		return dao.reviewDelete(dto)>0?true:false;
	}


	@Override
	public List<MyReviewDto> getreviewdetaillist(String userid) {
		return dao.getreviewdetaillist(userid);
	}
	
}