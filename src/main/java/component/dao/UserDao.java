package component.dao;

import component.dto.UserDto;

public interface UserDao {

	int idcheck(String id);
	int adduser(UserDto dto);
	UserDto login(UserDto dto);
	int changepw(UserDto dto);
}
