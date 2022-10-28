<%@	page import="tw.eatworld.booking.model.BookingBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<title>訂位店家列表</title>
<%@include file="/resources/includes/frontHead.jsp"%>
  
<style>
	.product-details-content .pro-details-size-color .pro-details-size .pro-details-size-content ul li a:focus
	{
	background-color: #e32222;
	color: #fff;
	}

	.product-details-content .pro-details-quality .pro-details-cart button 
	{
	color: #fff;
	font-weight: bold;
	font-size: 12px;
	text-transform: uppercase;
	background-color: #333;
	display: inline-block;
	line-height: 1;
	padding: 23px 38px 23px;
	letter-spacing: .8px;
	z-index: 99;
	}

	.product-details-content .pro-details-quality .pro-details-cart button:hover
	{
	border: none;
	}
</style>
</head>
<body>
	<div class="main-wrapper wrapper-2">
		<!--**********************************Header start**************************************-->
		<%@include file="/resources/includes/frontHeader.jsp"%>
		<!--**********************************Header end****************************************-->
		<!-- 看版開始 -->
		<div class="breadcrumb-area pt-95 pb-100 bg-img"
			style="background-image:url(<%=request.getContextPath()%>/resources/assets/images/bg/breadcrumb.jpg);">
			<div class="container">
				<div class="breadcrumb-content text-center">
					<div class="breadcrumb-title">
						<!-- 標題行 -->
						<h2>訂位店家列表</h2>
					</div>
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active">店家列表</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 看版結束 -->
		<!-- 主內容框架 開始 -->
		<div class="shop-area pt-95 pb-100">
			<!-- 主內容 開始 -->
			<div class="container">
				<div class="row flex-row-reverse">
					<div class="col-lg-9">
						<!-- top-bar select start -->
						<div class="shop-top-bar">
							<div class="select-shoing-wrap">
								<div class="shop-select">
									<select>
										<option value="">最新上架</option>
										<option value="">熱門店家</option>
										<option value="">還有訂位</option>
									</select>
								</div>
								<p>顯示 1–12 共 20 結果</p>
							</div>
							<div class="shop-tab nav">
								<a href="#shop-1" data-toggle="tab"><i
									class="la la-th-large"></i></a><a class="active" href="#shop-2"
									data-toggle="tab"><i class="la la-reorder"></i></a>
							</div>
						</div>
						<!-- top-bar select end -->

						<!-- 店家所有資料顯示 開始 -->
						<div class="shop-bottom-area mt-35">
							<!-- 店家切換顯示 內容開始-->
							<div class="tab-content jump">
								<!-- 店家網格 全部顯示開始 -->
								<div id="shop-1" class="tab-pane">
									<div class="row">
										<!-- 第一格店家開始 -->
										<!-- Loop Start -->
										<c:forEach var="store" items="${storeBeans}">
											<div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
												<div class="product-wrap product-border-1 mb-30">
													<!-- 店家圖片顯示 -->
													<div class="product-img" style="text-align: center;">
														<a href="#"> <img
															src="../../../photo/${store.store_logo}"
															alt="store" style="height:180px; width:auto;"></a> <span class="product-badge">New</span>
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="點擊訂位" href="#"> <i class="la la-plus"
																onclick="storeID(${store.store_id});"></i></a>
															<a title="Add To Cart" href="#"><i
																class="la la-shopping-cart"></i></a><a title="Wishlist"
																href="#"><i class="la la-heart-o"></i></a>
														</div>
													</div>
													<!-- 店家敘述 -->

													<div
														class="product-content product-content-padding text-center">

														<h4>
															<a href="product-details.html"><c:out
																	value="${store.store_name}" /></a>
														</h4>
														<div class="product-rating">
															<i class="la la-star"></i><i class="la la-star"></i><i
																class="la la-star"></i><i class="la la-star"></i><i
																class="la la-star"></i>
														</div>
														<div class="product-price">
															<c:out value="${store_address}" />
														</div>

													</div>

												</div>
											</div>

											<!-- 第一格商家結束 -->
											<!-- Loop End -->
										</c:forEach>
									</div>
								</div>
								<!-- 店家網格 全部顯示結束 -->
								<!-- 店家列表 全部條列顯示開始-->
								<div id="shop-2" class="tab-pane active" >
									<!-- 店家列表 第一行開始 -->
									<!-- Loop Start -->
									<c:forEach var="store" items="${storeBeans}">
										<div class="shop-list-wrap mb-30" id="search_insert">
											<!-- 第一行內容 -->
											<div class=" row" style="" >
												<!-- 店家列表 左邊店家照片 -->
												<div class="col-xl-4 col-lg-5 col-md-5 col-sm-6">
													<div class="product-wrap product-border-1" style="text-align: center;">
														<div class="product-img">
															<a href=" #"><img
																src="../../../photo/${store.store_logo}"
																alt="store" style="height:200px; width:auto;"></a> <span class="product-badge">New</span>
															<div class="product-action">
																<a data-toggle="modal" data-target="#exampleModal"
																	title="點擊訂位" href="#"
																	onclick="storeID(${store.store_id});">
																	<i class="la la-plus"></i>
																</a>
															</div>
														</div>
													</div>
												</div>
												<!-- 店家列表 右邊店家資訊 -->
												<div class="col-xl-8 col-lg-7 col-md-7 col-sm-6">
													<div class="shop-list-content">
														<h3>
															<a href="#"><c:out
																	value="${store.store_name}" /></a>
														</h3>
														<div class="product-list-rating">
															<i class="la la-star"></i><i class="la la-star"></i><i
																class="la la-star"></i><i class="la la-star"></i><i
																class="la la-star"></i>
														</div>
														<div class="product-list-price">
															<p>
																營業時間:
																<c:out
																	value="${store.store_openhours}" />
																-
																<c:out value="${store.store_endhours}" />
																<br>
																<c:out value="${store.store_address}" />
															</p>
														</div>

														<div class="shop-list-btn-wrap">
															<!--訂位按鈕-->
															<div class="shop-list-cart default-btn btn-hover">
																<div class="product-action">
																	<a data-toggle="modal" data-target="#exampleModal"
																		title="Quick View" href="#"
																		onclick="storeID(${store.store_id});">訂位</a>
																</div>
															</div>
															<!--收藏按鈕-->
															<div class="shop-list-wishlist default-btn btn-hover">
																<a href="#" onclick="add()"><i class="la la-heart-o"></i></a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 店家列表 第一行結束 -->
										<!-- Loop End -->
									</c:forEach>
								</div>
								<!-- 店家列表 全部條列顯示結束-->
							</div>
							<!-- 店家切換顯示 內容結束-->
							<!-- 換頁按鈕 -->
							<div class="pro-pagination-style text-center mt-20">
								<ul>
									<!-- 上一頁 -->
									<li><a class="prev" href="#"><i
											class="la la-angle-left"></i></a></li>
									<!-- 停留頁面 -->
									<li><a class="active" href="#">1</a></li>
									<!-- 其他頁面 -->
									<li><a href="#">2</a></li>
									<!-- 下一頁 -->
									<li><a class="next" href="#"><i
											class="la la-angle-right"></i></a></li>
								</ul>
							</div>
						</div>

					</div>
					<!-- 店家所有資料顯示 結束 -->

					<!-- sidebar start -->
					<div class="col-lg-3">
						<div class="sidebar-style mr-30">
							<!-- 搜尋工具開始 -->
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">搜尋</h4>
								<div class="pro-sidebar-search mb-50 mt-25">
									<div class="pro-sidebar-search-form" action="">
										<input type="text" placeholder="輸入搜尋店家..." id="search_store">
										<button>
											<i class="la la-search" onclick="storelist();" id="search_btn"></i>
										</button>
									</div>
								</div>
							</div>
							<!-- 搜尋工具結束 -->
							<!-- 搜尋條件開始 -->
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">搜尋條件</h4>
								<div class="sidebar-widget-list mt-30" id="store_search_check">
									<ul>
										<!--<li>
											  <div class="sidebar-widget-list-left">
												<input type="checkbox" id="store_search_check1"><a href="#">訂金 <span>4</span></a><span
													class="checkmark"></span>
											</div>
										</li>-->
										<li>
											<div class="sidebar-widget-list-left">
												<input type="checkbox" value="1" id="store_search_check_1">
												<a href="#">開放訂位</a>
												<span class="checkmark"></span>
											</div>
										</li>
										<li>
											<div class="sidebar-widget-list-left">
												<input type="checkbox" value="0" id="store_search_check_0">
												<a href="#">未有訂位</a>
												<span class="checkmark"></span>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<!-- 搜尋條件結束 -->
							<!-- 價位區間開始 -->
							<div class="sidebar-widget mt-45">
								<h4 class="pro-sidebar-title">價位</h4>
								<div class="price-filter mt-10">
									<div class="price-slider-amount">
										<input type="text" id="amount" name="price"
											placeholder="Add Your Price" />
									</div>
									<div id="slider-range"></div>
								</div>
							</div>
							<!-- 價位區間結束 -->
							<!-- 區域開始 -->
							<div class="sidebar-widget mt-40">
								<h4 class="pro-sidebar-title">區域店家</h4>
								<div class="sidebar-widget-list mt-20">
									<ul>
										<li>
											<div class="sidebar-widget-list-left">
												<select>
													<option>桃園市</option>
												</select>
											</div>
										</li>
										<li>
											<div class="sidebar-widget-list-left">
												<select>
													<option>中壢區</option>
												</select>
											</div>
										</li>
										<li>
											<div class="sidebar-widget-list-left">
												<select>
													<option>新生路</option>
												</select>
											</div>
										</li>

									</ul>
								</div>
							</div>
							<!-- 區域結束 -->
							<!-- Tag 標籤開始 -->
							<div class="sidebar-widget mt-50">
								<h4 class="pro-sidebar-title">Tag</h4>
								<div class="sidebar-widget-tag mt-25">
									<ul>
										<li><a href="#">熱門餐廳</a></li>
										<li><a href="#">平價美食</a></li>
										<li><a href="#">舒適</a></li>
										<li><a href="#">適合聚餐</a></li>
										<li><a href="#">讚</a></li>
									</ul>
								</div>
							</div>
							<!-- Tag 標籤結束 -->
						</div>
					</div>
					<!-- sidebar end -->
				</div>
			</div>
			<!-- 主內容結束 -->
		</div>
		<!-- 主內容框架 結束 -->
		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/frontFooter.jsp"%>
		<!--**********************************Footer end****************************************-->

		<!-- 新增表單 -->
		<form action="../order/send" name="form" id="form" method="post">


			<!-- Loop Start -->
		 	


				<!-- Modal start -->
				<!-- 點擊店家照片,彈出詳細資訊 開始 -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog">
					<div class="modal-dialog" role="document">
						<!-- 店家彈出資訊 開始 -->
						<div class="modal-content">
							<!-- Modal-header start -->
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">x</span>
								</button>
							</div>
							<!-- Modal-header end -->
							<!-- 店家彈出資訊內容 開始 -->
							<div class="modal-body">
								<div class="row">
									<!--店家照片 -->
									<div class="col-md-5 col-sm-12 col-xs-12">
										<div class="product-details-content quickview-content">
										<div class="tab-content quickview-big-img">
										<h2 id="store_">
												訂位店家:
											</h2>
											<div class="product-details-price">
												<span></span>
											</div>
											
											<div id="pro-1" class="tab-pane fade show active">
												<img
													src="../../../photo/${booking.storeMemberBean.store_logo}"
													alt="" id="store_logo">
											</div>
										</div>
										<div class="pro-details-size-color">
												<div class="pro-details-size">
													<span></span>
													<div class="">
														<ul>
															<li id=""></li>
														</ul>
													</div>
												</div>
										</div>
										<div class="pro-details-size-color">
												<div class="pro-details-size">
													<span></span>
													<div class="">
														<ul>
															<li id="">${user.clientName}</li>
														</ul>
													</div>
												</div>
										</div>
										
										
										</div>
										<!-- Thumbnail Large Image End -->
									</div>
									<!-- 點擊店家照片,彈出詳細資訊 開始 -->
									<div class="col-md-7 col-sm-12 col-xs-12">
										<!-- 店家詳細資訊內容 開始 -->
										<div class="product-details-content quickview-content">
											<input type="hidden" name="store_id" id="store_id"
												value="<c:out value="${store.store_id}" />">
											<input type="hidden" name="client_id" id="client_id"
												value="${user.clientId}">
											
											<h2 id="store_name">
												<c:out value="${booking.storeMemberBean.store_name}" />
											</h2>
											<div class="product-details-price">
												<span></span>
											</div>
											<div class="pro-details-rating-wrap">
												<div class="pro-details-rating">
													<i class="la la-star"></i><i class="la la-star"></i><i
														class="la la-star"></i><i class="la la-star"></i><i
														class="la la-star-half-o"></i>
												</div>
												<span id="store_address"> </span>
											</div>
											<p id="store_introduction"> </p>
											<div class="pro-details-list">
												<ul>
													<li id="store_phone">- 電話: </li>
													<li id="store_email">- 信箱: </li>
													<li id="store_open">- 營業時間: - </li>
												</ul>
											</div>

											<div class="pro-details-size-color">
												<div class="pro-details-size">
													<span>訂位狀態</span>
													<div class="">
														<ul>
															<li id="store_booking">👀</li>
														</ul>
													</div>
												</div>
												<div class="pro-details-color-wrap">
													<span></span>
													<div class="pro-details-color-content">
														<ul>
															<li class="white"></li>
															<li class="white"></li>
														</ul>
													</div>
												</div>
												<div class="pro-details-size">
													<span>訂位時段</span>
													<div class="pro-details-size-content">
													<input type="hidden" name="booking_period" id="booking_period_val">
														<ul id=booking_period>
															<li><a href="#">上午</a></li>
															<li><a href="#">中午</a></li>
															<li><a href="#">晚上</a></li>
														</ul>
													</div>
												</div>
												<div class="pro-details-color-wrap">
													<span></span>
													<div class="pro-details-color-content">
														<ul>
															<li class="white"></li>
														</ul>
													</div>
												</div>
												<div class="pro-details-size">
													<span>日期</span>
													<div class="pro-details-size-content">
														<ul>
															<li><input type="date" class=""
																style="height: 28px;" id="booking_date" name="booking_date"></li>
														</ul>

													</div>
												</div>
											</div>
											<!-- 按鈕 -->
											<div class="pro-details-quality">
												<div class="cart-plus-minus">
													<input class="cart-plus-minus-box" type="text"
														value="2" id="booking_people" name="booking_people">
												</div>
												<div class="pro-details-cart btn-hover">
													<button id="form_button_submit" type="submit"
														name="form_button_submit">送出</button>
												</div>
												<div class="pro-details-wishlist">
													<a title="收藏店家" href="#" onclick="add()"><i class="la la-heart-o"></i></a>
												</div>

											</div>

										</div>
										<!-- 店家詳細資訊內容 結束 -->
									</div>

								</div>
							</div>
							<!-- 店家彈出資訊內容 結束 -->
						</div>
						<!-- 店家彈出資訊 結束 -->
					</div>
				</div>
				<!-- 點擊店家照片,彈出詳細資訊 結束 -->
				<!-- Modal end -->


				<!-- Loop End -->
			
			<!-- 結束表單 -->
		</form>

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
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

  
	<!-- js -->

	<script>
	var booking_period_click;
	var search_store_name;
	var search_store_check;
	
	$(function(){
	<!-- 監聽按鈕 -->
		$('#booking_period li').click(function(){
			booking_period_click = $(this).text();
			$('#booking_period_val').val(booking_period_click);
			console.log(booking_period_click);
		});
		
	<!-- 監聽 checkbox -->
		$('#store_search_check').click(function(){
			
			$('input[type=checkbox]:checked').each(function(){
				search_store_check = $(this).val();
				storelist(search_store_check);
					});
			
			$('#store_search_check_1').click(function(){
				if($(this).prop('checked')){
					search_store_check = 1;
					
				}else if(!$('#store_search_check_0').prop('checked')){
					search_store_check = '空值';
				};
				storelist(search_store_check);
			});
				
				$('#store_search_check_0').click(function(){
					if($(this).prop('checked')){
						search_store_check = 0;
					}else if(!$('#store_search_check_1').prop('checked')){
						search_store_check = '空值';
					};
					storelist(search_store_check);	
				});
				
			});
			
			
			
		
	<!-- 監聽搜尋店家 -->
		$('#search_store').autocomplete({
			
			//source:programs
			source: function( request, response ) {
				if(request.term == undefined){request.term = "空值"};
		        $.ajax( {
		          url: "<%=request.getContextPath()%>/front/booking/storeName/list",
		          dataType: "json",
		          data: {
                      key: request.term//在input輸入的值(key),回傳給後端
                  },
		          contentType: 'application/json',
		          success: function( data ) {
		        	  response($.map(data, function (item) {
	                        console.log('搜索欄所選店家:' + item.store_name); //debug
	                        search_store_name = request.term;
	                        
	                        //搜尋欄顯示
	                        return {
	                            // label和value是基本參數
	                            label: item.store_name,  //列表所顯示的文字
	                            //value: item.store_id	//列表選項的值
	                        };
	                    }));
		          },
		          
		    	});
		      },
		      minLength: 0,
	})
	//懸停
	.hover(function(){
		$(this).autocomplete('search',$(this).val())
     });
	});
		
	//監聽搜尋店家按鈕
	$('#search_btn').click(function(){
		storelist(search_store_name);
	});
	
	
	function storelist(key){
		if(search_store_name == undefined){search_store_name="空值"}
		$.ajax({
			type:'get',
			url:'<%=request.getContextPath()%>/front/booking/storeName/list?key=' + key,
			dataType: 'JSON',
			contentType: 'application/json',
			success: function(data){
				
				programs = data;
				console.log('search data:' + data);//debug
				var result = "";
				$.each(data, function(i,n){	//data塞給foreach(i,json陣列object),塞清單給result,onclick則執行list();
				//console.log(n.store_name);//debug
				$('.shop-list-wrap').children().remove();
				
				result = result
					+	'<div class="shop-list-wrap mb-30" id="search_insert">'
					+	'<!-- 第一行內容 -->'
					+	'<div class=" row" style="" >'
					+	'<!-- 店家列表 左邊店家照片 -->'
					+	'<div class="col-xl-4 col-lg-5 col-md-5 col-sm-6">'
					+	'<div class="product-wrap product-border-1" style="text-align: center;">'
					+	'<div class="product-img">'
					+	'<a href=" #"><img src="../../../photo/' + n.store_logo +'" alt="store" style="height:200px; width:auto;"></a> <span class="product-badge">New</span>'
					+	'<div class="product-action">'
					+	'<a data-toggle="modal" data-target="#exampleModal" title="點擊訂位" href="#" onclick="storeID(' + n.store_id + ');">'
					+	'<i class="la la-plus"></i>'	
					+	'</a>'
					+	'</div>'
					+	'</div>'
					+	'</div>'
					+	'</div>'
					+	'<!-- 店家列表 右邊店家資訊 -->'
					+	'<div class="col-xl-8 col-lg-7 col-md-7 col-sm-6">'
					+	'<div class="shop-list-content">'
					+	'<h3><a href="#">' + n.store_name + '</a> </h3>'
					+	'<div class="product-list-rating">'
					+	'<i class="la la-star"></i><i class="la la-star"></i><i class="la la-star"></i><i class="la la-star"></i><i class="la la-star"></i>'
					+	'</div>'
					+	'<div class="product-list-price">'
					+	'<p>營業時間: ' + n.store_openhours +' - ' + n.store_endhours + '<br>' + n.store_address +'</p>'
					+	'</div>'
					+	'<div class="shop-list-btn-wrap">'
					+	'<!--訂位按鈕-->'
					+	'<div class="shop-list-cart default-btn btn-hover">'
					+	'<div class="product-action">'
					+	'<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#" onclick="storeID(' + n.store_id + ');">訂位</a>'
					+	'</div>'
					+	'</div>'
					+	'<!--收藏按鈕-->'
					+	'<div class="shop-list-wishlist default-btn btn-hover">'
					+	'<a href="#"><i class="la la-heart-o"></i></a>'
					+	'</div>'
					+	'</div>'
					+	'</div>'
					+	'</div>'
					+	'</div>'
					+	'</div>'
					$('#search_insert').append(result);
					console.log(n); //debug
				});
			}
			
		});
		//search_store_name="空值";
	}
	
	
	<!-- 點擊店家照片,彈出詳細資訊 -->
	function storeID(storeId){
		var sid = storeId;
		console.log(sid);
		getStore(sid);
	};
	//用店家id找資料
	function getStore(sid){
		$.ajax({
			type: 'get',
			url: '<%=request.getContextPath()%>/front/booking/order/booking/'+sid ,
			dataType: 'JSON',
			contentType: 'application/json',
			success: function(data){
				console.log(data);
				$('#store_logo').attr("src", '../../../photo/'+ data.store_logo);
				$('#store_id').val(data.store_id);
				$('#store_name').text(data.store_name);
				$('#store_address').text(data.store_address);
				$('#store_introduction').text(data.store_introduction);
				$('#store_phone').text('- 電話: '+data.store_phone);
				$('#store_email').text('- 信箱: '+data.store_email);
				$('#store_open').text('- 營業時間: '+data.store_openhours + ' ~ ' + data.store_endhours);
				if(data.store_booking == '0'){
				$('#store_booking').text('未開放訂位');
				}else{$('#store_booking').text('開放訂位')};
			}
			
		});
	};
	
	<!-- 送出表單 -->
	
	function send(){
		//取表單值
		var store_id = $('#store_id').val();
		var client_id = $('#client_id').val();//
		var booking_people = $('#booking_people').val();
		var booking_date = $('#booking_date').val();
		var booking_period = booking_period_click;
		//傳值陣列
		var params = {
				"store_id" : store_id,
				"client_id" : client_id,
				"booking_people" : booking_people,
				"booking_date" : booking_date,
				"booking_period" : booking_period,
				
		}
		//debug
		console.log("store_id: " + store_id);
		console.log("client_id: " + client_id);
		console.log("booking_people: " + booking_people);
		console.log("booking_date: " + booking_date);
		console.log("booking_period: " + booking_period);
		
		
		$.ajax({
			type: 'post',
			url: '<%=request.getContextPath()%>/front/booking/order/send',
			dataType: 'JSON',
			contentType : 'application/json',
			data : JSON.stringify(params),//陣列轉json格式
			//data : params,
			success : function(data) {
				console.log('success: ' + data);
				//debug
				$.each(data, function(index, value) {
					console.log(value);
				});
				//跳轉頁面
				window.location.href = "../check";
			},
			error: function(e){
				console.log('error');
				console.log(e);
			}
			
		});
	}
	
	
	
	</script>
	<script>
	function add(){
		console.log("add");
		$.ajax({
			url : "${pageContext.request.contextPath}/user/addCollection",
			type : 'POST',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			data : {
				clientId : ${user.clientId},
				storeId : 3
			},
			success : function(data) {
				console.log("新增成功");
			}	
		});
}
	</script>
</body>
</html>