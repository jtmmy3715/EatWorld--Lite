<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>廠商後台登入</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
    <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
    <link href="css/style.css" rel="stylesheet">
 
</head>

<body class="h-100">
    
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    



    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href="#"> <h4>EatWorld 廠商後台登入</h4></a>
       							 <div class="form-validation">
                                <form class="mt-5 mb-5 login-input form-valide" id="login" action="ClientMemberServlet" method="post">
                                    <div class="form-group">
                                    	<div>
                                        <input type="text" class="form-control" id="clientUsername" name="clientUsername" placeholder="Username">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                    <div>
                                        <input type="text" class="form-control" id="clientPassword" name="clientPassword" placeholder="Password">
                                   </div>
                                    </div>
                                    <c:if test="${ requestScope.error !=null }">
                                    <span id="error" style="color:red;">*帳號密碼有誤</span>
                                    </c:if>
                                    <button class="btn login-form__btn submit w-100">Sign in</button>
                                </form>
                             <%--   <p class="mt-5 login-form__footer">Don't have account? <a href="register.jsp" class="text-primary">Sign Up</a></p> --%> 
                            </div>
                            <button type="button" class="btn btn-outline-secondary">管理者登入</button>
                                <button type="button" class="btn btn-outline-secondary">廠商登入</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="<%=request.getContextPath()%>/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/custom.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/settings.js"></script>
    <script src="<%=request.getContextPath()%>/js/gleek.js"></script>
    <script src="<%=request.getContextPath()%>/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
     <script src="<%=request.getContextPath()%>/plugins/validation/jquery.validate.min.js"></script>
     <script>
	$(function(){
		
		$("#clientUsername").focus(function(){
			$('#error').text("")
			});
	});
	
	</script>
	<script>
	
	(function($) {
		
		
		
	    'use strict';

	    $(document).ready(function() {
	        $(".bs-submit").click(function() {
	      
	          //Fetch form to apply custom Bootstrap validation
	          var form = $(".needs-validation")
	      
	          if (form[0].checkValidity() === false) {
	            event.preventDefault()
	            event.stopPropagation()
	          }

	          form.addClass('was-validated');
	      
	          //Make ajax call here
	      
	        })
	      });

	      function isNumberKey(evt){
	        var charCode = (evt.which) ? evt.which : event.keyCode
	        if (charCode > 31 && (charCode < 48 || charCode > 57))
	            return false;
	        return true;
	    }




	    //to confirm input takes only number input
	    //use class ".shouldNumber" in your html <input type="text" /> element
	    $('.shouldNumber').on('keypress', function() {
	        return isNumberKey(event)
	    });

	  })(jQuery);
		jQuery("#login").validate({
          rules: {
             clientUsername: {
                         required: true,
                     },
             clientPassword: {
                         required: true,
                         minlength: 6
                     }
                 },
            messages: {
          	  clientUsername: {
                    required: "*帳號為必填",
                },
              clientPassword: {
                    required: "*密碼為必填",
                    minlength:$.validator.format("密碼不得少於6個字")
                }
          },
		
		 ignore: [],
		    errorClass: "invalid-feedback animated fadeInUp",
		    errorElement: "div",
		    errorPlacement: function(e, a) {
		        jQuery(a).parents(".form-group > div").append(e)
		    },
		    highlight: function(e) {
		        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")
		    },
		    success: function(e) {
		        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-valid")
		    }


		});
	</script>
	
    
 <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/additional-methods.min.js"></script>

</body>
</html>





