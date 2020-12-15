package in.iaf.cdma.inventroy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.iaf.cdma.inventroy.model.InventoryMaster;

@Repository
public interface InventoryMasterRepository extends JpaRepository<InventoryMaster, Integer> {
	
	public InventoryMaster findBySystemSystemIdAndSubSystemSubSystemIdAndItemSerailNo(Integer systemId,Integer subSystemId,String itemSerailNo);
	
	public List<InventoryMaster> findByActive(boolean active);
	
	public List<InventoryMaster> findByServiceabilityStatusAndActive(String serviceabilityStatus,boolean active);
	
	public List<InventoryMaster> findBySystemSystemIdAndActive(Integer systemId,boolean active);
	
	public List<InventoryMaster> findBySubSystemSubSystemIdAndActive(Integer subSystemId,boolean active);
	
	public List<InventoryMaster> findBySystemSystemIdAndServiceabilityStatusAndActive(Integer systemId,String serviceabilityStatus,boolean active);
	
	public List<InventoryMaster> findBySubSystemSubSystemIdAndServiceabilityStatusAndActive(Integer subSystemId,String serviceabilityStatus,boolean active);
	
	
}
