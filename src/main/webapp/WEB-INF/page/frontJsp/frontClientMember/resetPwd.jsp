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
						<h2>重置密碼</h2>
					</div>
					<ul>
						<li><a href="frontIndex.html">Home</a></li>
						<li class="active">ResetPassword</li>
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
											<h6>請重新設定您的密碼</h6>
										</div>
										<hr>
										<div class="login-register-form">
											<div class="form-validation">
												<form
													class="mt-5 mb-5 login-input form-valide needs-validation"
													id="sendPwd" action="resetPwd" method="post" novalidate>
													<div class="form-group">
														<div class="input-group">
														<input type="hidden" name="email" value="${email}">
															<input type="password" class="form-control"
																id="clientPassword" name="clientPassword"
																placeholder="新密碼請設定8至16位，且由字母和數字組成" required />
															<div id="pwd-validation" class="invalid-feedback">
																密碼請設定8至16位，且由字母和數字組成</div>
														</div>
													</div>
													<div class="form-group">
														<div>
															<input type="password" class="form-control"
																id="confirmPwd" name="confirmPwd" placeholder="請再次輸入密碼"
																required>
															<div id="confirmpwd-validation" class="invalid-feedback">
																與上述密碼不相符，請重新確認</div>
														</div>
													</div>
													<input type="checkbox" id="seePwd" onclick="showPwd()"><label>顯示密碼</label>
													<div class="button-box" style="text-align: center;">
														<button id="submit" type="submit">送出</button>
														<button id="data" type="button">一鍵輸入</button>
													</div>
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
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		function showPwd() {
			var x = document.getElementById("clientPassword");
			var y = document.getElementById("confirmPwd");
			if (x.type === "password") {
				x.type = "text";
				y.type = "text";
			} else {
				x.type = "password";
				y.type = "password";
			}
		}
	</script>
	<script>
		document.querySelector('#clientPassword').addEventListener('blur',
				validatePwd);
		document.querySelector('#confirmPwd').addEventListener('blur',
				validateConfirmPwd);

		const reSpaces = /^\S*$/; //不能為空或者空白鍵

		function validatePwd(e) {
			const pwd = document.querySelector('#clientPassword');
			const re = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;

			if (reSpaces.test(pwd.value) && re.test(pwd.value)) {
				pwd.classList.remove('is-invalid');
				pwd.classList.add('is-valid');

				return true;
			} else {
				pwd.classList.add('is-invalid');
				pwd.classList.remove('is-valid');
				pwd.classList.remove('was-validated');

				return false;
			}
		}

		function validateConfirmPwd(e) {
			const pwd = document.querySelector('#clientPassword');
			const cPwd = document.querySelector('#confirmPwd');

			if ((cPwd.value) == (pwd.value)) {
				cPwd.classList.remove('is-invalid');
				cPwd.classList.add('is-valid');
				return true;
			} else {
				cPwd.classList.add('is-invalid');
				cPwd.classList.remove('is-valid');
				return false;
			}
		}

		(function() {
			'use strict'

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll('.needs-validation')
			var submit = document.querySelector('#submit');
			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(
					function(form) {
						form.addEventListener('submit', function(event) {
							if (!form.checkValidity() || !validatePwd()
									|| !validateConfirmPwd()) {
								event.preventDefault()
								event.stopPropagation()

							}

							form.classList.add('was-validated')

						}, false)
					})
		})()
	</script>
	<script>
    $(function(){
		$('#data').click(function (){
			$('#clientPassword').val("eeit4911");
			$('#confirmPwd').val("eeit4911");
		});
	})
	</script>
</body>
</html>
