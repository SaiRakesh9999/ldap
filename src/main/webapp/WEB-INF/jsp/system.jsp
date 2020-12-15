<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ include file="main/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/system.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/dataTables.bootstrap.min.css" rel="stylesheet" />

	
	 <div class="purchase">
	 	<div class="test">System Master</div>
		 <div class="row gap">
				<!-- BEGIN FORM-->
								<form:form action="${pageContext.request.contextPath}/master/addsystem" id="add_system" modelAttribute="systemMaster"
								    class="form-horizontal" method="post">
									<fieldset>
									<div class="col-md-12 col-sm-12 form-row">
											
											<div class="col-md-6 col-sm-6">
												System Name:
												<input type="text" name="systemName" placeholder="System Name" id="systemName" data-required="1" style="width: 280px;" class="span6 m-wrap user-form"/>
											</div>	
											<div class="col-md-4 col-sm-4">
													Status:
													         <select class="span6 m-wrap user-form" style="height:32px;" id="activeId" name="active" data-placeholder="Select Status">
															   <option value="true">Active</option>
															   <option value="false">In-Active</option>
															 </select>
											</div>
												<input type="hidden" name="systemId" id="systemId" />									
											
										</div>
			                      		<div class="col-md-12 col-sm-12 modal-footer">
                                  		  <span class="valid" style="float:left;font-size:1em; color:#ff2020; "></span>
                                  		 <c:if test="${!empty msg}"> <span style="float:left;font-size:1em;" class="alert alert-success"><c:out value="${msg}" /></span></c:if>
                                            <button type="reset" class="reset btn btn-default" >Reset</button>
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
		                <th>Status</th>
		                <th>Action</th>
		            </tr>
		        </thead>
		        <tbody>
		        	   <c:if test="${!empty systems}">
		            	<c:forEach items='${systems}' var="sys">
		            	<tr>
			            	<td></td>
			                <td>
			                	<c:out value="${sys.systemName}"></c:out><br>
			                	<input type="hidden" value="${sys.systemName}" id="systemName_${sys.systemId}">
			                </td>
			                <td><input type="hidden" value="${sys.active}" id="active_${sys.systemId}">
			                	<c:if test="${sys.active eq true}">Active</c:if>
			                	<c:if test="${sys.active eq false}">In-Active</c:if>
			                </td>
			                <td>
			                	<button class="edit" data-value="${sys.systemId}"><i class="fa fa-edit" style="color:#69a857;"></i></button>
								<button class="delete" onclick="functionDeleteFile('${sys.systemId}')"><i class="fa fa-trash" style="color:#e10000;"></i></button>
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
function functionDeleteFile(systemId){
	if(confirm("Do You want to delete System?")){
		window.location.href="${pageContext.request.contextPath}/master/deletesystem?systemId="+systemId;
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
	   var systemId=$(this).data('value');
	   var systemName=$("#systemName_"+systemId).val();
	   var active=$("#active_"+systemId).val();
	   
	   $("#systemId").val(systemId);
	   $("#systemName").val(systemName);
	   $("#activeId").val(active);
	   
	   $("#activeId").trigger('change');
	   $("html, body").animate({scrollTop:0},"slow");
   });
});
</script>