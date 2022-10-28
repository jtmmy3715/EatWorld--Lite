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
						<h2>忘記密碼</h2>
					</div>
					<ul>
						<li><a href="frontIndex.html">Home</a></li>
						<li class="active">FoegetPassword</li>
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
											<h6>請輸入註冊時填寫的電子信箱，將寄送驗證信至您的信箱</h6>
										</div>
										<hr>
										<div class="login-register-form">
											<div class="form-validation">
												<form class="mt-5 mb-5 login-input form-valide" id="sendPwd"
													action="sendPwd" method="post">
													<div class="form-group">
														<div>
															<input type="text" class="form-control" id="clientEmail"
																name="clientEmail" placeholder="請輸入您的電子信箱" required />
															<div id="email-validation" class="invalid-feedback">
																信箱不存在，請重新輸入</div>
														</div>
													</div>
													<div class="button-box"></div>
													<div class="button-box" style="text-align: center;">
														<button id="submit" type="submit">送出</button>
														<button id="data">一鍵輸入</button>
													</div>
													<p class="mt-5 login-form__footer"
														style="text-align: center;">
														<a href="login" class="text-primary">返回登入頁</a>
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
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
	<!-- jQuery JS -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/vendor/jquery-3.3.1.min.js"></script>
	<!-- Popper JS -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/vendor/bootstrap.min.js"></script>
	<!-- Slick Slider JS -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/countdown.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/counterup.js"></script>
	<!--<script src="assets/js/plugins/instafeed.js"></script>-->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/jquery-ui.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/jquery-ui-touch-punch.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/magnific-popup.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/owl-carousel.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/scrollup.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/waypoints.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/wow.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/slick.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/elevatezoom.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/sticky-sidebar.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/plugins/ajax-mail.js"></script>
	<!-- Main JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/plugins/common/common.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/custom.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/settings.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/gleek.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/styleSwitcher.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/plugins/validation/jquery.validate.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/additional-methods.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		document.querySelector('#clientEmail').addEventListener('blur',
				checkEmail);
		function checkEmail() {

			var email = document.querySelector('#clientEmail').value;
			const uEmail = document.querySelector('#clientEmail');
			var xh = new XMLHttpRequest();
			xh.open("post", "${pageContext.request.contextPath}/checkEmail");
			xh.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			xh.send('email=' + email);
			xh.onload = function() {

				if (xh.responseText == "true") {
					console.log("信箱不存在");
					document.querySelector('#email-validation').innerHTML = "信箱不存在，請重新輸入";
					uEmail.classList.add('is-invalid');
					
					$("#submit").click(function(event){
						  event.preventDefault();
						});

				} else {
					console.log("信箱存在");
					uEmail.classList.remove('is-invalid');
					$('#submit').unbind('click');
					
					$( "#submit" ).click(function() {
						Swal.fire({
							  icon: 'success',
							  title: '請至信箱確認密碼重設信'
							})
						});
				}
			};
		}
	</script>
	<script>
    $(function(){
		$('#data').click(function (){
			$('#clientEmail').val("yunchieh1997@gmail.com");
		});
	})
	</script>
</body>
</html>
