<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<title>我的訂單</title>
<%@include file="/resources/includes/frontHead.jsp"%>
<style>
#bgImg {
	border-radius: 50%;
	width: 150px;
	height: 150px;
	overflow: hidden;
	height: 150px;
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
											href="${pageContext.request.contextPath}/user/orders"><i
											class="fa fa-cart-arrow-down"></i>我的訂單</a> <a
											href="${pageContext.request.contextPath}/front/booking/client/${user.clientId}"><i
											class="fa fa-clipboard"></i>我的訂位</a>
											<a href="${pageContext.request.contextPath}/user/wishList"><i
											class="fa fa-heart"></i>收藏商家</a> <a
											href="${pageContext.request.contextPath}/logout"><i
											class="fa fa-sign-out"></i>會員登出</a>
									</div>
								</div>
								<!-- My Account Tab Menu End -->
								<!-- My Account Tab Content Start -->
								<div class="col-lg-9 col-md-8">
									<div class="tab-content" id="myaccountContent">
										<!-- Orders Start -->
										<div id="orders" role="tabpanel">
											<div class="myaccount-content">
												<h3>我的訂位</h3>
												<div class="myaccount-table table-responsive text-center">
													<table class="table table-bordered">
														<thead class="thead-light">
															<tr>
																<th>訂單編號</th>
																<th>店家</th>
																<th>日期</th>
																<th>人數</th>
																<th>訂單狀態</th>
															</tr>
														</thead>
														<tbody>
														<c:forEach var="booking" items="${bookingBeans}">
															<tr>
																<td><c:out value="#${booking.booking_id}" /></td>
																<td><c:out value="${booking.storeMemberBean.store_name}" /></td>
																<td><c:out value="${booking.booking_date}" /></td>
																<td><c:out value="${booking.booking_people}" /></td>
																<td>
																	<c:if test="${booking.booking_status=='訂位審核'}">
																		<span class="badge badge-warning px-4">審核</span>
																	</c:if> 
																	<c:if test="${booking.booking_status=='訂位取消'}">
																		<span class="badge badge-secondary px-4">取消</span>
																	</c:if> 
																	<c:if test="${booking.booking_status=='訂位成功'}">
																		<span class="badge badge-success px-4">成功</span>
																</c:if>
																</td>
															</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<!-- Orders End -->
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
</body>
</html>