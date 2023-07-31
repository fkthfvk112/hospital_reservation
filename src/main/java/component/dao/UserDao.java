package component.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import component.dto.UserDto;

public interface UserDao {
	
	int idcheck(String id);
	int emailcheck(String email);
	int adduser(UserDto dto);
	
	String findId(String email);
	
	UserDto login(UserDto dto);
	UserDto getUserById(String id);
	int updateHosIdToUser(Map<String, String> userId_hosId);
	
	// 메일
	UserDto findUserByNameIdEmail(@Param("name") String name, @Param("id") String id, @Param("email") String email);
    void updatePassword(UserDto dto);
	int changepw(UserDto dto);

}