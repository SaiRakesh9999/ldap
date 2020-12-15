package in.iaf.cdma.inventroy.repository;

import in.iaf.cdma.inventroy.model.RoleMaster;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@Qualifier("roleMasterRepository")
public interface RoleMasterRepository extends JpaRepository<RoleMaster,String> {
}
