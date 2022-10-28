<!--<%@page import="tw.eatworld.store.controller.StoreController"%>-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!doctype html>
        <html class="no-js" lang="zxx">

        <head>
            <title>商家列表</title>
            <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <%@include file="/resources/includes/frontHead.jsp" %>
            <script type="text/javascript">
            
            
            
            
            
            </script>
        </head>

        <body>
            <div class="main-wrapper wrapper-2">
                <!--**********************************Header start**************************************-->
                <%@include file="/resources/includes/frontHeader.jsp" %>
                    <!--**********************************Header end****************************************-->
                    <div class="breadcrumb-area pt-95 pb-100 bg-img"
                        style="background-image: url(<%=request.getContextPath()%>/assets/images/bg/breadcrumb.jpg);">
                        <div class="container">
                            <div class="breadcrumb-content text-center">
                                <div class="breadcrumb-title">
                                    <h2>商家列表</h2>
                                </div>
                                <ul>
                                    <li><a href="index.html">Home</a></li>
                                    <li class="active">所有商店</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="shop-area pt-95 pb-100 section-padding-2">
                        <div class="container-fluid">
                            <div class="row flex-row-reverse">
                                <div class="col-lg-9">
                                    <div class="shop-top-bar">
                                        <div class="select-shoing-wrap">
                                            <div class="shop-select">
                                                <select>
                                                    <option value="">Sort by newness</option>
                                                    <option value="">A to Z</option>
                                                    <option value="">Z to A</option>
                                                    <option value="">In stock</option>
                                                </select>
                                            </div>
                                            <p>顯示結果</p>
                                        </div>
                                        <div class="shop-tab nav">
                                            <a class="active" href="#shop-1" data-toggle="tab"><i
                                                    class="la la-th-large"></i></a><a href="#shop-2"
                                                data-toggle="tab"><i class="la la-reorder"></i></a>
                                        </div>
                                    </div>
                                    <div class="shop-bottom-area mt-35">
                                        <div class="tab-content jump">
                                            <!--一號頁頭-->
                                            <div id="shop-1" class="tab-pane active">
                                                <div id="start1" class="row">
																							
                                                   
												

                                                </div>
                                            </div>
                                            <!--一號頁尾-->


                                            <!--二號頁頭-->
                                            <div id="shop-2" class="tab-pane">
                                                <div class="shop-list-wrap mb-30">
                                                

                                                



                                                
                                                </div>
                                            </div>
                                            <!--二號頁尾-->
                                        </div>
                                        <!-- 分頁用 -->
                                        <div class="pro-pagination-style text-center mt-20">
                                            <ul>
                                                <li><a class="prev" href="#"><i class="la la-angle-left"></i></a></li>
                                                <li><a class="active" href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a class="next" href="#"><i class="la la-angle-right"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- 側邊條 -->
                                <div class="col-lg-3">
                                    <div class="sidebar-style mr-30">
                                        <div class="sidebar-widget">
                                            <h4 class="pro-sidebar-title">Search</h4>
                                            <div class="pro-sidebar-search mb-50 mt-25">
                                                <form class="pro-sidebar-search-form" action="#">
                                                    <input type="text" placeholder="Search here...">
                                                    <button>
                                                        <i class="la la-search"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                        
                                        <!--  <div class="sidebar-widget">
                                            <h4 class="pro-sidebar-title">營業時間篩選</h4>
                                            <div class="pro-sidebar-search mb-50 mt-25">
                                                <form class="pro-sidebar-search-form" action="#">
                                                	
                                                    <p>營業時間<input type="time" ></p>
                                                    <p>打烊時間<input type="time" ></p>
                                                    
                                                    <button>
                                                        <i class="la la-search"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>-->
                                        
                                        <div class="sidebar-widget">
                                            <h4 class="pro-sidebar-title">Refine By</h4>
                                            <div id="checkSort" class="sidebar-widget-list mt-30">
                                                <ul>
                                                    <li>
                                                        <div  class="sidebar-widget-list-left">
                                                            <input type="checkbox" value="4" id="sort1"><a href="">速食<span id="sortcount1">1</span>
                                                            </a><span class="checkmark"></span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="sidebar-widget-list-left">
                                                            <input type="checkbox" value="5"><a href="">下午茶<span id="sortcount2">0</span>
                                                            </a><span class="checkmark"></span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="sidebar-widget-list-left">
                                                            <input type="checkbox" value="6"><a href="">飲料<span id="sortcount3">3</span>
                                                            </a><span class="checkmark"></span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="sidebar-widget-list-left">
                                                            <input type="checkbox" value="7"><a href="">美式<span id="sortcount4">1</span>
                                                            </a><span class="checkmark"></span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="sidebar-widget-list-left">
                                                            <input type="checkbox" value="8"><a href="">中式<span id="sortcount5">1</span>
                                                            </a><span class="checkmark"></span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="sidebar-widget-list-left">
                                                            <input type="checkbox" value="9"><a href="">泰式<span id="sortcount6">1</span>
                                                            </a><span class="checkmark"></span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="sidebar-widget-list-left">
                                                            <input type="checkbox" value="10"><a href="">義式<span id="sortcount7">1</span>
                                                            </a><span class="checkmark"></span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="sidebar-widget-list-left">
                                                            <input type="checkbox" value="11"><a href="">日式<span id="sortcount8">4</span>
                                                            </a><span class="checkmark"></span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="sidebar-widget-list-left">
                                                            <input type="checkbox" value="12"><a href="">早午餐<span id="sortcount9">2</span>
                                                            </a><span class="checkmark"></span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="sidebar-widget-list-left">
                                                            <input type="checkbox" value="14"><a href="">小吃<span id="sortcount10">1</span>
                                                            </a><span class="checkmark"></span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!--  <div class="sidebar-widget mt-45">
                                            <h4 class="pro-sidebar-title">拉條</h4>
                                            <div class="price-filter mt-10">
                                                <div class="price-slider-amount">
                                                    <input type="text" id="amount" name="price"
                                                        placeholder="Add Your Price" />
                                                </div>
                                                <div id="slider-range"></div>
                                            </div>
                                        </div> -->
                                        
                                        
                                        <!--  <div class="sidebar-widget mt-50">
                                            <h4 class="pro-sidebar-title">標籤式</h4>
                                            <div class="sidebar-widget-tag mt-25">
                                                <ul>
                                                    <li><a href="<%=request.getContextPath()%>/store/four2?cId=11">日式</a></li>
                                                    <li><a href="<%=request.getContextPath()%>/store/four2?cId=12">早午餐</a></li>
                                                    <li><a href="<%=request.getContextPath()%>/store/four2?cId=14">小吃</a></li>
                                                    <li><a href="<%=request.getContextPath()%>/store/four2?cId=10">義式</a></li>
                                                </ul>
                                            </div>
                                        </div> -->
                                    </div>
                                </div>
                                <!-- 側邊條 -->
                            </div>
                        </div>
                    </div>
                    <!--**********************************Footer start**************************************-->
                    <%@include file="/resources/includes/frontFooter.jsp" %>
                        <!--**********************************Footer end****************************************-->
                        <!-- Modal -->
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
												位置:
												
											</h2>
											
											<div class="product-details-price">
												<span></span>
											</div>
											
											<span id="store_map">
											
        									</span>
											
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
										
										
										
										</div>
										<!-- Thumbnail Large Image End -->
									</div>
									<!-- 點擊店家照片,彈出詳細資訊 開始 -->
									<div class="col-md-7 col-sm-12 col-xs-12">
										<!-- 店家詳細資訊內容 開始 -->
										<div class="product-details-content quickview-content">
											<input type="hidden" name="store_id" id="store_id"
												>												
											<input type="hidden" name="client_id" id="client_id"
												value="${user.clientId}">
											
											<h2 id="store_name">
												
											</h2>
											<div class="product-details-price">
												<span></span>
											</div>
											<div class="pro-details-rating-wrap">
												
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

											
											<!-- 按鈕 -->
									<div class="pro-details-quality">
										<div class="pro-details-cart btn-hover" id="getMenu">
											<!--  <a href="#"><i class=" la la-cutlery"></i>查看菜單</a>-->
										</div>
										<div class="pro-details-cart btn-hover">
											<a id="collect"><i id="icon" class=" la la-heart-o"></i>收藏餐廳</a>
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
                        <!-- Modal end -->
            </div>
            <!-- JS============================================ -->
            <!-- Modernizer JS -->
            <script src="<%=request.getContextPath()%>/assets/js/vendor/modernizr-2.8.3.min.js"></script>
            <!-- jQuery JS -->
            <script src="<%=request.getContextPath()%>/assets/js/vendor/jquery-3.3.1.min.js"></script>
            <!-- Popper JS -->
            <script src="<%=request.getContextPath()%>/assets/js/popper.min.js"></script>
            <!-- Bootstrap JS -->
            <script src="<%=request.getContextPath()%>/assets/js/vendor/bootstrap.min.js"></script>
            <!-- Slick Slider JS -->
            <script src="<%=request.getContextPath()%>/assets/js/plugins/countdown.js"></script>
            <script src="<%=request.getContextPath()%>/assets/js/plugins/counterup.js"></script>
            <!--<script src="assets/js/plugins/instafeed.js"></script>-->
            <script src="<%=request.getContextPath()%>/assets/js/plugins/jquery-ui.js"></script>
            <script src="<%=request.getContextPath()%>/assets/js/plugins/jquery-ui-touch-punch.js"></script>
            <script src="<%=request.getContextPath()%>/assets/js/plugins/magnific-popup.js"></script>
            <script src="<%=request.getContextPath()%>/assets/js/plugins/owl-carousel.js"></script>
            <script src="<%=request.getContextPath()%>/assets/js/plugins/scrollup.js"></script>
            <script src="<%=request.getContextPath()%>/assets/js/plugins/waypoints.js"></script>
            <script src="<%=request.getContextPath()%>/assets/js/plugins/wow.js"></script>
            <script src="<%=request.getContextPath()%>/assets/js/plugins/slick.js"></script>
            <script src="<%=request.getContextPath()%>/assets/js/plugins/elevatezoom.js"></script>
            <script src="<%=request.getContextPath()%>/assets/js/plugins/sticky-sidebar.js"></script>
            <script src="<%=request.getContextPath()%>/assets/js/plugins/ajax-mail.js"></script>
            <!-- Main JS -->
            <script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
            
            <script type="text/javascript">
