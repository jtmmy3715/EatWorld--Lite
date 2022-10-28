<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="zxx">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/plugins/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/plugins/owl.carousel.min.css">
<head>
<title>EatWorld 確認訂單頁面</title>
<%@include file="/resources/includes/frontHead.jsp"%>


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
						<h2>checkout page</h2>
					</div>
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active">checkout</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="checkout-main-area pt-100 pb-100">
			<div class="container">
				<div class="checkout-wrap pt-30">
					<div class="row">
					
						<div class="col-lg-5">
							<div class="your-order-area" >
								<h3>您所訂購的商品清單</h3>
								<div class="your-order-wrap gray-bg-4">
									<div class="your-order-info-wrap">
									
										<div class="your-order-info">
											<div class="your-order-middle">
												<div>訂單編號:</div>
											</div>
											
										</div>
										<div class="your-order-middle">
											<ul>
											<li>姓名:</li>
											<li>電話:</li>
											<li>信箱:</li>
											</ul>
										</div>
										<div class="your-order-info order-subtotal">
											<ul>
												<li>商品 <span>總共</span></li>
												
											</ul>
										</div>
										<div class="your-order-middle">
											<ul>
											<c:forEach var="cartOrderDetail" items="${cartOrderDetailList}" varStatus="loop">
												<li>${cartOrderDetail.productBean.name}x${cartOrderDetail.qulity}<span class="order_price">$${cartOrderDetail.productBean.price*cartOrderDetail.qulity} </span></li>
											</c:forEach>
											</ul>
										</div>
										<div class="your-order-info order-subtotal">
											<ul>
												<li>折扣金額 <span>-0 </span></li>
											</ul>
										</div>
										<div class="your-order-info order-shipping">
											<ul>
												<li>預估訂單時間
													<p>35分</p>
												</li>
											</ul>
										</div>
										<div class="your-order-info order-total">
											<ul>
												<li>結帳金額 <span>$${orderTotal} </span></li>
											</ul>
										</div>
									</div>
	
								</div>
								<div class="Place-order mt-40" >
									<div>
										<form action = "${pageContext.request.contextPath}/FrontProductController/initData" method="GET" enctype="text" id="backProduct">
										<!--<input type = "hidden" value="initComboData" name = "action" >-->
											<a href="javascript:document:backProduct.submit();" aria-expanded="false" style="width:158px; float:left">商品頁面</a>
		                        		</form>
		                        		
		                        		<form action = "${pageContext.request.contextPath}/user/orders" method="GET" enctype="text" id="backClientOrder">
										<!--<input type = "hidden" value="initComboData" name = "action" >-->
											<a href="javascript:document:backClientOrder.submit();" aria-expanded="false" style="width:158px; float:right">會員訂單</a>
		                        		</form>
		                        		<div style="clear: both"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-5" >
							<div class="your-order-area" style="">
								<h3>其他推薦熱門商店</h3>
								<!-- 
								<div class="card" style="width: 18rem;">
								  <img src="${pageContext.request.contextPath}/photo/IMG_NoIMG.png" class="card-img-top" alt="">
								  <div class="card-body">
								    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
								  </div>
								</div>
								-->
								<div class="owl-carousel owl-theme">
								    <div class="item">

								    	<div class="card" style="width: 100px; ">
										  <img src="${pageContext.request.contextPath}/photo/IMG_NoIMG.png" class="card-img-top" alt="" style="height:150px;width:100px">
										  <div class="card-body" >
										    <p class="card-text"><a href="#" >123很多字字字字字字字字字字字</a></p>
										  </div>
										</div>		
										
								    </div>
									<div class="item">
								    	<div class="card" style="width: 100px; ">
										  <img src="${pageContext.request.contextPath}/photo/IMG_de2.jpg" class="card-img-top" alt="" style="height:150px;width:100px">
										  <div class="card-body">
										    <p class="card-text"><a href="#">123很多字字字字字字字字字字字</a></p>
										  </div>
										</div>
								    </div>
									<div class="item">
								    	<div class="card" style="width: 100px; ">
										  <img src="${pageContext.request.contextPath}/photo/img3.jpg" class="card-img-top" alt="" style="height:150px;width:100px">
										  <div class="card-body">
										    <p class="card-text"><a href="#">123很多字字字字字字字字字字字</a></p>
										  </div>
										</div>
								    </div>
									<div class="item">
								    	<div class="card" style="width: 100px; ">
										  <img src="${pageContext.request.contextPath}/photo/img3.jpg" class="card-img-top" alt="" style="height:150px;width:100px">
										  <div class="card-body">
										    <p class="card-text"><a href="#">123很多字字字字字字字字字字字</a></p>
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
			</div>
		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/frontFooter.jsp"%>
		<!--**********************************Footer end****************************************-->
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
	
	<!-- owl.carousel -->

	<script src="${pageContext.request.contextPath}/assets/js/plugins/owl.carousel.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('.owl-carousel').owlCarousel({
		    loop:true,
		    margin:100,
		    nav:true,
		    responsive:{
		        0:{
		            items:1
		        },
		        600:{
		            items:5
		        },
		        1000:{
		            items:5
		        }
		    }
		})
		
	});


	
	
	</script>
	
	
</body>
</html>