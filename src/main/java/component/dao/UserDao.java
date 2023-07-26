package component.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import component.dto.UserDto;

public interface UserDao {
	
	int idcheck(String id);
	int adduser(UserDto dto);
	
	String findId(String email);
	
	UserDto login(UserDto dto);
	
	// 메일
	UserDto findUserByNameIdEmail(@Param("name") String name, @Param("id") String id, @Param("email") String email);
    void updatePassword(UserDto dto);
}
