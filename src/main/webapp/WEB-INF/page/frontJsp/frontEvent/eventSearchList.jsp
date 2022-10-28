<%@page import="tw.eatworld.event.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="tw.eatworld.event.model.Event" %>  
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<title>優惠活動查詢列表</title>
<%@include file="/resources/includes/frontHead.jsp"%>
</head>
<body>
<div class="main-wrapper wrapper-2">
	<!--**********************************Header start**************************************-->
	<%@include file="/resources/includes/frontHeader.jsp"%>
	<!--**********************************Header end****************************************-->
	<!-- 看版開始 -->
		<div class="breadcrumb-area pt-95 pb-100 bg-img"
			style="background-image: url(<%=request.getContextPath()%>/resources/assets/images/bg/breadcrumb.jpg);">
			<div class="container">
				<div class="breadcrumb-content text-center">
					<div class="breadcrumb-title">
						<h2>優惠活動</h2>
					</div>
					<ul>
						<li><a href="../">Home</a></li>
						<li class="active">優惠活動列表</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 看版結束 -->
		<!-- 主內容框架 開始 -->
		<div class="blog-area pt-100 pb-100">
			<!-- 主內容 開始 -->
			<div class="container">
			<!-- body -->
				<div class="row flex-row-reverse">
					<div class="col-lg-9">
	 					<!-- 店家所有資料顯示 開始 -->
						<div class="shop-bottom-area mt-35">
						<!--今日優惠活動開始-->
						<h3 style=color:indianred;font-weight:bolder>&emsp;今日優惠活動:</h3><br>
								<div id="" class="tab-pane active">
									<!-- 優惠活動第一行開始 -->
									<!-- Loop Start -->
									<c:forEach var="event" items="${todayEvents}">
									<% Boolean content = false; %>
									<c:forEach var="item" items="${event.allProducts}">
									<c:if test="${item.name.contains(searchName.trim())}">
									<%content = true; %>
									</c:if>
									</c:forEach>
									<%if (content == true) { %>
										<div class="shop-list-wrap mb-30">
											<!-- 優惠活動訊息 -->
											<div class=" row" style="">
												<!-- 優惠活動照片 -->
												<div class="col-xl-4 col-lg-5 col-md-5 col-sm-6">
													<div class="product-wrap product-border-1" style="text-align: left;">
														<div class="blog-img mb-15">
															<img src="<%=request.getContextPath()%>/photo/${event.event_Img}" width="200px" height="150px" >
														</div>
													</div>
												</div>
												<!-- 右邊資訊 -->
												<div class="col-xl-8 col-lg-7 col-md-7 col-sm-12">
													<div class="shop-list-content">
														<h3 style=color:red>
															<c:out value="${event.event_Name}" />
														</h3>

														<div class="product-list-price">
															<p>
																優惠到期日:<c:out value="${event.end_Date}" />
																<br>
																<c:out value="${event.description}" />
																<br>
																折扣：<c:out value="${event.discount}" />%
																<br>
																結帳時請輸入折扣碼：<c:out value="${event.code}" />
															</p>
														</div>
													</div>
												</div>
											</div>
											<!-- 參與該優惠活動之產品 -->
											<div class=" row" style="">
											<table class="table table-bordered verticle-middle" id="table_id">

											<thead>
												<tr>
													<th scope="col">產品圖片</th>
													<th scope="col">產品編號</th>
													<th scope="col">優惠商品</th>
													<th scope="col">產品內容</th>
													<th scope="col">產品價格</th>
													<th scope="col">折扣後價格</th>
													<th scope="col">供應廠商</th>							 
												</tr>
											</thead>
											<tbody>
											<c:forEach var="item" items="${event.allProducts}">
											<c:if test="${item.name.contains(searchName.trim())}">
											<tr>											
												<td><img src="<%=request.getContextPath()%>/photo/${item.photo}" width="50px" height="35px" >												  	
												<td><c:out value="${item.product_id}"/>
												<td><c:out value="${item.name}"/> 
												<td><c:out value="${item.content}"/>
												<td><c:out value="${item.price}"/>
												<td><c:out value="${item.price*event.discount/100}"/>
												<td><c:out value="${item.store}"/>
											</tr>
											</c:if>
											</c:forEach>										
											</tbody>
											</table>
											<br><br>
											</div>
											
										</div>
										<% } %>
										<!-- Loop End -->
   									</c:forEach>  
								</div>
								<!--今日優惠活動結束-->
								<!--近期優惠活動開始-->
								<h3 style=color:indianred;font-weight:bolder>&emsp;近期優惠活動:</h3><br>
								<div id="" class="tab-pane active">
									<!-- 優惠活動第一行開始 -->
									<!-- Loop Start -->
									<c:forEach var="event" items="${nextdayEvents}">
									<% Boolean content = false; %>
									<c:forEach var="item" items="${event.allProducts}">
									<c:if test="${item.name.contains(searchName.trim())}">
									<%content = true; %>
									</c:if>
									</c:forEach>
									<%if (content == true) { %>
										<div class="shop-list-wrap mb-30">
											<!-- 優惠活動訊息 -->
											<div class=" row" style="">
												<!-- 優惠活動照片 -->
												<div class="col-xl-4 col-lg-5 col-md-5 col-sm-6">
													<div class="product-wrap product-border-1" style="text-align: left;">
														<div class="blog-img mb-15">
															<img src="<%=request.getContextPath()%>/photo/${event.event_Img}" width="200px" height="150px" >
														</div>
													</div>
												</div>
												<!-- 右邊資訊 -->
												<div class="col-xl-8 col-lg-7 col-md-7 col-sm-12">
													<div class="shop-list-content">
														<h3 style=color:red>
															<c:out value="${event.event_Name}" />
														</h3>

														<div class="product-list-price">
															<p>
																優惠起訖日:<c:out value="${event.start_Date}" /> / <c:out value="${event.end_Date}"/>
																<br>
																<c:out value="${event.description}" />
																<br>
																折扣：<c:out value="${event.discount}" />%
																<br>
																結帳時請輸入折扣碼：<c:out value="${event.code}" />
															</p>
														</div>
													</div>
												</div>
											</div>
											<!-- 參與該優惠活動之產品 -->
											<div class=" row" style="">
											<table class="table table-bordered verticle-middle" id="table_id">

											<thead>
												<tr>
													<th scope="col">產品圖片</th>
													<th scope="col">產品編號</th>
													<th scope="col">優惠商品</th>
													<th scope="col">產品內容</th>
													<th scope="col">產品價格</th>
													<th scope="col">折扣後價格</th>
													<th scope="col">供應廠商</th>							 
												</tr>
											</thead>
											<tbody>
											<c:forEach var="item" items="${event.allProducts}">
											<c:if test="${item.name.contains(searchName.trim())}">
											<tr>											
												<td><img src="<%=request.getContextPath()%>/photo/${item.photo}" width="50px" height="35px" >												  	
												<td><c:out value="${item.product_id}"/>
												<td><c:out value="${item.name}"/> 
												<td><c:out value="${item.content}"/>
												<td><c:out value="${item.price}"/>
												<td><c:out value="${item.price*event.discount/100}"/>
												<td><c:out value="${item.store}"/>
											</tr>
											</c:if>
											</c:forEach>
											</tbody>
											</table>
											<br><br>
											</div>
											
										</div>
										<% } %>
										<!-- Loop End -->
   									</c:forEach>  
								</div>
								<!--近期優惠活動結束-->
								
						</div>
					</div>
 					<div class="col-lg-3">
					<!-- 左邊搜尋bar空間 -->
						<div class="sidebar-style">
							<div class="sidebar-widget">
								<div class="pro-sidebar-search mb-50 mt-25">
									<a title="返回優惠活動首頁" href="../Event/front" class="btn btn-primary" id="again">返回</a>
								</div>
							</div>
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">"${searchName}"查詢結果如右</h4>
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
	
</body>
</html>