package in.iaf.cdma.inventroy.model;

import java.io.Serializable;
import java.util.Date;

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
@Table(name="INVENTORY_MASTER")
@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class InventoryMaster implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="INV_ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer invId;
	
	@Column(name="COMMAND_NAME")
	private String command;
	
	@Column(name="UNIT_NAME")
	private String unitName;
	
	@Column(name="AOR")
	private String aor;
	
	@ManyToOne
	@JoinColumn(name="SYSTEM_ID")
	private SystemMaster system;
	
	@ManyToOne
	@JoinColumn(name="SUB_SYSTEM_ID")
	private SubSystemMaster subSystem;
	
	@Column(name="DESCRIPTION")
	private String description;
	
	@Column(name="GIG_NO")
	private String gigNo;
	
	@Column(name="ITEM_SERIAL_NO")
	private String itemSerailNo;
	
	@Column(name="FITTED_SPARE")
	private String fittedSpare;
	
	@Column(name="LOCATION")
	private String location;
	
	@Column(name="RACK")
	private String rack;
	
	@Column(name="SERVICE_STATUS")
	private String serviceabilityStatus;
	
	@Column(name="REMARKS")
	private String remarks;
	
	@Column(name="CREATED_BY")
	private String createdBy;
	
	@Column(name="CREATED_ON")
	private Date createdOn;
	
	@Column(name="STATUS")
	private boolean active;
	
}
