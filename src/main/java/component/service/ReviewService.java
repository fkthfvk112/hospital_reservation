package component.service;

import java.util.List;

import component.dto.MyReviewDto;
import component.dto.ReviewDto;

public interface ReviewService {

	boolean reviewWrite(ReviewDto dto);
	
	List<ReviewDto> recentList(int hosId);
	
	List<ReviewDto> scoreUplist(int hosId);
	
	List<ReviewDto> scoreDownlist(int hosId);
	
	boolean reviewDelete(ReviewDto dto);
	
	List<MyReviewDto> getreviewdetaillist(String userid);
}