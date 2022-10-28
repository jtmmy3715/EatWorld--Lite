<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="zxx">
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
					<!--  
						<li><a href="index.html">Home</a></li>-->
						<li class="active">checkout</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="checkout-main-area pt-100 pb-100">
			<div class="container">
			
				<div class="customer-zone mb-20">
					<p class="cart-page-title">
						有優惠卷沒輸入到嗎? <a class="checkout-click3" onclick="back();" href="">新增</a>
					</p>
					<!--  
					<div class="checkout-login-info3">
						<form action="#">
							<input type="text" placeholder="Coupon code"><input
								type="submit" value="Apply Coupon">
						</form>
					</div>
					-->
				</div>
				<div class="checkout-wrap pt-30">
					<div class="row">
						<div class="col-lg-7">
							<div class="billing-info-wrap mr-50">
								<h3>訂單資訊</h3>
								<div class="row">
									<div class="col-lg-6 col-md-6">
										<div class="billing-info mb-20">
											<label>訂購者名稱 <abbr class="required"
												title="required">*</abbr></label><input type="text" id="tx_order_name" readonly value="${user.clientName}">
										</div>
									</div>
								
									<div class="col-lg-12">
										<div class="billing-info mb-20">
												<!-- 暫時關閉訂單資訊其他填寫 
												<div class="checkout-account mt-25">
													<div>
														<input type="radio" name="in_check_order" value="same" style="width:15px;height:15px;" checked>
															與會員資料相同
													</div>
													<div>
														<input type="radio" name="in_check_order" value="one" style="width:15px;height:15px;" >
														一鍵輸入
													</div>
												</div>
												-->
												<!--  
												<div class="checkout-account mb-25">
													<input class="checkout-toggle2" type="checkbox"><span>記住此領取人</span>
												</div>
												-->
										</div>
										
									</div>

									
	
									<div class="col-lg-12 col-md-12">
										<div class="billing-info mb-20">
											<label>手機 <abbr class="required" title="required">*</abbr>
											</label>
											<input type="text" id="tx_order_phone" value="${user.clientMemberDetail.clientPhone}">
										</div>
									</div>
									<div class="col-lg-12 col-md-12">
										<div class="billing-info mb-20">
											<label>電子信箱 <abbr class="required" title="required">*</abbr>
											</label>
											<!--  <input type="text" id="tx_order_email" value="${user.clientEmail}">-->
											<input type="text" id="tx_order_email" value="jtmmy3715@gmail.com">
											
										</div>
									</div>
									
									<div class="col-lg-12">
										<div class="billing-info mb-20">
											<label>餐廳位址 :<abbr class="required"
												title="required"></abbr>
												<div id="tx_order_address">
													${o_storeMember.sAddress }
												</div>
												
												</label>
												
										</div>
									</div>
									
								</div>
							
								
								<div class="additional-info-wrap">
									<label>訂單備註</label>
									<textarea
										placeholder="請輸入您需要的訂單備註"
										name="message" id="tx_order_note"></textarea>
								</div>
							</div>
						</div>
						<div class="col-lg-5">
							<div class="your-order-area">
								<h3>您的訂單</h3>
								<div class="your-order-wrap gray-bg-4">
									<div class="your-order-info-wrap">
										<div class="your-order-info">
											<ul>
												<li>商品 <span>總共</span></li>
												
											</ul>
										</div>
										<div class="your-order-middle">
											<ul>
											<c:forEach var="cartOrderDetail" items="${cartOrderDetailList}" varStatus="loop">
												<li>${cartOrderDetail.productBean.name}x${cartOrderDetail.qulity}<span class="order_price">$${cartOrderDetail.productBean.price*cartOrderDetail.qulity} </span></li>
											</c:forEach>
											<c:forEach var="cartOrderDetailCombo" items="${cartOrderDetailComboList}" varStatus="loop">
												<li>${cartOrderDetailCombo.comboBean.combo_name}x${cartOrderDetailCombo.qulity}<span class="order_price">$${cartOrderDetailCombo.comboBean.price*cartOrderDetailCombo.qulity} </span></li>
											</c:forEach>
											</ul>
										</div>
										<div class="your-order-info order-subtotal">
											<ul>
												<li>折扣金額 <span>-${discount_total} </span></li>
											</ul>
										</div>
										<!-- 
										<div class="your-order-info order-shipping">
											<ul>
												<li>預估訂單時間
													<p>35分</p>
												</li>
											</ul>
										</div> -->
										<div class="your-order-info order-total">
											<ul>
												<li>結帳金額 <span>$${orderTotal} </span></li>
											</ul>
										</div>
									</div>
									<div class="payment-method">
										<!--  
										<div class="pay-top sin-payment">
											<input id="payment_method_1" class="input_radio" type="radio"
												value="0" checked="checked" name="payment_method"><label
												for="payment_method_1">現金付款</label>
											<div class="payment-box payment_method_bacs">
												<p>商家領取時付款</p>
											</div>
										</div>
										-->
										<div class="pay-top sin-payment">
											<input id="payment-method-2" class="input_radio" type="radio"
												value="1" name="payment_method">
												<label for="payment-method-2">信用卡支付
													<img alt="" src="${pageContext.request.contextPath}/assets/images/icon-img/card.png">
												</label>
											<div class="payment-box payment_method_bacs">
												<p>連接至綠界支付進行付款</p>
											</div>
										</div>
										<div class="pay-top sin-payment">
										<!--  
											<input id="payment-method-3" class="input-radio" type="radio"
												value="cheque" name="payment_method"><label
												for="payment-method-3">行動支付</label>
											<div class="payment-box payment_method_bacs">
												<div><input type="radio" value="Linepay" name="mobile_payment"/>&nbsp; Line pay支付
												<img alt="" src="${pageContext.request.contextPath}/assets/images/icon-img/linepay-logo-tw1.png" width="70" height="35">
											</div>

											</div>
											-->
										</div>
										<!--  
										<div class="pay-top sin-payment sin-payment-3">
											<input id="payment-method-4" class="input-radio" type="radio"
												value="cheque" name="payment_method"><label
												for="payment-method-4">PayPal 
												<img alt="" src="${pageContext.request.contextPath}/assets/images/icon-img/card.png"><a href="#">What
													is PayPal?</a></label>
											<div class="payment-box payment_method_bacs">
												<p>Make your payment directly into our bank account.
													Please use your Order ID as the payment reference.</p>
											</div>
										</div>
										-->
									</div>
								</div>
								<div class="Place-order mt-40">
								<!--    <form action = "${pageContext.request.contextPath}/OrderController/goToCheckEcPay" method="POST" enctype="text" id="gotocheckout"> --> 
								<!--<input type = "hidden" value="initComboData" name = "action" >-->
								<!--  	<a href="javascript:document:gotocheckout.submit();" aria-expanded="false">確定結帳</a>-->
									<a onclick="onclickGoToCheck();" aria-expanded="false">確定結帳</a>
								
                        		 </form>
									
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
</body>
</html>