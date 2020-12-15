package in.iaf.cdma.inventroy.model;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ROLE_MASTER")
@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class RoleMaster {

    @Id
    @Column(name = "ROLE_ID")
    private String roleId;

    @Column(name="ROLE_NAME",unique = true)
    private String roleName;

}
