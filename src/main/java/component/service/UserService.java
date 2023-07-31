package component.service;

import java.util.List;
import java.util.Map;

import component.dto.HospitalDto;
import component.dto.UserDto;

public interface UserService {
	
	boolean idcheck(String id);
	boolean emailcheck(String email);
	boolean adduser(UserDto dto);
	
	String findId(String email);
	
	UserDto login(UserDto dto);
	UserDto getUserById(String id);
	boolean changepw(UserDto dto);

	int updateHosIdToUser(UserDto userDto, HospitalDto hosDto);
	// 메일
	UserDto findUserByNameIdEmail(String name, String id, String email);
    void updatePassword(UserDto dto);
}