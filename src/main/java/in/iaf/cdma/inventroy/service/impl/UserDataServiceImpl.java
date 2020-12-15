package in.iaf.cdma.inventroy.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.iaf.cdma.inventroy.model.UserData;
import in.iaf.cdma.inventroy.repository.UserDataRepository;
import in.iaf.cdma.inventroy.service.UserDataService;

@Service
@Transactional
public class UserDataServiceImpl implements UserDataService{

	@Autowired
	UserDataRepository userDataRepository;
	
	@Override
	public UserData findByUsername(String username) {
		return userDataRepository.findByUserName(username);
	}

	@Override
	public UserData save(UserData userData) {
		return userDataRepository.save(userData);
	}

	@Override
	public void delete(String username) {
		UserData user=userDataRepository.findByUserName(username);
		if(user!=null) {
			user.setActive(false);
			userDataRepository.save(user);
		}
	}

	@Override
	public List<UserData> findAll() {
		return userDataRepository.findAll();
	}
	
	

}
