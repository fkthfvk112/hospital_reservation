package component.dao;

import component.dto.UserDto;

public interface UserDao {
	
	// 현민님
	int idcheck(String id);
	int adduser(UserDto dto);
	
	UserDto login(UserDto dto);
	
	// 우지예
	int changepw(UserDto dto);
}
