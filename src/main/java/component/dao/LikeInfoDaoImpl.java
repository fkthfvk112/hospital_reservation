package component.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import component.dto.HospitalDto;
import component.dto.LikeInfoDto;

@Repository
public class LikeInfoDaoImpl implements LikeInfoDao{

	@Autowired
	SqlSession session;
	
	String ns = "LikeInfo.";

	@Override
	public List<HospitalDto> gethospitaldetaillist(String userid) {
		System.out.println("찜 리스트 : "+session.selectList(ns+"gethospitaldetaillist", userid));
		return session.selectList(ns+"gethospitaldetaillist", userid);
	}

	@Override
	public int canclelike(LikeInfoDto dto) {
		System.out.println("해제할 찜 : "+dto);
		return session.delete(ns+"canclelike",dto);
	}

	@Override
	public String gethosphoto(int hosid) {
		return session.selectOne(ns+"gethosphoto", hosid);
	}

	@Override
	public int cntThisHosLike(LikeInfoDto dto) {
		
		return session.selectOne(ns + "cntThisHosLike", dto);
	}

	
}
