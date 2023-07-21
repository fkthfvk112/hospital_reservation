package component.dao;

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

}
