package in.iaf.cdma.inventroy.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.iaf.cdma.inventroy.model.RoleMaster;
import in.iaf.cdma.inventroy.repository.RoleMasterRepository;
import in.iaf.cdma.inventroy.service.RoleMasterService;

@Service
@Transactional
public class RoleMasterServiceImpl implements RoleMasterService{

	@Autowired
	RoleMasterRepository roleMasterRepository;
	
	@Override
	public List<RoleMaster> findAll() {
		return roleMasterRepository.findAll();
	}
	
	

}
