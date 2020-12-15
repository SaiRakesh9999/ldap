package in.iaf.cdma.inventroy.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.iaf.cdma.inventroy.model.InventoryMaster;
import in.iaf.cdma.inventroy.repository.InventoryMasterRepository;
import in.iaf.cdma.inventroy.service.InventoryMasterService;

@Service
@Transactional
public class InventoryMasterServiceImpl implements InventoryMasterService {

	@Autowired
	InventoryMasterRepository inventoryMasterRepository;
	
	@Override
	public InventoryMaster find(Integer invId) {
		return inventoryMasterRepository.findById(invId).orElse(null);
	}

	@Override
	public List<InventoryMaster> findAll() {
		return inventoryMasterRepository.findAll();
	}

	@Override
	public List<InventoryMaster> findByActive() {
		return inventoryMasterRepository.findByActive(true);
	}

	@Override
	public List<InventoryMaster> findByServiceabilityStatus(String serviceabilityStatus) {
		return inventoryMasterRepository.findByServiceabilityStatusAndActive(serviceabilityStatus, true);
	}

	@Override
	public List<InventoryMaster> findBySystemId(Integer systemId) {
		return inventoryMasterRepository.findBySystemSystemIdAndActive(systemId, true);
	}

	@Override
	public List<InventoryMaster> findBySubSystemId(Integer subSystemId) {
		return inventoryMasterRepository.findBySubSystemSubSystemIdAndActive(subSystemId, true);
	}

	@Override
	public List<InventoryMaster> findBySystemIdAndServiceabilityStatus(Integer systemId, String serviceabilityStatus) {
		return inventoryMasterRepository.findBySystemSystemIdAndServiceabilityStatusAndActive(systemId, serviceabilityStatus, true);
	}

	@Override
	public List<InventoryMaster> findBySubSystemIdAndServiceabilityStatus(Integer subSystemId,
			String serviceabilityStatus) {
		return inventoryMasterRepository.findBySubSystemSubSystemIdAndServiceabilityStatusAndActive(subSystemId, serviceabilityStatus, true);
	}

	@Override
	public InventoryMaster save(InventoryMaster inventoryMaster) {
		return inventoryMasterRepository.save(inventoryMaster);
	}

	@Override
	public void delete(Integer invId) {
		InventoryMaster inv=find(invId);
		if(inv!=null) {
			inv.setActive(false);
			inventoryMasterRepository.save(inv);
		}
	}

	@Override
	public InventoryMaster findBySystemSystemIdAndSubSystemSubSystemIdAndItemSerailNo(Integer systemId,
			Integer subSystemId, String serailNo) {
		return inventoryMasterRepository.findBySystemSystemIdAndSubSystemSubSystemIdAndItemSerailNo(systemId, subSystemId, serailNo);
	}

}
