package in.iaf.cdma.inventroy.service;

import java.util.List;

import in.iaf.cdma.inventroy.model.UserData;

public interface UserDataService {

	public UserData findByUsername(String username);
	
	public UserData	save(UserData userData);
	
	public List<UserData> findAll();
	
	public void delete(String username);
	
}
