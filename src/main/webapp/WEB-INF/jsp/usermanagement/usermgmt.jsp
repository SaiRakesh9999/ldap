<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../main/header.jsp"%>
 <link href="${pageContext.request.contextPath}/css/form.css" rel="stylesheet" />
 	<div class="user-mgmt">
		<div class="row">
 				<div class="col-md-12">
 					<div>
 							<span class="error"><c:out value="${userexist}" /></span>
 							<span class="success"><c:out value="${msg}" /></span>
					</div>
                     <!--    Context Classes  -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           USERS LIST
                            <button style="float:right;" class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModalUser">
                              <i class="fa fa-plus" style="color:#ffffff;"></i>
                              ADD USER
                            </button>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>USER NAME</th>
                                            <th>IS ACTIVE</th>
                                            <th>ROLE NAME</th>
                                            <th>ACTION</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${!empty users}">
											<c:forEach items="${users}" var="userList">
											<tr>
												<td>
													<c:out value="${userList.userName}"/>
													<input type="hidden" id="username_${userList.userName}" name="username" value="${userList.userName}"/>
												</td>
												<td>
													<c:if test="${userList.active eq true}">Active</c:if>
													<c:if test="${userList.active eq false}">In-Active</c:if>
													<input type="hidden" id="active_${userList.userName}" name="active" value="${userList.active}"/>
												</td>
												
												<td>
													<c:out value="${userList.roleId.roleName}"/>
													<input type="hidden" id="role_${userList.userName}" name="roleId" value="${userList.roleId.roleId}"/>
												</td>
												<td>
													<button class="edit" data-value="${userList.userName}" data-toggle="modal" data-target="#myModalUser1"><i class="fa fa-edit" style="color:#69a857;"></i></button>
													<button class="delete" onclick="functionDeleteFile('${userList.userName}')"><i class="fa fa-trash" style="color:#e10000;"></i></button>
												</td>
											</tr>
											</c:forEach>
										</c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--  end  Context Classes  -->
                </div>
		</div>
		</div>
		
		 <div class="user-mgmt">
			<div class="row">
				<div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            ROLE LIST
                           <!--   <button style="float:right;" class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModalRole">
	                              <i class="fa fa-plus" style="color:#ffffff;"></i>
	                              ADD ROLE
                           	 </button> -->
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>ROLE ID</th>
                                            <th>ROLE NAME</th>
                                           <!--  <th>ACTION</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <c:if test="${!empty roles}">
											<c:forEach items="${roles}" var="roleList">
											<tr>
												<td><c:out value="${roleList.roleId}"/></td>
												<td><c:out value="${roleList.roleName}"/></td>
												<!-- <td>
													<i class="fa fa-edit" style="color:#69a857;"></i>
													<i class="fa fa-trash" style="color:#e10000; padding-left:20px;"></i>
												</td> -->
											</tr>
											</c:forEach>
										</c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--  end  Context Classes  -->
               	 </div>
			</div>
		</div>
	
					<!-- ADD MODAL USER -->
						 <div class="modal fade" id="myModalUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close reset" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" style="margin-left:20vw" id="myModalLabel">ADD USER</h4>
                                        </div>
                                        <div class="modal-body">
                                         
								<!-- BEGIN FORM-->
								<form action="${pageContext.request.contextPath}/user/adduser" id="add_user" 
								    class="form-horizontal" method="post">
									<fieldset>
										<div class="control-group">
											<label class="control-label checkuser">User Name<span class="required">*</span></label>
											<div class="controls">
												<input type="text" name="userName" id="username" data-required="1" class="span6 m-wrap user-form"/>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Password<span class="required">*</span></label>
											<div class="controls">
												<input name="password" type="password" id="password" class="span6 m-wrap user-form"/>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Confirm Password<span class="required">*</span></label>
											<div class="controls">
												<input name="confirmpassword" type="password" id="confirmpassword" class="span6 m-wrap user-form"/>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Role<span class="required">*</span></label>
											<div class="controls">
												<select class="span6 m-wrap user-form" id="roleId" name="roleId.roleId" data-placeholder="Select Role" >
													<option value="">-- Select Role--</option>
													<c:forEach items='${roles}' var="role">
														<option value="${role.roleId}">
															<c:out	value="${role.roleName}"></c:out>
														</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Status<span class="required">*</span></label>
											<div class="controls">
												<select class="span6 m-wrap user-form" id="isActive" name="active" data-placeholder="Select Status" >
													<option value="true">Active</option>
													<option value="false">In-Active</option>
												</select>
											</div>
										</div>
										
                                        <div class="modal-footer">
                                            <button type="reset" class="reset btn btn-default" >Reset</button>
                                            <button type="submit" id="submit_form" class="btn btn-primary">Save User</button>
                                        </div>
                                        </fieldset>
								  </form>
								  <!-- END FORM-->
								  <div class="error msg"></div>
                                    </div>
                                  
                                </div>
               				</div>
               				</div>
					<!-- ADD MODAL USER -->
					
					
					<!-- EDIT MODAL USER -->
						 <div class="modal fade" id="myModalUser1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close reset" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" style="margin-left:20vw" id="myModalLabel1">EDIT USER</h4>
                                        </div>
                                        <div class="modal-body">
                                         
								<!-- BEGIN FORM-->
								<form action="${pageContext.request.contextPath}/user/adduser" id="edit_user" 
								    class="form-horizontal" method="post">
									<fieldset>
										<div class="control-group">
											<label class="control-label checkuser">User Name<span class="required">*</span></label>
											<div class="controls">
												<input type="text" name="userName" id="username1" data-required="1" class="span6 m-wrap user-form" readonly="readonly"/>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Password<span class="required">*</span></label>
											<div class="controls">
												<input name="password" type="password" id="password1" class="span6 m-wrap user-form"/>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Confirm Password<span class="required">*</span></label>
											<div class="controls">
												<input name="confirmpassword" type="password" id="confirmpassword1" class="span6 m-wrap user-form"/>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Role<span class="required">*</span></label>
											<div class="controls">
												<select class="span6 m-wrap user-form" id="roleId1" name="roleId.roleId" data-placeholder="Select Role" >
													<option value="">-- Select Role--</option>
													<c:forEach items='${roles}' var="role">
														<option value="${role.roleId}">
															<c:out	value="${role.roleName}"></c:out>
														</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Status<span class="required">*</span></label>
											<div class="controls">
												<select class="span6 m-wrap user-form" id="isActive1" name="active" data-placeholder="Select Status" >
													<option value="true">Active</option>
													<option value="false">In-Active</option>
												</select>
											</div>
										</div>
										
                                        <div class="modal-footer">
                                            <button type="submit" id="submit_form_edit" class="btn btn-primary">Update User</button>
                                        </div>
                                        </fieldset>
								  </form>
								  <!-- END FORM-->
								  <div class="error msg"></div>
                                    </div>
                                  
                                </div>
               				</div>
               				</div>
					<!-- ADD MODAL USER -->
					
					
					<!-- ADD MODAL ROLE -->
						 <div class="modal fade" id="myModalRole" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" style="margin-left:20vw" id="myModalLabel">ADD ROLE</h4>
                                        </div>
                                        <div class="modal-body">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
               				</div>
					<!-- ADD MODAL ROLE -->
					
