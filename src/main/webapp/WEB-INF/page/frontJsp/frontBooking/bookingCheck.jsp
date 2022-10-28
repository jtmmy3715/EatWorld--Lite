<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<title>Eliza - eCommerce Bootstrap 4 Template</title>
<%@include file="../../../../resources/includes/frontHead.jsp"%>
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
						<h2>訂位確認</h2>
					</div>
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active">訂位確認</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 主內容 -->
		<div class="checkout-main-area pt-100 pb-100">
			<div class="container">
				<div class="customer-zone mb-20">
					<p class="cart-page-title">
						<a class="checkout-click1" href="#"> 確認您的聯絡資訊</a>
					</p>
					<div class="checkout-login-info">
						<p></p>
						<form action="order/send" method="post">
						<input type="hidden" name="store_id" id="store_id"
												value="<c:out value="${storeBean.store_id}" />">
						<input type="hidden" name="client_id" id="client_id"
												value="<c:out value="${clientBean.client_id}" />">
						
							<div class="row">
							<!-- 會員名字 -->
								<div class="col-lg-6 col-md-6">
									<div class="sin-checkout-login">
										<label>訂單人<span>*</span></label><input type="text"
											name="user-name" value="${clientBean.client_name}">
											
									</div>
								</div>
								<!-- 會員信箱 -->
								<div class="col-lg-6 col-md-6">
									<div class="sin-checkout-login">
										<label>Email<span>*</span></label><input type="text" 
											name="user-email" value="yunchieh1997@gmail.com">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="checkout-wrap pt-30">
					<div class="row">
						<!-- 左邊 -->
						<div class="col-lg-6">
							<div class="contact-info-area">
								<h2>${storeBean.store_name}</h2>
								<div class="contact-info-wrap">
								
								<!-- 店家照片 -->
								<div class="single-contact-info">
									<img src="../../../photo/${storeBean.store_logo}"
									alt="" id="store_logo" style="width:500px;">
								</div>
								
								<!-- 店家地址 -->
								<div class="single-contact-info">
								<div class="contact-info-icon">
									<i class="la la-globe"></i>
								</div>
								<div class="contact-info-content">
								<p>${storeBean.store_address}</p>
								</div>
								</div>
								<!-- 店家信箱 -->
								<div class="single-contact-info">
								<div class="contact-info-icon">
									<i class="la la-envelope"></i>
								</div>
								<div class="contact-info-content">
								<p>${storeBean.store_email}</p>
								</div>
								</div>
								<!-- 店家電話 -->
								<div class="single-contact-info">
								<div class="contact-info-icon">
									<i class="la la-phone"></i>
								</div>
								<div class="contact-info-content">
								<p>${storeBean.store_phone}</p>
								</div>
								</div>
								
									 
								</div>
							</div>
						</div>
						<!-- 左邊結束 -->

						<!-- 右邊 -->
						<div class="col-lg-6">
							<div class="your-order-area">
								<h3>訂位資訊</h3>
								<div class="your-order-wrap gray-bg-4">
									<div class="your-order-info-wrap">
										<div class="your-order-middle">
											<ul>
												<li>店家:<span id="store_name">${storeBean.store_name}</span></li>
											</ul>
										</div>


										<div class="your-order-middle">
											<ul>
												<li>訂位日期:<span id="booking_date">${bookingBean.booking_date}</span></li>
											</ul>
										</div>


										<div class="your-order-middle">
											<ul>
												<li>訂位時段:<span id="booking_period">${bookingBean.booking_period}</span></li>
											</ul>
										</div>



										<div class="your-order-middle">
											<ul>
												<li>訂位人數:<span id="booking_people">${bookingBean.booking_people}</span></li>

											</ul>
										</div>

										<div class="your-order-middle">
											<ul>
												<li>訂金 <span>0 </span></li>
											</ul>
										</div>
									</div>

								</div>
								<div class="Place-order mt-40">
									<a href="#" onclick="check_save();">確認訂位</a>
								</div>

							</div>
						</div>
						<!-- 右邊 -->

					</div>
				</div>


				<div class="checkout-wrap pt-100"></div>



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
		<script
			src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
			
		<!-- SweetAlert2 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>	
		<!-- js -->
	
		<script>
		
		
		
		function check_save(){
			
			var store_id = $('#store_id').val();
			var client_id = $('#client_id').val();//
			var booking_people = $('#booking_people').text();
			var booking_date = $('#booking_date').text();
			var booking_period = $('#booking_period').text();
			
			var params = {
					"store_id" : store_id,
					"client_id" : client_id,
					"booking_people" : booking_people,
					"booking_date" : booking_date,
					"booking_period" : booking_period,
					
			}
			
			console.log("store_id: " + store_id);
			console.log("client_id: " + client_id);
			console.log("booking_people: " + booking_people);
			console.log("booking_date: " + booking_date);
			console.log("booking_period: " + booking_period);
			
			Swal.fire({
				title: 'Are you sure?',
				text: "您將新增訂位表單",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonText: '新增!',
				cancelButtonText: '取消',
			}).then(function(check) {
				if (check.isConfirmed) {
					//送出
					console.log("送出");
					
					//送出表單
					$.ajax({
						type: 'post',
						url: '<%=request.getContextPath()%>/front/booking/order/save',
						dataType: 'JSON',
						contentType : 'application/json',
						data : JSON.stringify(params),
						success : function(data) {
							console.log('success: ' + data);
							$.each(data, function(index, value) {
								console.log(value);
							});
							//window.location.href = "../check";

							//sweetalert2	
							Swal.fire({
							title: 'Are you sure?',
							text: "您將送出訂位",
							icon: 'warning',
							showCancelButton: true,
							confirmButtonText: '新增!',
							cancelButtonText: '取消',
							})
							//.then(function(check) {
								//if (check.isConfirmed) {
									//送出
								//	console.log("送出");
								//	Swal.fire(
								//		'送出成功!',
								//		'您的訂位已交給店家審核, 請查收 email 確認訂位資訊!',
									//	'success'
								//	)
							//	window.setTimeout((() => window.location.href = "../store/list"),800);
						//	}
							
					//	})
						},
						error: function(e){
							console.log('error');
							console.log(e);
						}
					});
					
					
					
					
					
					Swal.fire(
						'送出成功!',
						'您的訂位已交給店家審核, 請查收 email 確認訂位資訊!',
						'success'
					)
					window.setTimeout((() => window.location.href = "../store/list"),800);
				} else {
					//console.log("不送");
					return false;
				}
			})
			
			
		};
	
		</script>
</body>
</html>