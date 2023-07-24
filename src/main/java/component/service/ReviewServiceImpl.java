package component.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.ReviewDao;
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
	public List<ReviewDto> recentList(ReviewDto dto) {
		return dao.recentList(dto);
	}
	
	@Override
	public List<ReviewDto> scoreUplist(ReviewDto dto) {
		return dao.scoreUplist(dto);
	}


	@Override
	public List<ReviewDto> scoreDownlist(ReviewDto dto) {
		return dao.scoreDownlist(dto);
	}



	

	
	
	
	
	
	
	
	
}
