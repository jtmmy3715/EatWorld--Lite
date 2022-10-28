<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.eatworld.product.model.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<title>Eliza - eCommerce Bootstrap 4 Template</title>
<%@include file="/resources/includes/frontHead.jsp"%>
<style type="text/css">



</style>


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
						<h2>shop menu</h2>
					</div>
					<ul>
						<!--  <li><a href="index.html">Home</a></li>-->
						<li class="active">shop menu</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="shop-area pt-95 pb-100">
			<div class="container">
				<div class="row flex-row-reverse">
					<div class="col-lg-9">
						<div class="shop-top-bar">
							<div class="select-shoing-wrap">
								<div class="shop-select">
									<select id="id_select_sort">
										<option value="0">排序</option>
										<option value="1">價格大到小</option>
										<option value="2">價格小到大</option>
										<option id="id_sort_sale" value="3">銷量高到低</option>
										
									</select>
								</div>
								<p>顯示&ensp;1&ensp;of &ensp;20&ensp;筆資料</p>
							</div>
							<div class="shop-tab nav">
								<a class="active" href="#shop-1" data-toggle="tab"><i
									class="la la-th-large"></i></a>
									<!--  
									<a href="#shop-2" data-toggle="tab"><i
									class="la la-reorder"></i></a>-->
							</div>
						</div>
						<div class="shop-bottom-area mt-35">
							<div class="tab-content jump">
								<div id="shop-1" class="tab-pane active">
									<div class="row" id="id_front_product">
									<!-- 填入商品 -->
										
										

									</div>
								</div>
								<!-- 直向顯示 -->
								<div id="shop-2" class="tab-pane">
								<!--  
									<c:forEach var="product" items="${productList}" varStatus="loop">
									<div class="shop-list-wrap mb-30">
										<div class="row">
											<div class="col-xl-4 col-lg-5 col-md-5 col-sm-6">
												<div class="product-wrap product-border-1">
													<div class="product-img">
														<a href="#"><img
															src="${pageContext.request.contextPath}/photo/${product.photo}" alt="product"></a>
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class="la la-plus"></i></a>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-8 col-lg-7 col-md-7 col-sm-6">
												<div class="shop-list-content">
													<h3>
														<a href="#"><c:out value="${product.name}"/></a>
													</h3>
													<div class="product-list-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i>
													</div>
													<div class="product-list-price">
														<span><c:out value="${product.price}"/></span>
													</div>
													<p><c:out value="${product.content}"/></p>
													<div class="shop-list-btn-wrap">
														<div class="shop-list-cart default-btn btn-hover">
															<a  href="#">加入購物車</a>
														</div>
														<div class="shop-list-wishlist default-btn btn-hover">
															<a href="#"><i class="la la-heart-o"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									-->
								</div>
							</div>
							<div class="pro-pagination-style text-center mt-20">
								<ul>
									<li><a class="prev" href="#"><i
											class="la la-angle-left"></i></a></li>
									<li><a class="active" href="#">1</a></li>
									<li><a class="next" href="#"><i
											class="la la-angle-right"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="sidebar-style mr-30">
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">搜尋</h4>
								<div class="pro-sidebar-search mb-50 mt-25">
									<form class="pro-sidebar-search-form">
										<input type="text" placeholder="請輸入產品名稱" id="input_search">
										<button id="btn_search" type="button">
											<i class="la la-search"></i>
										</button>
									</form>
								</div>
							</div>
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">篩選</h4>
								<div class="sidebar-widget-list mt-30">
									<ul>
										<li><div class="sidebar-widget-list-left">
												<input type="radio" value="1" name="radio_filter" checked><a href="###">單點<span id="id_product_size">4</span></a><span
													class="checkmark"></span>
											</div>
										</li>
										<li><div class="sidebar-widget-list-left">
												<input type="radio" value="2" name="radio_filter"><a href="###">套餐
													<span id="id_combo_size">3</span>
												</a><span class="checkmark"></span>
											</div></li>

									</ul>
								</div>
							</div>
							<!--  
							<div class="sidebar-widget mt-45">
								<h4 class="pro-sidebar-title">價格區間</h4>
								<div class="price-filter mt-10">
									<div class="price-slider-amount">
										<input type="text" id="amount" name="price"
											placeholder="Add Your Price" />
									</div>
									<div id="slider-range"></div>
								</div>
							</div>
							-->
							<div class="sidebar-widget mt-50">
								<h4 class="pro-sidebar-title">商品分類</h4>
								<div class="sidebar-widget-list mt-20">
									<ul id="id_category_ul">
									 <!--  
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">速食
													<span>1</span>
												</a><span class="checkmark"></span>
											</div></li>
									-->
									</ul>
								</div>
							</div>
							<!-- 
							<div class="sidebar-widget mt-40">
								<h4 class="pro-sidebar-title">Size</h4>
								<div class="sidebar-widget-list mt-20">
									<ul>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">XL <span>4</span></a><span
													class="checkmark"></span>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">L <span>5</span></a><span
													class="checkmark"></span>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">SM <span>6</span></a><span
													class="checkmark"></span>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">XXL
													<span>7</span>
												</a><span class="checkmark"></span>
											</div></li>
									</ul>
								</div>
							</div>
							 
							 
							<div class="sidebar-widget mt-50">
								<h4 class="pro-sidebar-title">Tag</h4>
								<div class="sidebar-widget-tag mt-25">
									<ul>
										<li><a href="#">活動1</a></li>
										<li><a href="#">活動2</a></li>

									</ul>
								</div>
							</div>
							-->
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
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
										<img id="photo_detail" src="${pageContext.request.contextPath}/assets/images/product/noProduct.jpg" alt="" width="200" height="250">
									</div>
						
								</div>
								<!-- Thumbnail Large Image End -->
								<!-- Thumbnail Image End -->
								
							</div>
							<div class="col-md-7 col-sm-12 col-xs-12">
								<div class="product-details-content quickview-content">
									<h2 id ="name_detail">Products Name Here</h2>
									<div class="product-details-price">
										$&nbsp;<span id ="price_detail">$20.00</span>&nbsp;元
										<!--  單品特加先取消
										<span class="old">$18.00</span>
										-->
									</div>
									<div class="pro-details-rating-wrap" >
										<div id="id_inventory">
											剩餘0個
										</div>
									<!--  
										<div class="pro-details-rating">
											<i class="la la-star"></i><i class="la la-star"></i><i
												class="la la-star"></i><i class="la la-star"></i><i
												class="la la-star-half-o"></i>
										</div>
									-->
									</div>
									<div id="view_detail">3 Reviews</div>
									<p id ="content_detail">無資料</p>
									<!-- <div class="pro-details-list">
										<ul>
											<li>- 0.5 mm Dail</li>
											<li>- Inspired vector icons</li>
											<li>- Very modern style</li>
										</ul> 
									</div>-->
									<div class="pro-details-size-color">
									<!--  
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
										-->
									</div>
									<div class="pro-details-quality">
										<div class="cart-plus-minus">
											<input id="qulity" class="cart-plus-minus-box" type="text"
												name="qtybutton" value="1">
										</div>
										<div class="pro-details-cart btn-hover">
											<a data-dismiss="modal" id="add_product_cart">加入購物車</a>
										</div>
										<!--  
										<div class="pro-details-wishlist">
											<a title="Add To Wishlist"  id="add_product_wish"><i
												class="la la-heart-o"></i></a>
										</div>
										-->
									</div>
									<!--
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
									 -->
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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<script>
	var i_filter=1;
	var search='';
	var categoryList =[];
	var event = '';
	var sort = 0;
	
		$(function(){
			
			//更新前端商品
			updateFrontAllProduct();
			//更新單選及套餐的數量
			updataFilterSize();
			
			//篩選分類按鈕傾聽
			onChangeFilter();
			//搜尋按鈕傾聽
			onClickSearch();
			//ajax更新分類
			updateCategory();
			//按鈕傾聽
			onClickCategory();
			//傾聽排序更改
			onChangeSort();
		});
		
		function onChangeSort(){
			$(document).on("change","#id_select_sort",function(){
				sort = $(this).val();
				updateFrontAllProduct();
			});
		}
		
		/*
		*
		*
		*/
		function updataFilterSize(){
			$.getJSON({
				type:"POST",
				url:"/EatWorld/FrontProductController/getFilterSize",
				async:"true",
				success:function(data){
					console.log("JQUERY讀取篩選大小連線成功");
					//$('#id_category_ul').empty();
					$('#id_product_size').html(data.product);
					$('#id_combo_size').html(data.combo);
					/*
					console.log("商品大小"+data.product);
					console.log("套餐大小"+data.combo);
						*/
					

				},error:function(data){
					console.log("讀取篩選大小失敗");
				}
			});
		}
		
		
		/*//搜尋按鈕傾聽
		*存入搜尋參數
		*/
		function onClickSearch(){
			$('#btn_search').click(function(){
				let search_value = $('#input_search').val();
				search=search_value;
				console.log(search);
				updateFrontAllProduct();
			});
		}
		function onClickCategory(){
			$('#id_category_ul').on('change','input[name=check_category]',function(){
				if($(this).prop("checked")){
					categoryList.push($(this).val());
					console.log('checked'+categoryList);
					updateFrontAllProduct();
					
				}else{
					categoryList.splice(categoryList.indexOf($(this).val()),1)
					updateFrontAllProduct();
					console.log('nchecked'+categoryList);
				}
			});
		}
		
		
		function onChangeFilter(){
			/*value==1，是單點
			* value==2，是套餐
			* value==0，是全部
			*/
			$('input[type=radio][name=radio_filter]').change(function() {
				search='';
				$("#input_search").val('');
			    if (this.value == 1) {
			    	i_filter=1;
			    	$("#id_select_sort").empty();
			    	$("#id_select_sort").append("<option value='0'>排序</option>")
			    	.append("<option value='1'>價格大到小</option>")
			    	.append("<option value='2'>價格小到大</option>")
					.append("<option value='3'>銷量高到低</option>");
			    	$("input[name=check_category]").each(function(){
			    		$(this).attr("disabled",false)
			    		
			    	})
			    }
			    else if (this.value == 2) {
			    	i_filter=2;
			    	$("#id_select_sort").empty();
			    	$("#id_select_sort").append("<option value='0'>排序</option>")
			    	.append("<option value='1'>價格大到小</option>")
			    	.append("<option value='2'>價格小到大</option>")
			    	categoryList.length = 0
			    	$("input[name=check_category]").each(function(){
			    	     $(this).prop("checked",false);//把所有的checkbox的property都取消勾選
			    	     $(this).attr("disabled","disabled");
			    	})
			    }else{
			    	i_filter=1;
			    }
			    updateFrontAllProduct();
			});
		}
		//ajax更新類別
		function updateCategory(){
			$.getJSON({
				type:"POST",
				url:"/EatWorld/FrontProductController/getAllClassification",
				async:"true",
				success:function(data){
					console.log("JQUERY讀取類別連線成功");
					console.log("商品:"+data.length);
					//$('#id_category_ul').empty();
					$.each(data, function (index, value) {
						//讀取個別的大小並顯示
						$.ajax({
							type:"POST",
							url:"/EatWorld/FrontProductController/getClassificationSize",
							async:"false",
							data:"category_name="+value.name,
							success:function(resopnse,status,xhr){
								console.log("JQUERY連線成功");
								//判斷新增是否成功
								if(xhr.readyState==4&&xhr.status==200){
									let category_size=xhr.responseText;
									console.log("讀分類大小成功!");
									//更新分類
									if(category_size != '0'){
										updateCategoryHTML(value,category_size);
									}
									

								}
								
							}
						});
						
					})

				},error:function(data){
					console.log("讀取類別失敗");
				}
			});
		}
		//更新類別列表
		function updateCategoryHTML(value,category_size){
			$('#id_category_ul').append(
				$('<li/>').append(
			            $('<div/>').addClass('sidebar-widget-list-left')
			                .append(
			                    $('<input/>')
			                        .attr('type', "checkbox")
			                        .attr('name', "check_category")
			                        .attr('value',value.product_category_id)
			                )
			                .append(
			                            $('<a/>')
			                                .attr('href', '###')
			                                .html(value.name)
			                                .append(
			                                    $('<span/>')
			                                        .html(category_size)
			                                )
			                        )
			                        .append(
			                            $('<span/>').addClass("checkmark")
			                          )
	
			        )
			 )
		}
		//ajax讀取商品更新
			function updateFrontAllProduct(){
				//更新商品顯示
				if(i_filter!=2){	
					//單點商品顯示
					$.getJSON({
						type:"GET",
						url:"/EatWorld/FrontProductController/getFrontAllProduct",
						data:"sort="+sort,
						async:"true",
						success:function(data){
							console.log("JQUERY讀取商品連線成功");
							console.log("商品:"+data.length);
							$('#id_front_product').empty();
							$.each(data, function (index, value) {
								
								
								if(i_filter==1){
									//判斷是否勾選分類
									if(categoryList.length===0){
										//無勾選分類
										if(search==''){
											console.log('無查詢')
											updateFrontProductHTML(value);
										}else if((value.name).indexOf(search)!=-1){
											console.log('有查詢')
											updateFrontProductHTML(value);
										}
									}else{
										//判斷有勾選的分類
										$.each(categoryList, function (cate_index, cate_value) {
											let category_id=(value.productClassificationBean.product_category_id);
											if(category_id == cate_value){
												//有符合分類就更新
												if(search==''){
													updateFrontProductHTML(value);
												}else if((value.name).indexOf(search)!=-1){
													updateFrontProductHTML(value);
												}
											}
										
										});
									}
								}
								
								
							})
							
	
						},error:function(data){
							console.log("讀取商品失敗");
						}
					});
				}else{
					//套餐商品顯示
					$.getJSON({
						type:"POST",
						url:"/EatWorld/FrontProductController/getAllCombo",
						async:"true",
						data:"sort="+sort,
						success:function(data){
							console.log("JQUERY讀取套餐連線成功");
							console.log("套餐:"+data.length);
							$('#id_front_product').empty();
							$.each(data, function (index, value) {
								//套餐是否有搜尋
								if(search==''){
									updateFrontComboProductHTML(value);
								}else if((value.combo_name).indexOf(search)!=-1){
									updateFrontComboProductHTML(value);
								}
								
								
							})
							
	
						},error:function(data){
							console.log("讀取套餐失敗");
						}
					});
					
				}
				
				
			}
		 
		 function updateFrontProductHTML(value){
			 	
				       $('#id_front_product').append(
				    	        $('<div/>').addClass('col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12')
				                .append(
				                    $('<div/>').addClass('product-wrap product-border-1 mb-30')
				                        .append(
				                            $('<div/>').addClass('product-img')
				                                .append(
				                                    $('<img/>')
				                                        .attr('src', '/EatWorld/photo/' + value.photo)
				                                        .attr('height','200')
				                                        .attr('width','280')

				                                ).append(
				                                    $('<div/>').addClass('product-action')
				                                        .append(
				                                            $('<input/>')
				                                                .attr('type', 'hidden')
				                                                .attr('name','product_id')
				                                                .attr('value', value.product_id)
				                                        )
				                                        .append(
				                                            $('<a/>').addClass('showDetail')
				                                                .attr('data-toggle', 'modal')
				                                                .attr('data-target', '#exampleModal')
				                                                .attr('title', '加入購物車')
				                                                .attr('href', '###')
				                                                .html('<i class="la la-shopping-cart"></i>')
				                                        )
				                                )
				                        )

				                )
				                .append(

				                    $('<div/>').addClass('product-content product-content-padding text-center')
				                        .append(
				                            $('<h4/>').html(value.name)

				                        )
				                        .append(
				                            $('<div/>').addClass('product-price')
				                                .append('<span/>').html('$' + value.price)
				                        )
				                        .append(
				                            $('<div/>')
				                            	.html('已售:&ensp;'+value.count_sale+'&ensp;個')
				                        )
				                        .append(
				                            $('<div/>')
				                            	.css('color','red')
				                            	.html('剩餘&ensp;'+value.inventory+'&ensp;個')
				                        )
				                        /*.append(
				                            $('<div/>').addClass('product-rating')
				                            	.html('<i class="la la-star"></i><i class="la la-star"></i><i class="la la-star"></i>'+
				                            		'<i class="la la-star"></i><i class="la la-star"></i>')
				                        )*/
				                )
				           )
		 }
		 
		 /*
		 *
		 *套餐商品顯示頁
		 */
		 
		 function updateFrontComboProductHTML(value){
			 $('id_sort_sale').css("display","none");
		       $('#id_front_product').append(
		    	        $('<div/>').addClass('col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12')
		                .append(
		                    $('<div/>').addClass('product-wrap product-border-1 mb-30')
		                        .append(
		                            $('<div/>').addClass('product-img')
		                                .append(
		                                    $('<img/>')
		                                        .attr('src', '/EatWorld/photo/' + value.photo)
		                                        .attr('height','200')
		                                        .attr('width','280')

		                                ).append(
		                                    $('<div/>').addClass('product-action')
		                                        .append(
		                                            $('<input/>')
		                                                .attr('type', 'hidden')
		                                                .attr('name','combo_id')
		                                                .attr('value', value.combo_id)
		                                        )
		                                        .append(
		                                            $('<a/>').addClass('showDetail')
		                                                .attr('data-toggle', 'modal')
		                                                .attr('data-target', '#exampleModal')
		                                                .attr('title', '加入購物車')
		                                                .attr('href', '###')
		                                                .html('<i class="la la-shopping-cart"></i>')
		                                        )
		                                )
		                        )

		                )
		                .append(

		                    $('<div/>').addClass('product-content product-content-padding text-center')
		                        .append(
		                            $('<h4/>').html(value.combo_name)

		                        )
		                        /*.append(
		                            $('<div/>').addClass('product-rating')
		                            	.html('<i class="la la-star"></i><i class="la la-star"></i><i class="la la-star"></i>'+
		                            		'<i class="la la-star"></i><i class="la la-star"></i>')

		                        )*/
		                        .append(
		                            $('<div/>').addClass('product-price')
		                                .append('<span/>').html('$' + value.price)
		                        )
		                )
		           )
			 
			 
		 }

	
	</script>
	
	
</body>
</html>