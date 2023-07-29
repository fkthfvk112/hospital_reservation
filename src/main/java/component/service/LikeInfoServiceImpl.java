package component.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.LikeInfoDao;
import component.dto.HospitalDto;
import component.dto.LikeInfoDto;

@Service
public class LikeInfoServiceImpl implements LikeInfoService{

	@Autowired
	LikeInfoDao dao;

	@Override
	public List<HospitalDto> gethospitaldetaillist(String userid) {
		return dao.gethospitaldetaillist(userid);
	}

	@Override
	public boolean canclelike(LikeInfoDto dto) {
		return dao.canclelike(dto) > 0;
	}

	@Override
	public String gethosphoto(int hosid) {
		return dao.gethosphoto(hosid);
	}

	@Override
	public int cntThisHosLike(LikeInfoDto dto) {
		return dao.cntThisHosLike(dto);
	}
	
}
