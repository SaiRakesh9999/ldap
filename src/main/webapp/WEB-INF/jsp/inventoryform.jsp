<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ include file="main/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/system.css" rel="stylesheet" />

	
	 <div class="purchase">
	 	<div class="test">Inventory</div>
		 <div class="row gap">
				<!-- BEGIN FORM-->
								<form:form action="${pageContext.request.contextPath}/inventory/addinventory" id="add_inventory" modelAttribute="inventoryMaster"
								    class="form-horizontal" method="post">
									<fieldset>
									<div class="col-md-12 col-sm-12 form-row">
											<input type="hidden" name="invId" value="${inventoryMaster.invId}">
											<div class="col-md-4 col-sm-4">
													Command:
														 <input type="text" placeholder="Command Name" name="command" id="command" value="${inventoryMaster.command}" class="span6 m-wrap user-form"/>
											</div>
											<div class="col-md-4 col-sm-4">
												    Unit:
												    <input type="text" placeholder="Unit Name" name="unitName" id="unitName" value="${inventoryMaster.unitName}" class="span6 m-wrap user-form"/>
											</div>
											<div class="col-md-4 col-sm-4">
												AOR:<input type="text" name="aor" id="aor" class="span6 m-wrap user-form" value="${inventoryMaster.aor}"  placeholder="AOR"/>
											</div>
										</div>
										<div class="col-md-12 col-sm-12 form-row">
												<div class="col-md-4 col-sm-4">
													System:
														<select class="span6 m-wrap user-form" style="height:32px;" id="systemId" name="system.systemId" data-placeholder="Select System">
															<option value="">-- Select System--</option>
															<c:forEach items='${systems}' var="sys">
																<option value="${sys.systemId}" <c:if test="${inventoryMaster.system.systemId eq  sys.systemId}">selected='selected'</c:if>>
																	<c:out	value="${sys.systemName}"></c:out>
																</option>
															</c:forEach>
														</select>
											</div>
											<div class="col-md-4 col-sm-4">
												    Sub System:
												    <input type="hidden" id="subId" value="${inventoryMaster.subSystem.subSystemId}">
												    <select class="span6 m-wrap user-form" style="height:32px;" id="subSystemId" name="subSystem.subSystemId"  required="required" data-placeholder="Select Sub System">
															<option value="">-- Select Sub System--</option>
													</select>
											</div>
											<div class="col-md-4 col-sm-4">
												Desc:<textarea name="description" placeholder="Description" id="description" class="span6 m-wrap user-form"/><c:out value="${inventoryMaster.description}"/></textarea>
											</div>
										</div>
										<div class="col-md-12 col-sm-12 form-row">
												<div class="col-md-4 col-sm-4">
													GIG No:
													<input type="text" placeholder="GIG No" name="gigNo" id="gigNo" value="${inventoryMaster.gigNo}" class="span6 m-wrap user-form"/></div>
												<div class="col-md-4 col-sm-4">
													Serial No:
													<input type="text" placeholder="Item Serial No" name="itemSerailNo" id="itemSerailNo" value="${inventoryMaster.itemSerailNo}" required="required" class="span6 m-wrap user-form"/></div>
												<div class="col-md-4 col-sm-4">
													Fitted/Spare:
													<input type="text" placeholder="Fitted/Spare" name="fittedSpare" id="fittedSpare" value="${inventoryMaster.fittedSpare}" class="span6 m-wrap user-form"/>
												</div>
											
										</div>
										<div class="col-md-12 col-sm-12 form-row">
												<div class="col-md-4 col-sm-4">
													Location:
													<input type="text" placeholder="Location" name="location" id="location" value="${inventoryMaster.location}" class="span6 m-wrap user-form"/></div>
												<div class="col-md-4 col-sm-4">
													Rack:
													<input type="text" placeholder="Rack" name="rack" id="rack"  value="${inventoryMaster.rack}" class="span6 m-wrap user-form"/>
												</div>
												<div class="col-md-4 col-sm-4">
													Serviceability:
													<select class="span6 m-wrap user-form"  style="height:32px;" id="serviceabilityStatus" name="serviceabilityStatus" data-placeholder="Select  Serviceability Status" >
															<option>--Select Serviceability--</option>
															<option value="S" <c:if test="${inventoryMaster.serviceabilityStatus eq 'S'}">selected='selected'</c:if>>S</option>
															<option value="U/S" <c:if test="${inventoryMaster.serviceabilityStatus eq 'U/S'}">selected='selected'</c:if>>U/S</option>
												</select>
												</div>
										</div>
										
										<div class="col-md-12 col-sm-12 form-row">
												<div class="col-md-4 col-sm-4">
													Status:
													         <select class="span6 m-wrap user-form" style="height:32px;" id="activeId" name="active" data-placeholder="Select Status">
															   <option value="true" <c:if test="${inventoryMaster.active eq true}">selected='selected'</c:if>>Active</option>
															   <option value="false" <c:if test="${inventoryMaster.active eq false}">selected='selected'</c:if>>In-Active</option>
															 </select>
												</div>
												<div class="col-md-4 col-sm-4">
													Remarks:
													<textarea name="remarks" placeholder="Remarks"  id="remarks" class="span6 m-wrap user-form"/><c:out value="${inventoryMaster.remarks}"/></textarea>
												</div>
										</div>
                                  		<div class="col-md-12 col-sm-12 modal-footer">
                                  		  <span class="valid" style="float:left;font-size:1em; color:#ff2020;"></span>
                                  		  <c:if test="${!empty msg}"><span style="float:left;font-size:1em;" class="alert alert-success"><c:out value="${msg}" /></span></c:if>
                                           <c:if test="${empty inventoryMaster.invId}"><button type="reset" class="reset btn btn-default" >Reset</button></c:if>
                                            <button type="button" id="submit_form" class="btn btn-primary">Save</button>
                                    	</div>
										</fieldset>
										</form:form>
				<!-- END FORM-->
                </div>
	 	</div>

				

