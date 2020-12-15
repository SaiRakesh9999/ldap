package in.iaf.cdma.inventroy.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name="SUB_SYSTEM_MASTER")
@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class SubSystemMaster implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="SUB_SYSTEM_ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer subSystemId;
	
	
	@Column(name="SUB_SYSTEM_NAME")
	private String subSystemName;
	
	@ManyToOne
	@JoinColumn(name="SYSTEM_ID")
	private SystemMaster systemMaster;
	
	@Column(name="IS_ACTIVE")
	private boolean active;
	
	

}
