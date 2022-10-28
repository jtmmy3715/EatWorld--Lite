<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>

<html class="no-js" lang="en">
<head>
<title>會員登入</title>
<%@include file="/resources/includes/frontHead.jsp"%>
</head>
<body>
	<div class="main-wrapper wrapper-2">
		<!--**********************************Header start**************************************-->
		<%@include file="/resources/includes/frontHeader.jsp"%>
		<!--**********************************Header end****************************************-->
		<div class="breadcrumb-area pt-95 pb-100 bg-img"
			style="background-image: url(<%=request.getContextPath()%>/resources/assets/images/bg/breadcrumb.jpg);">
			<div class="container">
				<div class="breadcrumb-content text-center">
					<div class="breadcrumb-title">
						<h2>會員登入</h2>
					</div>
					<ul>
						<li><a href="frontIndex.html">Home</a></li>
						<li class="active">Login</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="login-register-area pt-100 pb-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-7 col-md-12 ml-auto mr-auto">
						<div class="login-register-wrapper">
							<div class="login-register-tab-list nav"></div>
							<div class="tab-content">
								<div id="lg1" class="tab-pane active">
									<div class="login-form-container">
										<div style="text-align: center;">
											<h4>會員登入</h4>
										</div>
										<div id="error" style="color: #FF5151; text-align: center;">${error}</div>
										<div id="logout" style="color: #FF9224; text-align: center;">${msg}</div>
										<div class="login-register-form">
											<div class="form-validation">
												<form class="mt-5 mb-5 login-input form-valide" id="login"
													action="login" method="post">
													<div class="form-group">
														<div>
															<input type="text" class="form-control clientUsername "
																id="username" name="username" placeholder="Username">
														</div>
													</div>
													<div class="form-group">
														<div>
															<input type="password" class="form-control" id="pwd"
																name="password" placeholder="Password">
														</div>
													</div>
													<div class="button-box">
														<div class="login-toggle-btn">
															<input type="checkbox" id="seePwd" onclick="showPwd()"><label>顯示密碼</label><a
																href="forgetPwd">忘記密碼</a> <br /> <input
																name="remember-key" type="checkbox"><label>記住我</label>
														</div>
													</div>
													<div style="margin-left:100px"><span id="recaptcha_box"></span></div>
													<br>
													<div class="button-box" id="box" style="text-align: center; display:none;">
														<button type="submit">會員登入</button>
													</div>
													<div style="text-align: center; margin: 10px;">
														<button class="btn btn-outline-secondary btn-sm"
															type="button" id="reg">未驗證會員</button>
														<button class="btn btn-outline-secondary btn-sm"
															type="button" id="client">已驗證會員</button>
														<button class="btn btn-outline-secondary btn-sm"
															type="button" id="admin">管理者</button>
														<button class="btn btn-outline-secondary btn-sm"
															type="button" id="store">商家</button>
														<a href="/EatWorld/oauth2/authorization/google">
															<button class="btn btn-outline-secondary btn-sm"
																type="button">
																<i class="fa-brands fa-google"></i>
															</button>
														</a>
													</div>
													<div></div>
													<p class="mt-5 login-form__footer"
														style="text-align: center;">
														還沒有帳號? <a href="register" class="text-primary">註冊帳號</a>
													</p>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/frontFooter.jsp"%>
		<!--**********************************Footer end****************************************-->
	</div>
	<!-- JS============================================ -->
	<!-- Modernizer JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
	<!-- jQuery JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/jquery-3.3.1.min.js"></script>
	<!-- Popper JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/bootstrap.min.js"></script>
	<!-- Slick Slider JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/countdown.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/counterup.js"></script>
	<!--<script src="assets/js/plugins/instafeed.js"></script>-->
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/jquery-ui-touch-punch.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/magnific-popup.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/owl-carousel.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/scrollup.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/waypoints.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/wow.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/slick.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/elevatezoom.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/sticky-sidebar.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/ajax-mail.js"></script>
	<!-- Main JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/resources/plugins/common/common.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/custom.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/settings.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/gleek.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/styleSwitcher.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="<%=request.getContextPath()%>/resources/plugins/validation/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/additional-methods.min.js"></script>
	<script src="https://kit.fontawesome.com/98dd64d592.js" crossorigin="anonymous"></script>
	<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async></script>
	<script>
	$(function(){
		//從打帳號密碼時錯誤訊息消失
		$("#username").focus(function(){
			$('#error').text("")
			$('#logout').text("")
			});
		
	});
	</script>
	<script>
 function showPwd() {
     var x = document.getElementById("pwd");
     if (x.type === "password") {
         x.type = "text";
     } else {
         x.type = "password";
     }
 }
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
             username: {
                         required: true,
                         minlength: 8
                     },
             password: {
                         required: true,
                         minlength: 8
                     }
                 },
            messages: {
          	  username: {
                    required: "*帳號為必填",
                    minlength:"帳號不得少於8個字"
                },
             password: {
                    required: "*密碼為必填",
                    minlength:$.validator.format("密碼不得少於8個字")
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
	<script>
    $(function(){
		
		$('#admin').click(function (){
			
			$('#username').val("eeitadmin1");
			$('#pwd').val("ginaeeit49zzz");
		})
		
		$('#client').click(function (){
			
			$('#username').val("eeitclient1");
			$('#pwd').val("ginaeeit49xxx");
		})
		
		$('#store').click(function (){
			
			$('#username').val("eeitstore1");
			$('#pwd').val("ginaeeit49yyy");
		})
		
		$('#reg').click(function (){
			
			$('#username').val("emily1013");
			$('#pwd').val("test12345");
		})
	
	})
	</script>
	<script>
		var onloadCallback = function() {
				grecaptcha.render("recaptcha_box", {
					"sitekey" : "6LcKP1ghAAAAAIh0TombedBuEZHWzC0EC0HhEmFb",
					"callback" : callback
				});
			};

		function callback() {
				document.getElementById('box').style.display = "block";
				}
	</script>
</body>
</html>
