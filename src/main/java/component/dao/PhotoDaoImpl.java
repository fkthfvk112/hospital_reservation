package component.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import component.dto.UploadPhotoDto;
@Repository
public class PhotoDaoImpl implements PhotoDao {

	@Autowired
	SqlSession session;
	
	String ns = "Photo.";
	@Override
	public int uploadPhoto(UploadPhotoDto dto) {
		return session.insert(ns + "insertPhoto", dto);
	}
	
	@Override
	public List<UploadPhotoDto> getAllPhotoByHosId(int hosId) {
		// TODO Auto-generated method stub
		return session.selectList(ns + "getAllPhotoUrlByHosId", hosId);
	}
}
