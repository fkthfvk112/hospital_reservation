package component.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import component.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	SqlSession session;
	
	String ns = "User.";
	
	@Override
	public int idcheck(String id) {
		int count = session.selectOne(ns+ "idcheck", id);
		return count;
	}

	@Override
	public int adduser(UserDto dto) {
		return session.insert(ns + "adduser", dto);
	}

	@Override
	public UserDto login(UserDto dto) {
		return session.selectOne(ns + "login", dto);
	}

	@Override
	public String findId(String email) {
		return session.selectOne(ns + "findId", email);
	}

	@Override
	public UserDto findUserByNameIdEmail(String name, String id, String email) {
	    Map<String, String> params = new HashMap<>();
	    params.put("name", name);
	    params.put("id", id);
	    params.put("email", email);
	    return session.selectOne(ns + "findUserByNameIdEmail", params);
	}

	@Override
	public void updatePassword(UserDto dto) {
		session.update(ns + "updatePassword", dto);
	}

}
