package component.dao;

import java.util.List;

import component.dto.ReviewDto;

public interface ReviewDao {
	
	int reviewWrite(ReviewDto dto);
	
	List<ReviewDto> recentList(ReviewDto dto);
	
	List<ReviewDto> scoreUplist(ReviewDto dto);
	
	List<ReviewDto> scoreDownlist(ReviewDto dto);
}