$(function () {
	$('#sort1').prop("checked", true);
	$.ajax({
        type: 'get',
        url: 'sort?cId=4',
        dataType: 'JSON',
        contentType: 'application/json',
        success: function (data) {
            console.log(data);
            if (data == null) {
                $('table').prepend('<tr><td colspan="2">No data</td></tr>');
            } else {
                var table = $("#start1");
                $.each(data, function (index, value) {
                    var tr = "<div class='col-xl-3 col-lg-4 col-md-4 col-sm-6 col-12'>"
                        + "<div class='product-wrap product-border-1 mb-30'>"
                        + "<div class='product-img'>"
                        + "<a data-toggle='modal' data-target='#exampleModal' title='Quick View' href='#' onclick='get("+value.id+")'>"
                        + "<img src='<%=request.getContextPath()%>/photo/"
                        + value.sLogo
                        + "' height=300 />"
                        + "</a>"
                        + "</div>"
                        + "<div class='product-content product-content-padding text-center'>"
                        + "<h4>"
                        + "<a href='連結到的菜單'>"
                        + value.sName
                        + "</a>"
                        + "</h4>"
                        + "<div class='product-rating'>"
                        + "</div>"
                        + "<div>"
                        + "<span>" + value.openTime + " To "
                        + value.endTime
                        + "</span></br>"
                        + value.storeclassification.name
                        + "</div>"
                        + "</div>"
                        + "</div>"
                        + "</div>"
                    table.append(tr);
                });
            }
        }
    });			
	
	
                $("#checkSort").click(function () {
                    $("#start1").empty();

                    var arr = new Array();
                    
                    //console.log(["arr1 :"] + arr);
                    $("input[type=checkbox]:checked").each(function () {
                        arr.push($(this).val());
                    });
                    //console.log("[arr2 :]" + arr);
                    //console.log("你要的值" + $(this).find("input[type=checkbox]:checked").val());
                    if ($(this).find("input[type=checkbox]:checked").val() == undefined) {
                        //console.log("是否執行");
                        showAll();
                    }

                    for (i = 0; i < arr.length; i++) {
                        $.ajax({
                            type: "get",
                            url: "sort?cId=" + arr[i],
                            dataType: 'JSON',
                            contentType: 'application/json',
                            success: function (data) {
                                console.log(arr);
                                console.log(arr[i]);
                                //console.log(["arr3 :"] + arr);
                                //console.log(data);
                                if (data == null) {
                                    $('table').prepend('<tr><td colspan="2">No data</td></tr>');
                                } else {
                                    var table = $("#start1");
                                    $.each(data, function (index, value) {
                                        var tr = "<div class='col-xl-3 col-lg-4 col-md-4 col-sm-6 col-12'>"
                                            + "<div class='product-wrap product-border-1 mb-30'>"
                                            + "<div class='product-img'>"
                                            + "<a data-toggle='modal' data-target='#exampleModal' title='Quick View' href='#' onclick='get("+value.id+")'>"
                                            + "<img src='<%=request.getContextPath()%>/photo/"
                                            + value.sLogo
                                            + "' height=300 />"
                                            + "</a>"
                                            + "</div>"
                                            + "<div class='product-content product-content-padding text-center'>"
                                            + "<h4>"
                                            + "<a href='連結到的菜單'>"
                                            + value.sName
                                            + "</a>"
                                            + "</h4>"
                                            + "<div class='product-rating'>"
                                            + "</div>"
                                            + "<div>"
                                            + "<span>" + value.openTime + " To "
                                            + value.endTime
                                            + "</span></br>"
                                            + value.storeclassification.name
                                            + "</div>"
                                            + "</div>"
                                            + "</div>"
                                            + "</div>"
                                        table.append(tr);
                                    });
                                }
                            }
                        });
                    }

                });

                function showAll() {
                    $.ajax({
                        type: 'get',
                        url: '<%=request.getContextPath()%>/store/json',
                        dataType: 'JSON',
                        contentType: 'application/json',
                        success: function (data) {
                            //console.log(data);
                            if (data == null) {
                                $('table').prepend('<tr><td colspan="2">No data</td></tr>');
                            } else {
                                var table = $("#start1");
                                $.each(data, function (index, value) {
                                    var tr = "<div class='col-xl-3 col-lg-4 col-md-4 col-sm-6 col-12'>"
                                        + "<div class='product-wrap product-border-1 mb-30'>"
                                        + "<div class='product-img'>"
                                        + "<a data-toggle='modal' data-target='#exampleModal' title='Quick View' href='#' onclick='get("+value.id+")'>"
                                        + "<img src='<%=request.getContextPath()%>/photo/"
                                        + value.sLogo
                                        + "' height=300 />"
                                        + "</a>"
                                        + "</div>"
                                        + "<div class='product-content product-content-padding text-center'>"
                                        + "<h4>"
                                        + "<a href='連結到的菜單'>"
                                        + value.sName
                                        + "</a>"
                                        + "</h4>"
                                        + "<div class='product-rating'>"
                                        + "</div>"
                                        + "<div>"
                                        + "<span>" + value.openTime + " To "
                                        + value.endTime
                                        + "</span></br>"
                                        + value.storeclassification.name
                                        + "</div>"
                                        + "</div>"
                                        + "</div>"
                                        + "</div>"
                                    table.append(tr);
                                });
                            }
                        }
                    });
                }
            })
            
            
            

           
            </script>
            <script type="text/javascript">
            
            
            function get(storeId){
        		var sid = storeId;
        		console.log(sid);
        		getStore(sid);
        		getCollection(sid);
        	};
        	//用店家id找資料
        	var storeId = "";
        	function getStore(sid){
        		storeId = sid;
        		$.ajax({
        			type: 'get',
        			url: '<%=request.getContextPath()%>/store/'+sid,
        			dataType: 'JSON',
        			contentType: 'application/json',
        			success: function(data){
        				console.log(data);
        				
        				$('#store_id').val(data.id);
        				$('#store_name').text(data.sName);
        				$('#store_address').text(data.sAddress);
        				$('#store_introduction').text(data.sIntroduction);
        				$('#store_phone').text('- 電話: '+data.sPhone);
        				$('#store_email').text('- 信箱: '+data.sEmail);
        				$('#store_open').text('- 營業時間: '+data.openTime + ' - ' + data.endTime);
        				$('#store_map').html("<iframe height='300' src=https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q="+data.sAddress+"101&z=16&output=embed&t></iframe>")
        				$('#getMenu').html("<a href='<%=request.getContextPath()%>/store/getMenu/"+ data.id +"'>菜單</a>");
        			}
        			
        		});
        	};
        	
        	</script>
            <script type="text/javascript">
        	
        	function add(storeId){
        		$.ajax({
        			url : "${pageContext.request.contextPath}/user/addCollection",
        			type : 'POST',
        			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
        			data : {
        				clientId : ${user.clientId},
        				storeId : storeId 
        			},
        			success : function(data) {
        				console.log("新增成功");
        			}	
        		});
        };
            
        function deleteCollection(storeId){   
            $.ajax({
    			url : "${pageContext.request.contextPath}/user/deleteCollection",
    			type : 'POST',
    			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
    			data : {
    				clientId : ${user.clientId},
    				storeId : storeId
    			},
    			success : function(data) {
    				console.log("刪除成功");
    			}	
    		});
         };
         
         var status ="";
         function getCollection(storeId){   
             $.ajax({
     			url : "${pageContext.request.contextPath}/user/getCollection",
     			type : 'GET',
     			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
     			data : {
     				clientId : ${user.clientId},
     				storeId : storeId
     			},
     			success : function(data) {
     				if(data=='true'){
    	            	$('#collect').html('<i id="icon" class=" la la-heart"></i>已收藏');
    	            	status="1";
    	            	cId="login";
    				}else{
    	            	$('#collect').html('<i id="icon" class=" la la-heart-o"></i>收藏餐廳');
    	            	status="2";
    	            	cId="login";
    				}
    			}	
     		});
          };
          
		$("#collect").click(function() {
        	  console.log("狀態:"+status);
        	  if(status=="1"){
        		  console.log("delete");
        		  status="2";
        		  $('#collect').html('<i id="icon" class=" la la-heart-o"></i>收藏餐廳');
        		  deleteCollection(storeId);
        	  }else{
        		  console.log("add");
        		  status="1";
        		  $('#collect').html('<i id="icon" class=" la la-heart"></i>已收藏');
        		  add(storeId);
        	  }
          });
          
          </script>
        </body>

        </html>