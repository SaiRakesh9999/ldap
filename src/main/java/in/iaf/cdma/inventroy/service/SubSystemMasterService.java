package in.iaf.cdma.inventroy.service;

import java.util.List;

import in.iaf.cdma.inventroy.model.SubSystemMaster;

public interface SubSystemMasterService {

    public SubSystemMaster find(Integer subSystemId);
	
	public List<SubSystemMaster> findAll();
	
	public SubSystemMaster save(SubSystemMaster subSystemMaster);
	
	public void delete(Integer subSystemId);
	
	public List<SubSystemMaster> findBySystemId(Integer systemId);
	
	public SubSystemMaster findBySubSystemNameAndSystemId(String subSystemName,Integer systemId);
	
}
