package component.dao;

import java.util.List;

import component.dto.UserDto;

public interface UserDao {
	
	int idcheck(String id);
	int adduser(UserDto dto);
	
	String findId(String email);
	
	UserDto login(UserDto dto);
}
