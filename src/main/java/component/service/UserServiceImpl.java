package component.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.UserDao;
import component.dto.UserDto;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao dao;
	
	@Override
	public boolean idcheck(String id) {
		return dao.idcheck(id)>0?true:false;
	}

	@Override
	public boolean adduser(UserDto dto) {
		return dao.adduser(dto)>0?true:false;
	}

	@Override
	public UserDto login(UserDto dto) {
		return dao.login(dto);
	}

	@Override
	public String findId(String email) {
		return dao.findId(email);
	}

}
