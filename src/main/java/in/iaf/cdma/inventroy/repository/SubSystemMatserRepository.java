package in.iaf.cdma.inventroy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.iaf.cdma.inventroy.model.SubSystemMaster;

@Repository
public interface SubSystemMatserRepository extends JpaRepository<SubSystemMaster, Integer> {
	
	public List<SubSystemMaster> findBySystemMasterSystemIdAndActive(Integer systemId,boolean active);
	
	public SubSystemMaster findBySubSystemNameAndSystemMasterSystemId(String subSystemName,Integer systemId);

}
