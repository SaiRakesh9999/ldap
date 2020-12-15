 $(document).ready(function() {
			$('.reset').on('click',function(e){
					var test=$('#add_user');
					test.validate().resetForm();
					test[0].reset();
					$("input").closest('.control-group').removeClass('error');
					$("select").closest('.control-group').removeClass('error');
					$("input").closest('.control-group').removeClass('success');
					$("select").closest('.control-group').removeClass('success');
					$(".checkuser").removeClass("error");
		});
 });
var FormValidation = function () {
    var handleValidation1 = function() {
            var form1 = $('#add_user');
            var form2 = $("#edit_user");
            form1.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",
                rules: {
                	username: {
                        minlength: 5,
                        maxlength: 20,
                        required: true
                    },
                    password: {
                        minlength: 8,
                        maxlength: 20,
                        required: true
                    },
                    confirmpassword: {
                        minlength: 8,
                        maxlength: 20,
                        required: true,
                        equalTo: '#password'
                    },
                    roleId: {
                        required: true,
                    },
                    isActive: {
                        required: true,
                    },
                },
                messages:{
                	required: "You must confirm your password.",
                	confirmpassword : "Password must match."
                },
                invalidHandler: function (event, validator) { //display error alert on form submit              
                    //success1.hide();
                    //error1.show();
                    //FormValidation.scrollTo(error1, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.help-inline').removeClass('ok'); // display OK icon
                    $(element)
                        .closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.control-group').removeClass('error'); // set error class to the control group
                },

                success: function (label) {
                    label
                        .addClass('valid').addClass('help-inline ok') // mark the current input as valid and display OK icon
                    .closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group
                },

                submitHandler: function (form) {
                	form.submit();
                	
                }
            });
            
            form2.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",
                rules: {
                	username: {
                        minlength: 5,
                        maxlength: 20,
                        required: true
                    },
                    password: {
                        minlength: 8,
                        maxlength: 20,
                        required: true
                    },
                    confirmpassword: {
                        minlength: 8,
                        maxlength: 20,
                        required: true,
                        equalTo: '#password1'
                    },
                    roleId: {
                        required: true,
                    },
                    isActive: {
                        required: true,
                    },
                },
                messages:{
                	required: "You must confirm your password.",
                	confirmpassword : "Password must match."
                },
                invalidHandler: function (event, validator) { //display error alert on form submit              
                    //success1.hide();
                    //error1.show();
                    //FormValidation.scrollTo(error1, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.help-inline').removeClass('ok'); // display OK icon
                    $(element)
                        .closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.control-group').removeClass('error'); // set error class to the control group
                },

                success: function (label) {
                    label
                        .addClass('valid').addClass('help-inline ok') // mark the current input as valid and display OK icon
                    .closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group
                },

                submitHandler: function (form) {
                	form.submit();
                	
                }
            });
    }

    return {
        //main function to initiate the module
        init: function () {

            handleValidation1();

        },


    };

}();