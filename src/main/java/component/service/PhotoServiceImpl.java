package component.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.PhotoDao;
import component.dto.UploadPhotoDto;

@Service
public class PhotoServiceImpl implements PhotoService {

	@Autowired
	PhotoDao dao;

	@Override
	public int uploadPhoto(UploadPhotoDto dto) {
		
		return dao.uploadPhoto(dto);
	}

	@Override
	public List<UploadPhotoDto> getAllPhotoByHosId(int hosId) {
		
		return dao.getAllPhotoByHosId(hosId);
	}
	
	
}
