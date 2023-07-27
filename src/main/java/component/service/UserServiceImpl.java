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
	public boolean emailcheck(String email) {
		return dao.emailcheck(email)>0?true:false;
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
    public UserDto getUserById(String id) {
        return dao.getUserById(id);
    }
	
	@Override
	public String findId(String email) {
		return dao.findId(email);
	}
	
	@Override
	public boolean changepw(UserDto dto) {
		return dao.changepw(dto)>0;
	}

	@Override
	public UserDto findUserByNameIdEmail(String name, String id, String email) {
		 return dao.findUserByNameIdEmail(name, id, email);
	}

	@Override
	public void updatePassword(UserDto dto) {
		dao.updatePassword(dto);
	}

}