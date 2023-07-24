package component.service;

import component.dto.UserDto;

public interface UserService {
	
	boolean idcheck(String id);
	boolean adduser(UserDto dto);
	
	UserDto login(UserDto dto);
	
	// 우지예
	
	boolean changepw(UserDto dto);
}