package component.service;

import java.util.List;

import component.dto.UserDto;

public interface UserService {
	
	boolean idcheck(String id);
	boolean adduser(UserDto dto);
	
	String findId(String email);
	
	UserDto login(UserDto dto);
}
