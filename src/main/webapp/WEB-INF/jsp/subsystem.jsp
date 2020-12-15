<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ include file="main/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/system.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/dataTables.bootstrap.min.css" rel="stylesheet" />

	
	 <div class="purchase">
	 	<div class="test">Sub System Master</div>
		 <div class="row gap">
				<!-- BEGIN FORM-->
								<form:form action="${pageContext.request.contextPath}/master/addsubsystem" id="add_subsystem" modelAttribute="subSystemMaster"
								    class="form-horizontal" method="post">
									<fieldset>
									<div class="col-md-12 col-sm-12 form-row">
												
											<div class="col-md-4 col-sm-4">
													System:
														<select class="span6 m-wrap user-form" style="height:32px; width: 255px;" id="systemId" name="systemMaster.systemId" data-placeholder="Select Category">
															<option>-- Select System--</option>
															<c:forEach items='${systems}' var="cat">
																<option value="${cat.systemId}">
																	<c:out	value="${cat.systemName}"></c:out>
																</option>
															</c:forEach>
														</select>
											</div>
											<div class="col-md-5 col-sm-5">
												    Sub System:
												    <input type="text" placeholder="Sub System Name" name="subSystemName" id="subSystemName" data-required="1" style="width: 255px;" class="span6 m-wrap user-form"/>
											</div>
											<div class="col-md-3 col-sm-3">
													Status:
											         <select class="span6 m-wrap user-form" style="height:32px;" id="activeId" name="active" data-placeholder="Select Status">
													   <option value="true">Active</option>
													   <option value="false">In-Active</option>
													 </select>
											</div>
											<input type="hidden" name="subSystemId" id="subSystemId" />
										</div>
                                  		<div class="col-md-12 col-sm-12 modal-footer">
                                  		  <span class="valid" style="float:left;font-size:1em; color:#ff2020; "></span>
                                  			<c:if test="${!empty msg}"> <span style="float:left;font-size:1em;" class="alert alert-success"><c:out value="${msg}" /></span></c:if>
                                            <button type="reset" class="reset btn btn-default">Reset</button>
                                            <button type="button" id="submit_form" class="btn btn-primary">Save</button>
                                    	</div>
										</fieldset>
										</form:form>
				<!-- END FORM-->
                </div>
	 	</div>

		<!-- Datatable start -->
		<div class="container purchase_table"> 
			<div class="col-sm-12 col-md-12 col-lg-12">
			  	<table id="example" class="table table-striped table-bordered" style="width:100%;">
		        <thead>
		            <tr class="thead">
		            	<th>Sl No</th>
		                <th>System Name</th>
		                <th>Sub System Name</th>
		                <th>Status</th>
		                <th>Action</th>
		            </tr>
		        </thead>
		        <tbody>
		        	   <c:if test="${!empty subsystems}">
		            	<c:forEach items='${subsystems}' var="sub">
		            	<tr>
			            	<td></td>
			                <td>
			                	<input type="hidden" value="${sub.systemMaster.systemId}" id="systemId_${sub.subSystemId}">
			                	<c:out value="${sub.systemMaster.systemName}"></c:out><br>
			                </td>
			                <td>
			                <input type="hidden" value="${sub.subSystemName}" id="subSystem_${sub.subSystemId}">
			                <c:out value="${sub.subSystemName}"></c:out></td>
			                <td>
			                	<input type="hidden" value="${sub.active}" id="active_${sub.subSystemId}">
								<c:if test="${sub.active eq true}">Active</c:if>
			                	<c:if test="${sub.active eq false}">In-Active</c:if>
							</td>
			                <td>
			                	<button class="edit" data-value="${sub.subSystemId}"><i class="fa fa-edit" style="color:#69a857;"></i></button>
								<button class="delete" onclick="functionDeleteFile('${sub.subSystemId}')"><i class="fa fa-trash" style="color:#e10000;"></i></button>
			                </td>
		            </tr>
		            </c:forEach>
		            </c:if>
		         </tbody>
		         </table>
		          </div>
		</div>
		

<%@ include file="main/footer.jsp" %>
<script src="${pageContext.request.contextPath}/js/systemmaster.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap.min.js"></script>
<script>
function functionDeleteFile(subSystemId){
	if(confirm("Do You want to delete Sub System?")){
		window.location.href="${pageContext.request.contextPath}/master/deletesubsystem?subSystemId="+subSystemId;
	}else{
	
	 return false;
	 
 	}
}
$(document).ready(function() {
	

   $('#example').DataTable({
	   "fnRowCallback": function(nRow, aData, iDisplayIndex){
		   $("td:nth-child(1)", nRow).html(iDisplayIndex+1);
		   return nRow;
	   }
	  
    });
   
   $(".edit").on('click', function(){
	   var subSystemId=$(this).data('value');
	   var systemId=$("#systemId_"+subSystemId).val();
	   var subSystem=$("#subSystem_"+subSystemId).val();
	   var active=$("#active_"+subSystemId).val();
	   
	   $("#subSystemId").val(subSystemId);
	   $("#systemId").val(systemId);
	   $("#systemId").trigger('change');
	   $("#subSystemName").val(subSystem);
	   $("#activeId").val(active);
	   $("#activeId").trigger('change');
	   $("html, body").animate({scrollTop:0},"slow");
   });
	
});

</script>