<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ include file="main/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/system.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/dataTables.bootstrap.min.css" rel="stylesheet" />
		  
     <div class="panel panel-default">
		  
		  <div class="panel-heading">
             	<h3>INVENTORY LIST</h3>
             <a href="${pageContext.request.contextPath}/inventory/inventoryfrom" style="float:right; margin-top:-4%;" class="btn btn-primary btn-md">
             	<i class="fa fa-plus" style="color:#ffffff;"></i>
               ADD INVENTORY
             </a>
         </div>
		<!-- Datatable start -->
		<div class="container purchase_table" style="overflow-x: scroll; margin-top: 2%;"> 
			<div class="col-sm-12 col-md-12 col-lg-12">
			  	<table id="example" class="table table-striped table-bordered" style="width:100%;">
		        <thead>
		            <tr class="thead">
		            	<th>Sl No</th>
		                <th>Command</th>
		                <th>Unit</th>
		                <th>AOR</th>
		                <th>System</th>
		                <th>Sub System</th>
		                <th>Description</th>
		                <th>GIG No</th>
		                <th>Item Serial No</th>
		                <th>Fitted/Spare</th>
		                <th>Location</th>
		                <th>Rack</th>
		                <th>Serviceability</th>
		                <th>Status</th>
		                <th>Remarks</th>
		                <th>Action</th>
		            </tr>
		        </thead>
		        <tbody>
		        	   <c:if test="${!empty inventoryList}">
		            	<c:forEach items='${inventoryList}' var="inv">
		            	<tr>
			            	<td></td>
			                <td>
			                	<c:out value="${inv.command}"></c:out><br>
			                </td>
			                <td><c:out value="${inv.unitName}"></c:out></td>
			                <td>
			                	<c:out value="${inv.aor}"></c:out>
			                </td>
			                <td>
			                	<c:out value="${inv.system.systemName}"></c:out>
			                </td>
			                <td>
			                	<c:out value="${inv.subSystem.subSystemName}"></c:out>
			                </td>
			                <td>
			                	<c:out value="${inv.description}"></c:out>
			                </td>
			                <td>
			                	<c:out value="${inv.gigNo}"></c:out>
			                </td>
			                <td>
			                	<c:out value="${inv.itemSerailNo}"></c:out>
			                </td>
			                <td>
			                	<c:out value="${inv.fittedSpare}"></c:out>
			                </td>
			                <td>
			                	<c:out value="${inv.location}"></c:out>
			                </td>
			                <td>
			                	<c:out value="${inv.rack}"></c:out>
			                </td>
			                <td>
			                	<c:out value="${inv.serviceabilityStatus}"></c:out>
			                </td>
			                <td>
			                	<c:if test="${inv.active eq true}">Active</c:if>
			                	<c:if test="${inv.active eq false}">In-Active</c:if>
			                </td>
			                <td>
			                	<c:out value="${inv.remarks}"></c:out>
			                </td>
			                
			                <td>
			                	<button class="edit" data-value="${inv.invId}"><i class="fa fa-edit" style="color:#69a857;"></i></button>
								<button class="delete" onclick="functionDeleteFile('${inv.invId}')"><i class="fa fa-trash" style="color:#e10000;"></i></button>
			                </td>
		            </tr>
		            </c:forEach>
		            </c:if>
		         </tbody>
		         </table>
		          </div>
		</div>
	</div>

<%@ include file="main/footer.jsp" %>
<script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap.min.js"></script>
<script>
function functionDeleteFile(systemId){
	if(confirm("Do You want to delete Item?")){
		window.location.href="${pageContext.request.contextPath}/inventory/deleteinventory?invId="+systemId;
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
	   window.location.href="${pageContext.request.contextPath}/inventory/inventoryfrom?invId="+$(this).data('value');
   });
});
</script>