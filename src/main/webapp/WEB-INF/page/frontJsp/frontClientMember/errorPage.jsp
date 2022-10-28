<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>

<html class="no-js" lang="en">
<head>
<title>404PAGE</title>
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
						<h2>404page</h2>
					</div>
					<ul>
						<li><a href="frontIndex.html">Home</a></li>
						<li class="active">404page</li>
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
										<img src="<%=request.getContextPath()%>/photo/error.png" width=200 height=200;>
											<div style="margin-bottom:50px;"></div>
											<h3><strong>權限不足，無法進行訪問</strong></h3>
											<h5><strong>建議您進行以下處理：</strong></h5>
											<h5>1. 前往您註冊的信箱進行驗證</h5>
											<h5>2. 聯繫系統管理員：EatWorld2022@gmail.com</h5>
										</div>
										<br>
										<center>
											<button type="button" class="btn btn-warning">
												<a href="http://localhost:8080/EatWorld/login">返回登入頁</a>
											</button>
										</center>
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
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		document.querySelector('#clientEmail').addEventListener('blur',
				checkEmail);
		function checkEmail() {

			var email = document.querySelector('#clientEmail').value;
			const uEmail = document.querySelector('#clientEmail');
			const submit = document.querySelector('#submit');
			var xh = new XMLHttpRequest();
			xh.open("post", "${pageContext.request.contextPath}/checkEmail");
			xh.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			xh.send('email=' + email);
			xh.onload = function() {

				if (xh.responseText == "true") {
					console.log("信箱不存在")
					document.querySelector('#email-validation').innerHTML = "信箱不存在，請重新輸入";
					uEmail.classList.add('is-invalid');
					submit.type = "button";
					submit.id = "button";

				} else {
					console.log("信箱存在")
					uEmail.classList.remove('is-invalid');
					submit.type = "submit";
					submit.id = "submit";
				}
			};
		}
	</script>
	<script>
		document.querySelector('#submit').addEventListener('click', checkEmail);
		function send() {
			Swal.fire({
				icon : 'sucess',
				title : '密碼重置信已寄出',
				text : '請至您的電子信箱確認',
			})
		}
	</script>
</body>
</html>