<%@ include file="main/footer.jsp" %>
<script>
$(document).ready(function() {
	
	$("#add_inventory").on("click",".reset", function(){
		$("#command").val('');
		$('#subSystemName').val('');
		$("#invId").val('');
		$("#unitName").val('');
		$("#aor").val('');
		$("#description").val('');
		$("#gigNo").val('');
		$("#itemSerailNo").val('');
		$("#fittedSpare").val('');
		$("#location").val('');
		$("#rack").val('');
		$("#remarks").val('');
		
	});
	
	
	$("#add_inventory").on("click","#submit_form",function() {
		var systemId=$("#systemId").val();
		var subSystemName=$("#subSystemId").val();
		var itemSerailNo=$("#itemSerailNo").val();
		
		var error ='';
		if(systemId==null || systemId==''){
			$("#systemId").addClass("error");
			error =" Please select System Name";
		}
		else if(subSystemName==null || subSystemName==''){
			$("#subSystemId").addClass("error");
			error =" Please select Sub System Name";
		}
		else if(itemSerailNo==null || itemSerailNo==''){
			$("#itemSerailNo").addClass("error");
			error =" Please enter Item Serial No";
		}
		
		
		if(error.length>0){
			$(".valid").html("Note :-"+error);
		}
		else{
			$("#add_inventory").submit();
		}
	});
	
	$("#add_inventory").on("change",".user-form",function() {
		$(".user-form").removeClass("error");
		$(".valid").html("");
	});
	
	 $("#systemId").on("change",function() {
			var systemId = $.trim($(this).val());
			$("#subSystemId").html('');
				$.ajax({
							type : 'POST',
							url : '${pageContext.request.contextPath}/master/findbysystemId',
							dataType : "json",
							data : {"systemId" : systemId},
							success : function(data) {
								var str="<option>--Select Sub System--</option>";
								$.each(data,function(k,v){
									var sub=$("#subId").val();
									var select="";
									if(sub!=null || sub!=""){
										if(sub==v.subSystemId){
											select+="selected='selected'";
										}
									}
									str+='<option value="'+v.subSystemId+'"'+select+'>'+v.subSystemName+'</option>';
								});
								$("#subSystemId").append(str);
							},
							error : function(e, v, t) {
							}
						});
		});
	
	 $("#systemId").trigger('change');
});
</script>