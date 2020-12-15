package in.iaf.cdma.inventroy.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.iaf.cdma.inventroy.model.SystemMaster;
import in.iaf.cdma.inventroy.repository.SystemMasterRepository;
import in.iaf.cdma.inventroy.service.SystemMasterService;

@Service
@Transactional
public class SystemMasterServiceImpl implements SystemMasterService {

	@Autowired
	SystemMasterRepository systemMasterRepository;
	
	@Override
	public SystemMaster find(Integer systemId) {
		return systemMasterRepository.findById(systemId).orElse(null);
	}

	@Override
	public List<SystemMaster> findAll() {
		return systemMasterRepository.findAll();
	}

	@Override
	public SystemMaster save(SystemMaster systemMaster) {
		systemMaster.setSystemName(systemMaster.getSystemName().toUpperCase());
		return systemMasterRepository.save(systemMaster);
	}

	@Override
	public void delete(Integer systemId) {
		SystemMaster system=find(systemId);
		if(system!=null) {
			system.setActive(false);
			systemMasterRepository.save(system);
		}
	}

	@Override
	public List<SystemMaster> findAllActive() {
		return systemMasterRepository.findByActive(true);
	}

}
