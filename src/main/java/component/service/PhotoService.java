package component.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.PhotoDao;
import component.dto.UploadPhotoDto;

public interface PhotoService {
	int uploadPhoto(UploadPhotoDto dto);
	List<UploadPhotoDto> getAllPhotoByHosId(int hosId);
}
