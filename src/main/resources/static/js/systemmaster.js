jQuery(function($) {
	$("#add_system").on("click",".reset", function(){
		$('#systemName').val('');
	});
	
	
	$("#add_system").on("click","#submit_form",function() {
		var systemName=$("#systemName").val();
		
		
		var error ='';
		if(systemName==null || systemName==''){
			$("#systemName").addClass("error");
			error =" Please enter System Name";
		}
		
		
		if(error.length>0){
			$(".valid").html("Note :-"+error);
		}
		else{
			$("#add_system").submit();
		}
	});
	
	$("#add_system").on("change",".user-form",function() {
		$(".user-form").removeClass("error");
		$(".valid").html("");
	});
	
	
	//SUB SYSTEM
	$("#add_subsystem").on("click",".reset", function(){
		$('#subSystemName').val('');
	});
	
	
	$("#add_subsystem").on("click","#submit_form",function() {
		var systemId=$("#systemId").val();
		var subSystemName=$("#subSystemName").val();
		
		var error ='';
		if(systemId==null || systemId==''){
			$("#systemId").addClass("error");
			error =" Please select System Name";
		}
		else if(subSystemName==null || subSystemName==''){
			$("#subSystemName").addClass("error");
			error =" Please enter Sub System Name";
		}
		
		
		if(error.length>0){
			$(".valid").html("Note :-"+error);
		}
		else{
			$("#add_subsystem").submit();
		}
	});
	
	$("#add_subsystem").on("change",".user-form",function() {
		$(".user-form").removeClass("error");
		$(".valid").html("");
	});
	
});
