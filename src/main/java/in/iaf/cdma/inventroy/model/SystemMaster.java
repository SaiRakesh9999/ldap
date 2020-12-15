package in.iaf.cdma.inventroy.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="SYSTEM_MASTER")
@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class SystemMaster implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="SYSTEM_ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer systemId;
	
	
	@Column(name="SYSTEM_NAME", unique=true)
	private String systemName;
	
	
	@Column(name="IS_ACTIVE")
	private boolean active;
	
	

}
