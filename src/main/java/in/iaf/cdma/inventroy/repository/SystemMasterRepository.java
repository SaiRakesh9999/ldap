package in.iaf.cdma.inventroy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.iaf.cdma.inventroy.model.SystemMaster;

@Repository
public interface SystemMasterRepository extends JpaRepository<SystemMaster, Integer> {

	public List<SystemMaster> findByActive(boolean active);
	
}
