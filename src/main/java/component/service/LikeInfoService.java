package component.service;

import java.util.List;

import component.dto.HospitalDto;
import component.dto.LikeInfoDto;

public interface LikeInfoService {

	List<HospitalDto> gethospitaldetaillist(String userid);
	
	boolean canclelike(LikeInfoDto dto);
}
