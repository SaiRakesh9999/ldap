package in.iaf.cdma.inventroy.service;

import java.util.List;

import in.iaf.cdma.inventroy.model.InventoryMaster;

public interface InventoryMasterService {
	
	public InventoryMaster find(Integer invId);
	
	public InventoryMaster save(InventoryMaster inventoryMaster);
	
	public void delete(Integer invId);
	
	public List<InventoryMaster> findAll();
	
	public List<InventoryMaster> findByActive();
	
	public List<InventoryMaster> findByServiceabilityStatus(String serviceabilityStatus);
	
	public List<InventoryMaster> findBySystemId(Integer systemId);
	
	public List<InventoryMaster> findBySubSystemId(Integer subSystemId);
	
	public List<InventoryMaster> findBySystemIdAndServiceabilityStatus(Integer systemId,String serviceabilityStatus);
	
	public List<InventoryMaster> findBySubSystemIdAndServiceabilityStatus(Integer subSystemId,String serviceabilityStatus);
	
	public InventoryMaster findBySystemSystemIdAndSubSystemSubSystemIdAndItemSerailNo(Integer systemId,Integer subSystemId,String serailNo);
	
	

}
