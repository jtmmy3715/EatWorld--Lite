<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<title>更改密碼</title>
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
						<h2>會員中心</h2>
					</div>
					<%--<ul>
								<li><a href="frontIndex.jsp">首頁</a></li>
								<li class="active">my account</li>
								</ul>--%>
				</div>
			</div>
		</div>
		<!-- my account wrapper start -->
		<div class="my-account-wrapper pt-100 pb-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- My Account Page Start -->
						<div class="myaccount-page-wrapper">
							<!-- My Account Tab Menu Start -->
							<div class="row">
								<div class="col-lg-3 col-md-4">
									<div class="myaccount-tab-menu nav" role="tablist">
										<a href="${pageContext.request.contextPath}/user/accountInfo"><i
											class="fa fa-user"></i>會員資料</a> <a
											href="${pageContext.request.contextPath}/user/changePwd"><i
											class="fa fa-cogs"></i>更改密碼</a> <a
											href="${pageContext.request.contextPath}/user/orders"><i

											class="fa fa-cart-arrow-down"></i>我的訂單</a> <a

											href="${pageContext.request.contextPath}/front/booking/client/${user.clientId}"><i
											class="fa fa-clipboard"></i>我的訂位</a><a
											href="${pageContext.request.contextPath}/user/wishList"><i
											class="fa fa-heart"></i>收藏商家</a> <a
											href="${pageContext.request.contextPath}/logout"><i
											class="fa fa-sign-out"></i>會員登出</a>
									</div>
								</div>
								<!-- My Account Tab Menu End -->
								<!-- My Account Tab Content Start -->
								<div class="col-lg-9 col-md-8">
									<div class="tab-content" id="myaccountContent">
										<!-- pswChange Start -->
										<div id="pswChange" role="tabpanel">
											<div class="myaccount-content">
												<h3>更改密碼</h3>
												<div class="account-details-form">
													<form action="<%=request.getContextPath()%>/changePwd"
														method="post" class="needs-validation  form-valide"
														novalidate>
														<input type="hidden" name="clientId"
															value="${ user.clientId }">
														<div class="single-input-item">
															<div class="form-group">
																<label for="current-pwd" class="required">目前的密碼</label><input
																	type="password" id="current-pwd" class="form-control"
																	placeholder="舊密碼" required />
																<div id="currentpwd-validation" class="invalid-feedback">密碼有誤，請重新輸入</div>
															</div>
														</div>
														<div class="single-input-item">
															<div class="form-group">
																<label for="new-pwd" class="required">新密碼</label><input
																	type="password" id="newpwd" name="newpwd"
																	class="form-control" placeholder="請輸入新的密碼" />
																<div id="newpwd-validation" class="invalid-feedback">密碼請設定8至16位，且由字母和數字組成</div>
															</div>
														</div>
														<div class="single-input-item">
															<div class="form-group">
																<label for="confirm-pwd" class="required">確認密碼</label><input
																	type="password" id="confirm-pwd" class="form-control"
																	placeholder="請再次輸入新密碼" />
																<div id="confirmpwd-validation" class="invalid-feedback">與上述密碼不相符，請重新確認</div>
															</div>
														</div>
														<div class="single-input-item">
															<button id="submit" class="check-btn sqr-btn ">確定修改</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- pswChange End -->
									</div>
								</div>
								<!-- My Account Tab Content End -->
							</div>
						</div>
						<!-- My Account Page End -->
					</div>
				</div>
			</div>
		</div>
		<!-- my account wrapper end -->
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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://kit.fontawesome.com/98dd64d592.js"
		crossorigin="anonymous"></script>
	<script>
		document.querySelector('#current-pwd').addEventListener('blur',
				validatePwd);
		document.querySelector('#newpwd').addEventListener('blur',
				validateNewPwd);
		document.querySelector('#confirm-pwd').addEventListener('blur',
				validateConfirmPwd);
		const reSpaces = /^\S*$/; //不能為空或者空白鍵

		function validatePwd(e) {
			const pwd = document.querySelector('#current-pwd');
			const re = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;

			if (reSpaces.test(pwd.value) && re.test(pwd.value)) {
				
				
					var oldPwd = document.querySelector('#current-pwd').value;
					var result = "";
					var xh = new XMLHttpRequest();
					xh.open("post", "${pageContext.request.contextPath}/checkPwd",false);
					xh.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
					xh.send('pwd=' + oldPwd+'&'+'clientId='+${user.clientId});

						if (xh.status == 200) {
							result= xh.responseText;
							console.log("裡面結果是"+result);

					};
					console.log("外面結果是"+result);
					
					if(result=="true"){
						
						pwd.classList.remove('is-invalid');
						pwd.classList.add('is-valid');
						return true;
					}else{
						console.log("noooo");
						pwd.classList.add('is-invalid');
						pwd.classList.remove('is-valid');
						return false;
					}
			} else {
				pwd.classList.add('is-invalid');
				pwd.classList.remove('is-valid');
				
			}
		}

		function validateNewPwd(e) {
			const pwd = document.querySelector('#newpwd');
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
			const pwd = document.querySelector('#newpwd');
			const cPwd = document.querySelector('#confirm-pwd');

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

			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(
					function(form) {
						form.addEventListener('submit', function(event) {
							if (!form.checkValidity() || !validatePwd()
									|| !validateNewPwd()
									|| !validateConfirmPwd()) {
								event.preventDefault()
								event.stopPropagation()
							}

							form.classList.add('was-validated')
						}, false)
					})
		})()
	</script>
</body>

</html>