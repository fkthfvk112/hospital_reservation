package component.service;

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

	// 우지예
	
	@Override
	public boolean changepw(UserDto dto) {
		return dao.changepw(dto)>0;
	}



}