package component.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.HospitalDao;
import component.dao.HospitalDaoImpl;
import component.dao.UserDao;
import component.dto.HospitalDto;
import component.dto.LikeDto;
import component.dto.SearchDto;
import component.dto.UpdateSelector;
import component.dto.UserDto;
import utils.HosUtils;

@Service
public class HospitalServiceImpl implements HospitalService{
	@Autowired
	HospitalDao dao;
	
	@Autowired
	UserDao userDao;

	@Override
	public HospitalDto hospitalDetail(int id) {
		System.out.println("-----hospitalDetail service---------");

		return dao.hospitalDetail(id);
	}
	
	@Override
	public List<HospitalDto>  getAllHospital() {
		System.out.println("-----getAllHospital stvice---------");

		return dao.getAllHospital();
	}
	
	@Override
	public int createHospital(HospitalDto dto) {
		System.out.println("-----createHospital service---------");
		return dao.createHospital(dto);
	}
	
	@Override
	public int handleLike(LikeDto dto) {
		
		return dao.handleLike(dto);
	}
	
	@Override
	public int countHosLike(int hosId) {
		return dao.countHosLike(hosId);
	}
	
	@Override
	public int updateHospital(UpdateSelector dto) {
		System.out.println("-------------updateHospital service----------");

		return dao.updateHospital(dto);
	}

	@Override
	public List<HospitalDto> searchHospital(SearchDto searchDto) {
		List<HospitalDto> processedDto = new ArrayList<HospitalDto>();
		List<HospitalDto> preDtos = dao.searchHospital(searchDto);
		if(searchDto.getUserLocation() != null && searchDto.getUserLocation() !="") {
			String location[] = searchDto.getUserLocation().split(",");
			String longTemp = location[1].split(":")[1];

			String userLatitude_s = location[0].split(":")[1];
			String userLongitude_s = longTemp.substring(0, longTemp.length() - 1);

			for(HospitalDto hosDto:preDtos) {
				String hosLatitude_s = hosDto.getLocation_latitude();
				String hosLongitude_s = hosDto.getLocation_longitude();
				
				Double userLatitude = Double.parseDouble(userLatitude_s);
				Double userLongitude = Double.parseDouble(userLongitude_s);
				
				Double hosLatitude = Double.parseDouble(hosLatitude_s);
				Double hosLongitude = Double.parseDouble(hosLongitude_s);
				
				Double uclidienDis = HosUtils.getUclidienDistance(userLatitude, userLongitude, hosLatitude, hosLongitude);
				System.out.println("거리 ㅣㅣㅣㅣㅣ" + uclidienDis);
				
				if(uclidienDis <= searchDto.getConditionTwo()) {
					System.out.println("추가 되는 것" + hosDto.toString());
					processedDto.add(hosDto);
				}
			}
		}
		else {
			processedDto = preDtos;
		}
		
			
		return processedDto;
	}

	@Override
	public Double hosStarAvg(int hosId) {
		return dao.hosStarAvg(hosId);
	}

	@Override
	public HospitalDto getHospitalIdByName(String hosName) {
		return dao.getHospitalIdByName(hosName);
	}
}
