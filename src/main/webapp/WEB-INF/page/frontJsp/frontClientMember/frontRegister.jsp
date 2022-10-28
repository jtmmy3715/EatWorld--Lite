<%@page import="java.util.List" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
				<!doctype html>
				<html class="no-js" lang="en">

				<head>
					<title>註冊會員</title>
					<%@include file="/resources/includes/frontHead.jsp" %>
						<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
				</head>

				<body>
					<div class="main-wrapper wrapper-2">
						<!--**********************************Header start**************************************-->
						<%@include file="/resources/includes/frontHeader.jsp" %>
							<!--**********************************Header end****************************************-->
							<div class="breadcrumb-area pt-95 pb-100 bg-img"
								style="background-image: url(<%=request.getContextPath()%>/resources/assets/images/bg/breadcrumb.jpg);">
								<div class="container">
									<div class="breadcrumb-content text-center">
										<div class="breadcrumb-title">
											<h2>註冊會員</h2>
										</div>
										<ul>
											<li><a href="frontIndex.html">Home</a></li>
											<li class="active">Register</li>
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
																<h4>註冊會員</h4>
															</div>
															<div class="login-register-form">
																<div class="form-validation">
																	<form
																		class="mt-5 mb-5 login-input form-valide needs-validation"
																		id="register" action="registerClient"
																		method="post" novalidate>
																		<div class="form-group">
																			<div>
																				<input type="text"
																					class="form-control clientUsername"
																					id="clientUsername"
																					name="clientUsername"
																					placeholder="帳號請設定8至16位，且由字母和數字組成"
																					required />
																				<div id="username-valid"
																					class="valid-feedback">此帳號可使用</div>
																				<div id="username-validation"
																					class="invalid-feedback">
																					帳號請設定8至16位，且由字母和數字組成</div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<input type="password"
																					class="form-control"
																					id="clientPassword"
																					name="clientPassword"
																					placeholder="密碼請設定8至16位，且由字母和數字組成"
																					required />
																				<div id="pwd-validation"
																					class="invalid-feedback">
																					密碼請設定8至16位，且由字母和數字組成</div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div>
																				<input type="password"
																					class="form-control" id="confirmPwd"
																					name="confirmPwd"
																					placeholder="請再次輸入密碼" required>
																				<div id="confirmpwd-validation"
																					class="invalid-feedback">
																					與上述密碼不相符，請重新確認</div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div>
																				<input type="text" class="form-control"
																					id="clientName" name="clientName"
																					placeholder="請輸入用戶名稱" required />
																				<div id="name-validation"
																					class="invalid-feedback">用戶名稱為必填
																				</div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div>
																				<input type="text" class="form-control"
																					id="clientEmail" name="clientEmail"
																					placeholder="請輸入Email" required />
																				<div id="email-valid"
																					class="valid-feedback">此信箱可使用</div>
																				<div id="email-validation"
																					class="invalid-feedback">
																					請輸入正確Email格式</div>
																			</div>
																		</div>
																		<div class="button-box"
																			style="text-align: center;">
																			<button type="submit" id="submit">會員註冊</button>
																			<button type="button"
																				id="data">一鍵輸入</button>
																		</div>
																	</form>

																	<p class="mt-5 login-form__footer"
																		style="text-align: center;">
																		已經有帳號? <a href="login"
																			class="text-primary">會員登入</a>
																	</p>
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
							<%@include file="/resources/includes/frontFooter.jsp" %>
								<!--**********************************Footer end****************************************-->
					</div>
					<!-- JS============================================ -->
					<!-- Modernizer JS -->
					<script
						src="<%=request.getContextPath()%>/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
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
					<script
						src="<%=request.getContextPath()%>/resources/assets/js/plugins/jquery-ui-touch-punch.js"></script>
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
					<script
						src="<%=request.getContextPath()%>/resources/plugins/validation/jquery.validate.min.js"></script>
					<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
					<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
					<script>
						document.querySelector('#clientUsername').addEventListener('blur',
							validateUsername);
						document.querySelector('#clientPassword').addEventListener('blur',
							validatePwd);
						document.querySelector('#confirmPwd').addEventListener('blur',
							validateConfirmPwd);
						document.querySelector('#clientName').addEventListener('blur',
							validateName);
						document.querySelector('#clientEmail').addEventListener('blur',
							validateEmail);

						const reSpaces = /^\S*$/; //不能為空或者空白鍵

						function validateUsername(e) {
							const uName = document.querySelector('#clientUsername');
							const re = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;

							if (reSpaces.test(uName.value) && re.test(uName.value)) {
								checkUsername();
								return true;

							} else {
								document.querySelector('#username-valid').innerHTML = "";
								document.querySelector('#username-validation').innerHTML = "帳號請設定8至16位，且由字母和數字組成";
								uName.classList.add('is-invalid');
								uName.classList.remove('is-valid');
								return false;
							}
						}

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

						function validateName(e) {
							const name = document.querySelector('#clientName');

							if (reSpaces.test(name.value) && name != '') {
								name.classList.remove('is-invalid');
								name.classList.add('is-valid');
								return true;
							} else {
								name.classList.add('is-invalid');
								name.classList.remove('is-valid');
								return false;
							}
						}

						function validateEmail(e) {
							const email = document.querySelector('#clientEmail');
							const re = /^([a-zA-Z0-9_\-?\.?]){3,}@([a-zA-Z]){3,}\.([a-zA-Z]){2,5}$/;

							if (reSpaces.test(email.value) && re.test(email.value)) {
								email.classList.remove('is-invalid');
								email.classList.add('is-valid');
								checkEmail();
								return true;

							} else {
								document.querySelector('#email-valid').innerHTML = "";
								document.querySelector('#email-validation').innerHTML = "請輸入正確Email格式";
								email.classList.add('is-invalid');
								email.classList.remove('is-valid');
								return false;
							}
						}

						(function () {
							'use strict'

							// Fetch all the forms we want to apply custom Bootstrap validation styles to
							var forms = document.querySelectorAll('.needs-validation')

							// Loop over them and prevent submission
							Array.prototype.slice.call(forms).forEach(
								function (form) {
									form.addEventListener('submit', function (event) {
										if (!form.checkValidity() || !validateUsername()
											|| !validatePwd() || !validateConfirmPwd()
											|| !validateName() || !validateEmail()) {
											event.preventDefault()
											event.stopPropagation()
										}

										form.classList.add('was-validated')
									}, false)
								})
						})()
					</script>
					<script>
						function checkUsername() {

							var name = document.querySelector('#clientUsername').value;
							const uName = document.querySelector('#clientUsername');
							var xh = new XMLHttpRequest();
							xh.open("post", "${pageContext.request.contextPath}/checkUsername");
							xh.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
							xh.send('username=' + name);
							xh.onload = function () {

								if (xh.responseText == "true") {
									console.log("yess")
									document.querySelector('#username-valid').innerHTML = "此帳號可使用";
									uName.classList.remove('is-invalid');
									uName.classList.add('is-valid');

								} else {
									console.log("nooo")
									document.querySelector('#username-valid').innerHTML = "";
									document.querySelector('#username-validation').innerHTML = "帳號已存在，請重新輸入";
									uName.classList.add('is-invalid');
									uName.classList.remove('is-valid');
								}
							};
						}

						function checkEmail() {

							var email = document.querySelector('#clientEmail').value;
							const uEmail = document.querySelector('#clientEmail');
							var xh = new XMLHttpRequest();
							xh.open("post", "${pageContext.request.contextPath}/checkEmail");
							xh.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
							xh.send('email=' + email);
							xh.onload = function () {

								if (xh.responseText == "true") {
									console.log("yesss")
									document.querySelector('#email-valid').innerHTML = "此信箱可使用";
									uEmail.classList.remove('is-invalid');
									uEmail.classList.add('is-valid');


								} else {
									console.log("nooo")
									document.querySelector('#email-valid').innerHTML = "";
									document.querySelector('#email-validation').innerHTML = "信箱已存在，請重新輸入";
									uEmail.classList.add('is-invalid');
									uEmail.classList.remove('is-valid');
								}
							};
						}
					</script>
					<script>
						$("#checkEye").click(function () {
							if ($(this).hasClass('fa-eye')) {
								$("#clientPassword").attr('type', 'text');
							} else {
								$("#clientPassword").attr('type', 'password');
							}
							$(this).toggleClass('fa-eye').toggleClass('fa-eye-slash');
						});
					</script>
					<!--<script>
	function checkUsername(){
			$.ajax({
				url : "${pageContext.request.contextPath}/user/checkUsername",
				type : 'POST',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				data : {
					username : $("#clientUsername").val()
				},
				success : function(data) {
				}	
			});
	}
	</script>  -->
					<script>
						$(function () {

							$('#data').click(function () {

								$('#clientUsername').val("emily1013");
								$('#clientPassword').val("test12345");
								$('#confirmPwd').val("test12345");
								$('#clientName').val("艾蜜莉");
								$('#clientEmail').val("yunchieh1997@gmail.com");
							})

						})
					</script>
				</body>
				</html>