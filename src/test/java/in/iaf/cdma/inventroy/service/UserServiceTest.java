package in.iaf.cdma.inventroy.service;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;

import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.boot.test.context.SpringBootTest;

import in.iaf.cdma.inventroy.model.RoleMaster;
import in.iaf.cdma.inventroy.model.UserData;
import in.iaf.cdma.inventroy.repository.UserDataRepository;

@SpringBootTest
public class UserServiceTest {

	
	@Mock
	private UserDataRepository userDataRepository;
	
	
	/*@Test
	public void repositoryInjectComponentNotNullTest() {
		assertThat(userDataRepository).isNotNull();
		assertThat(em).isNotNull();
	}*/
	
	@Test
	public void findByUserNameTest() {
		UserData userData=new UserData("bhupi","test",new RoleMaster(),true);
		Mockito.when(userDataRepository.findByUserName("bhupi")).thenReturn(userData);
		UserData user=userDataRepository.findByUserName("bhupi");
		assertEquals("bhupi",user.getUserName());
	}
}
