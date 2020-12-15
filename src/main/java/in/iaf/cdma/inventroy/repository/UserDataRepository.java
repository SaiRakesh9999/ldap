package in.iaf.cdma.inventroy.repository;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.iaf.cdma.inventroy.model.UserData;

@Repository
@Qualifier("userDataRepository")
public interface UserDataRepository extends JpaRepository<UserData,String> {
	
	public UserData findByUserName(String username);
	
}


