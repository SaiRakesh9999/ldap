package in.iaf.cdma.inventroy.service;

import java.util.List;

import in.iaf.cdma.inventroy.model.SystemMaster;

public interface SystemMasterService {
	
	public SystemMaster find(Integer systemId);
	
	public List<SystemMaster> findAll();
	
	public SystemMaster save(SystemMaster systemMaster);
	
	public void delete(Integer systemId);
	
	public List<SystemMaster> findAllActive();

}
