package component.dao;

import java.util.List;

import component.dto.HospitalDto;
import component.dto.LikeInfoDto;

public interface LikeInfoDao {

	List<HospitalDto> gethospitaldetaillist(String userid);
	 
	int canclelike(LikeInfoDto dto);
}
