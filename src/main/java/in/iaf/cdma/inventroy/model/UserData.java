package in.iaf.cdma.inventroy.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="USER_DATA")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserData {

    @Id
    @Column(name="USER_NAME")
    private String userName;

    @Column(name="PASSWORD")
    private String password;

    @ManyToOne
    @JoinColumn(name="ROLE_ID")
    private RoleMaster roleId;
    
    @Column(name="IS_ACTIVE")
	private boolean active;

}
