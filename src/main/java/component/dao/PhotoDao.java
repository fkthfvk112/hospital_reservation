package component.dao;

import java.util.List;

import component.dto.UploadPhotoDto;

public interface PhotoDao {
	int uploadPhoto(UploadPhotoDto dto);
	List<UploadPhotoDto> getAllPhotoByHosId(int hosId);
}