<%@ include file="../main/footer.jsp" %>
<script type="text/javascript">
	function functionDeleteFile(userId){
		if(confirm("Do You want to delete User?")){
			window.location.href="${pageContext.request.contextPath}/user/deleteuser?username="+userId;
		}else{
		
		 return false;
		 
	 	}
	}

$(document).ready(function() {
		$(".reset").on('click', function(){
			$(".msg").html('');
		});
		var test=false;
		$("#add_user").submit(function(event){
				event.preventDefault();
				return false;
			});
		
		$("#add_user").on("change","#username",function() {
			var username=$.trim($(this).val());
			if(username.length>4)
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/checkusername',
				data : {username:username},
				dataType:'json',
				success : function(result) {
						if(result== true){
							$("#username").parent().addClass("error");
							$('.checkuser').addClass("error");
							$(".msg").html('User Name is already exist.');
							test=true;
						}
						else{
							test=false;
						}
					}
			});
		});
		
		$(".edit").on('click', function(){
			var username=$(this).data('value');
			
			var active=$("#active_"+username).val();
			var role=$("#role_"+username).val();
			
			$("#username1").val(username);
			$("#roleId1").val(role);
			$("#isActive1").val(active);
			$("#roleId1").trigger("change");
			$("#isActive1").trigger("change");
		});
		
});
</script>