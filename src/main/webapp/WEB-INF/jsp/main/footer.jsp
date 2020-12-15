 <!-- CONTENT-WRAPPER SECTION END-->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    &copy; 2020 Inventory Management | Developed By : <a href="#" target="_blank">Sqn Ldr Mohit Bahal</a>
                </div>

            </div>
        </div>
    </footer>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    
    
    <!-- CORE JQUERY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
      <!-- BOOTSTRAP SCRIPTS  -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
   <script src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
     <script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
    <script src="${pageContext.request.contextPath}/js/form-validation.js"></script>
    <!-- DATE PICKER JS -->
     <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
		jQuery(function($) {
			$('.chosen-select').chosen({
			 allow_single_deselect : true
			});
		})
	</script>
	 <script>
		jQuery(document).ready(function() { 
		   FormValidation.init();
		});
      </script>
	
</body>
</html>