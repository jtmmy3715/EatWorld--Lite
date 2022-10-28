<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<title>會員中心</title>
<%@include file="/resources/includes/frontHead.jsp"%>
<style>
#bgImg {
	border-radius: 50%;
	width: 150px;
	height: 150px;
	overflow: hidden;
	margin-bottom: 30px;
}
</style>
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
											href="${pageContext.request.contextPath}/OrderController/user/orders"><i
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

										<!-- Account Details Start -->
										<div id="account-info" role="tabpanel">
											<div class="myaccount-content">
												<h3>會員資料</h3>
												<div class="account-details-form">
													<form class="form-valide needs-validation"
														action="<%=request.getContextPath()%>/user/saveAccountInfo"
														method="post" id="ClientForm"
														enctype="multipart/form-data" novalidate>
														<div id="bgImg">
															<img id="sourceImage"
																src="<%=request.getContextPath()%>/photo/${user.clientMemberDetail.clientLogo}"
																style="width: 100%; height: 100%;" />
														</div>
														<div>
															<label class="btn btn-light align-text-bottom"> <input
																id="inputImageFile" style="display: none;"
																name="clientLogo" type="file" readonly> <i
																class="fa fa-photo"></i>&nbsp;&nbsp;&nbsp;上傳頭像&nbsp;&nbsp;
															</label>
														</div>
														<div class="row">
															<div class="col-lg-6">
																<div class="single-input-item">
																	<label for="clientName" class="required">用戶名稱</label> <input
																		type="text" id="clientName" class="form-control"
																		name="clientName" value="${user.clientName}" required />
																	<div id="name-validation" class="invalid-feedback">用戶名稱為必填</div>
																</div>
															</div>
															<div class="col-lg-6">
																<div class="single-input-item">
																	<label for="clientPhone" class="required">電話</label> <input
																		type="text" id="clientPhone" name="clientPhone"
																		class="form-control"
																		value="${user.clientMemberDetail.clientPhone}"
																		required />
																	<div id="phone-validation" class="invalid-feedback">請輸入正確的手機號碼格式</div>
																</div>
															</div>
														</div>
														<div class="single-input-item">
															<label for="clientEmail" class="required">信箱</label> <input
																type="email" id="clientEmail" name="clientEmail"
																class="form-control" value="${user.clientEmail}"
																readonly required />
															<div id="email-validation" class="invalid-feedback">請輸入正確Email格式</div>
														</div>
														<div class="single-input-item">
															<label for="clientBirthday" class="required">生日</label> <input
																type="date" id="clientBirthday" name="clientBirthday"
																class="form-control"
																value="${user.clientMemberDetail.clientBirthday}"
																required />
															<div id="birthday-validation" class="invalid-feedback">生日為必填欄位</div>
														</div>
														<div class="row">
															<div class="col-lg-6">
																<div class="single-input-item">
																	<label for="clientPoint" class="required">紅利點數</label><input
																		type="text" id="clientPoint"
																		value="${user.clientMemberDetail.clientPoint}"
																		readonly />
																</div>
															</div>
															<div class="col-lg-6">
																<div class="single-input-item">
																	<label for="clientVip" class="required">會員等級</label><input
																		type="text" id="clientVip"
																		value="${user.clientMemberDetail.clientVip}" readonly />
																</div>
															</div>
														</div>

														<div class="single-input-item">
															<!--<button type="button" id="open">編輯會員資料</button>  -->
															<button type="submit" class="check-btn sqr-btn ">確定修改</button>
															<button type="button" id="data">一鍵輸入</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- Account Details End -->
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
		document.querySelector('#clientName').addEventListener('blur',
				validateName);
		document.querySelector('#clientPhone').addEventListener('blur',
				validatePhone);
		document.querySelector('#clientBirthday').addEventListener('blur',
				validateBirthday);

		const reSpaces = /^\S*$/;

		function validateName(e) {
			const name = document.querySelector('#clientName');

			if (reSpaces.test(name.value) && name.value != '') {
				name.classList.remove('is-invalid');
				name.classList.add('is-valid');

				return true;
			} else {
				name.classList.add('is-invalid');
				name.classList.remove('is-valid');

				return false;
			}
		}

		function validatePhone(e) {
			const phone = document.querySelector('#clientPhone');
			const re = /^09[0-9]{8}$/;

			if (reSpaces.test(phone.value) && re.test(phone.value)) {
				phone.classList.remove('is-invalid');
				phone.classList.add('is-valid');

				return true;
			} else {
				phone.classList.add('is-invalid');
				phone.classList.remove('is-valid');

				return false;
			}
		}

		function validateBirthday(e) {
			const day = document.querySelector('#clientBirthday');

			if (reSpaces.test(day.value)) {
				day.classList.remove('is-invalid');
				day.classList.add('is-valid');

				return true;
			} else {
				day.classList.add('is-invalid');
				day.classList.remove('is-valid');

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
						form.addEventListener('submit',
								function(event) {
									if (!form.checkValidity()
											|| !validateName()
											|| !validatePhone()
											|| !validateBirthday()) {
										event.preventDefault()
										event.stopPropagation()
									}

									form.classList.add('was-validated')
								}, false)
					})
		})()
	</script>
	<script>
		$(document).ready(function() {

			$("#inputImageFile").change(function(e) {
				//只選取第一個檔案
				processImageFile(e.target.files[0]);
			});

			function processImageFile(imageObject) {
				var sourceImageUrl = URL.createObjectURL(imageObject);
				document.querySelector("#sourceImage").src = sourceImageUrl;
			}
			;

			//		$("#open").click(function() {
			//			$("#clientName").removeAttr("readonly");
			//			$("#clientPhone").removeAttr("readonly");
			//			$("#clientEmail").removeAttr("readonly");
			//			$("#clientBirthday").removeAttr("readonly");
			//			$("#inputImageFile").removeAttr("readonly");
			//			});
		});
	</script>
	<script>
		$(function() {

			$('#data').click(function() {
				$('#clientName').val("Tina");
				$('#clientPhone').val("091245678");
			})

		})
	</script>
</body>
</html>