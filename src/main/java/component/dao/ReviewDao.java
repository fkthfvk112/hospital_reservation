package component.dao;

import java.util.List;

import component.dto.MyReviewDto;
import component.dto.ReviewDto;

public interface ReviewDao {
	
	int reviewWrite(ReviewDto dto);
	
	List<ReviewDto> recentList(int hosId);
	
	List<ReviewDto> scoreUplist(int hosId);
	
	List<ReviewDto> scoreDownlist(int hosId);
	
	int reviewDelete(ReviewDto dto);
	
	List<MyReviewDto> getreviewdetaillist(String userid);
}