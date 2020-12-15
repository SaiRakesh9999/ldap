package in.iaf.cdma.inventroy.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.iaf.cdma.inventroy.model.SubSystemMaster;
import in.iaf.cdma.inventroy.repository.SubSystemMatserRepository;
import in.iaf.cdma.inventroy.service.SubSystemMasterService;

@Service
@Transactional
public class SubSystemMasterServiceImpl implements SubSystemMasterService {

	@Autowired
	SubSystemMatserRepository subSystemMasterRepository;
	
	@Override
	public SubSystemMaster find(Integer subSystemId) {
		return subSystemMasterRepository.findById(subSystemId).orElse(null);
	}

	@Override
	public List<SubSystemMaster> findAll() {
		return subSystemMasterRepository.findAll();
	}

	@Override
	public SubSystemMaster save(SubSystemMaster subSystemMaster) {
		subSystemMaster.setSubSystemName(subSystemMaster.getSubSystemName().toUpperCase());
		return subSystemMasterRepository.save(subSystemMaster);
	}

	@Override
	public void delete(Integer subSystemId) {
		SubSystemMaster sub=find(subSystemId);
		if(sub!=null) {
			sub.setActive(false);
			subSystemMasterRepository.save(sub);
		}
	}

	@Override
	public List<SubSystemMaster> findBySystemId(Integer systemId) {
		return subSystemMasterRepository.findBySystemMasterSystemIdAndActive(systemId, true);
	}

	@Override
	public SubSystemMaster findBySubSystemNameAndSystemId(String subSystemName, Integer systemId) {
		return subSystemMasterRepository.findBySubSystemNameAndSystemMasterSystemId(subSystemName, systemId);
	}

}
