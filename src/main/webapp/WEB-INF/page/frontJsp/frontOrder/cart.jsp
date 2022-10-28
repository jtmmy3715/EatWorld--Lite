<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<title>Eliza - eCommerce Bootstrap 4 Template</title>
<%@include file="/resources/includes/frontHead.jsp"%>
<script src="https://kit.fontawesome.com/bd205bf38d.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="main-wrapper wrapper-2">
		<!--**********************************Header start**************************************-->
		<%@include file="/resources/includes/frontHeader.jsp"%>
		<!--**********************************Header end****************************************-->
		<div class="breadcrumb-area pt-95 pb-100 bg-img"
			style="background-image: url(${pageContext.request.contextPath}/assets/images/bg/breadcrumb.jpg);">
			<div class="container">
				<div class="breadcrumb-content text-center">
					<div class="breadcrumb-title">
						<h2>cart page</h2>
					</div>
					<ul>
					<!--  
						<li><a href="index.html">Home</a></li>-->
						<li class="active">cart</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="cart-main-area pt-95 pb-100">
			<div class="container">
				<h3 class="cart-page-title">您的購物車清單</h3>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-12">
						<form action="#">
							<div class="table-content table-responsive cart-table-content">
								<table>
									<thead id="cart_head">
										<tr>
											<th>圖片</th>
											<th>產品名稱</th>
											<th>單價</th>
											<th>數量</th>
											<th>合計</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="cart_show_list">
										<!-- 
										<tr>
											<td class="product-thumbnail">
											<img src="${pageContext.request.contextPath}/assets/images/cart/cart-3.jpg" alt=""></td>
											<td class="product-name"><a href="#">Demo Product Name</a></td>
											<td class="product-price-cart"><span class="amount">$260.00</span></td>
											<td class="product-quantity"><div
													class="cart-plus-minus">
													<input class="cart-plus-minus-box" type="text"
														name="qtybutton" value="2">
												</div></td>
											<td class="product-subtotal">$110.00</td>
											<td class="product-remove"><a href="#"><i
													class="la la-pencil"></i></a><a href="#"><i
													class="la la-close"></i></a></td>
										</tr>
 -->
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="cart-shiping-update-wrapper">
									
										<div class="cart-shiping-update">
											<a href="${pageContext.request.contextPath}/FrontProductController/initData" aria-expanded="false" id="continute_shop">繼續購物</a>
	   
										</div>
										<!--
										<div class="cart-clear">
											
											 <a href="#">清除購物車</a>
										</div>-->
									</div>
								</div>
							</div>
						</form>
						<div class="row">
							<div class="col-lg-4 col-md-6">
								<div class="cart-tax">
									<div class="title-wrap">
										<h4 class="cart-bottom-title section-bg-gray">商家地址</h4>
									</div>
									<div class="tax-wrapper">
										<p>以下是您點選的商家地址</p>
										<div class="tax-select-wrapper">
											<!-- 桃園市中壢區新生路5號 -->
											<div class="tax-select">
												<iframe width="250" height="250" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
												src="https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${o_storeMember.sAddress }&z=16&output=embed&t="></iframe>
											</div>
											
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6">
								<div class="discount-code-wrapper">
									<div class="title-wrap">
										<h4 class="cart-bottom-title section-bg-gray">使用優惠券</h4>
									</div>
									<div class="discount-code">
										<select class="form-select" aria-label="Event" id="id_select_cart_event">
										  	<option value="0" selected>請選擇優惠碼</option>
										  	<c:forEach var="cart_event" items="${cart_events}" varStatus="loop">
												<option value="${cart_event.event_id }" label="${cart_event.event_Name}">
												${cart_event.event_Name}&ensp;&ensp;特定商品${cart_event.discount/10}折
												</option>
											</c:forEach>
										</select>
										
										
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-12">
								<div class="grand-totall">
									<div class="title-wrap">
										<h4 class="cart-bottom-title section-bg-gary-cart">購物車金額</h4>
									</div>
									<h5>
										全部商品 <span id=cart_page_total>$0</span>
									</h5>
									<div class="total-shipping">
										<h5>折價金額</h5>
										<ul>
											<li id="id_li_event"><span>$0.00</span></li>
										</ul>
									</div>
									<h4 class="grand-totall-title">
										結帳金額 <span id="checkout_amount">$260.00</span>
									</h4>
									<a href="#cart_head" onclick="gotoCheckPage();">前往結帳</a>
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
		 
		<!-- Modal -->
		<!-- 
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-5 col-sm-12 col-xs-12">
								<div class="tab-content quickview-big-img">
									<div id="pro-1" class="tab-pane fade show active">
										<img src="${pageContext.request.contextPath}/assets/images/product/quickview-l1.jpg" alt="">
									</div>
									<div id="pro-2" class="tab-pane fade">
										<img src="${pageContext.request.contextPath}/assets/images/product/quickview-l2.jpg" alt="">
									</div>
									<div id="pro-3" class="tab-pane fade">
										<img src="${pageContext.request.contextPath}/assets/images/product/quickview-l3.jpg" alt="">
									</div>
									<div id="pro-4" class="tab-pane fade">
										<img src="${pageContext.request.contextPath}/assets/images/product/quickview-l2.jpg" alt="">
									</div>
								</div>
								<!-- Thumbnail Large Image End -->
								<!-- Thumbnail Image End -->
								<!--  
								<div class="quickview-wrap mt-15">
									<div
										class="quickview-slide-active owl-carousel nav nav-style-2"
										role="tablist">
										<a class="active" data-toggle="tab" href="#pro-1"><img
											src="${pageContext.request.contextPath}/assets/images/product/quickview-s1.jpg" alt=""></a><a
											data-toggle="tab" href="#pro-2"><img
											src="${pageContext.request.contextPath}/assets/images/product/quickview-s2.jpg" alt=""></a><a
											data-toggle="tab" href="#pro-3"><img
											src="${pageContext.request.contextPath}/assets/images/product/quickview-s3.jpg" alt=""></a><a
											data-toggle="tab" href="#pro-4"><img
											src="${pageContext.request.contextPath}/assets/images/product/quickview-s2.jpg" alt=""></a>
									</div>
								</div>
							</div>
							<div class="col-md-7 col-sm-12 col-xs-12">
								<div class="product-details-content quickview-content">
									<h2>Products Name Here</h2>
									<div class="product-details-price">
										<span>$18.00</span><span class="old">$20.00</span>
									</div>
									<div class="pro-details-rating-wrap">
										<div class="pro-details-rating">
											<i class="la la-star"></i><i class="la la-star"></i><i
												class="la la-star"></i><i class="la la-star"></i><i
												class="la la-star-half-o"></i>
										</div>
										<span>3 Reviews</span>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisic elit
										eiusm tempor incidid ut labore et dolore magna aliqua. Ut enim
										ad minim venialo quis nostrud exercitation ullamco</p>
									<div class="pro-details-list">
										<ul>
											<li>- 0.5 mm Dail</li>
											<li>- Inspired vector icons</li>
											<li>- Very modern style</li>
										</ul>
									</div>
									<div class="pro-details-size-color">
										<div class="pro-details-color-wrap">
											<span>Color</span>
											<div class="pro-details-color-content">
												<ul>
													<li class="blue"></li>
													<li class="maroon active"></li>
													<li class="gray"></li>
													<li class="green"></li>
													<li class="yellow"></li>
													<li class="white"></li>
												</ul>
											</div>
										</div>
										<div class="pro-details-size">
											<span>Size</span>
											<div class="pro-details-size-content">
												<ul>
													<li><a href="#">s</a></li>
													<li><a href="#">m</a></li>
													<li><a href="#">l</a></li>
													<li><a href="#">xl</a></li>
													<li><a href="#">xxl</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="pro-details-quality">
										<div class="cart-plus-minus">
											<input class="cart-plus-minus-box" type="text"
												name="qtybutton" value="2">
										</div>
										<div class="pro-details-cart">
											<a href="#">Add To Cart</a>
										</div>
										<div class="pro-details-wishlist">
											<a title="Add To Wishlist" href="#"><i
												class="la la-heart-o"></i></a>
										</div>
										<div class="pro-details-compare">
											<a title="Add To Compare" href="#"><i
												class="la la-refresh"></i></a>
										</div>
									</div>
									<div class="pro-details-meta">
										<span>Categories :</span>
										<ul>
											<li><a href="#">Minimal,</a></li>
											<li><a href="#">Furniture,</a></li>
											<li><a href="#">Fashion</a></li>
										</ul>
									</div>
									<div class="pro-details-meta">
										<span>Tag :</span>
										<ul>
											<li><a href="#">Fashion, </a></li>
											<li><a href="#">Furniture,</a></li>
											<li><a href="#">Electronic</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		-->
		<!-- Modal end -->
		
		
	</div>
	<!-- JS============================================ -->
	<!-- Modernizer JS -->
	<script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-2.8.3.min.js"></script>
	<!-- jQuery JS -->
	<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-3.3.1.min.js"></script>
	<!-- Popper JS -->
	<script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
	<!-- Slick Slider JS -->
	<script src="${pageContext.request.contextPath}/assets/js/plugins/countdown.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/counterup.js"></script>
	<!--<script src="${pageContext.request.contextPath}/assets/js/plugins/instafeed.js"></script>-->
	<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery-ui-touch-punch.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/magnific-popup.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/owl-carousel.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/scrollup.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/waypoints.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/wow.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/slick.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/elevatezoom.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/sticky-sidebar.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/ajax-mail.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<!-- Sweetalert JS -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>