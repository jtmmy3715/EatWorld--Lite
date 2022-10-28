
<%@	page import="tw.eatworld.booking.model.BookingBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% String path = request.getContextPath();%>

<!doctype html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<%@include file="/resources/includes/head.jsp"%>
<script>window.onload = function () {document.title = '修改訂位';};</script>
</head>
<body>
	<!--**********************************Main wrapper start***********************************-->
	<div id="main-wrapper">
		<!--***********************Nav-header/Header/Nk-sidebar start***************************-->
		<%@include file="/resources/includes/nav-header.jsp"%>
		<%@include file="/resources/includes/header.jsp"%>
		<%@include file="/resources/includes/nk-sidebar.jsp"%>
		<!--***********************Nav-header/Header/Nk-sidebar End*****************************-->
		
		<!--**********************************Content body start********************************-->


		<!-- 這裡寫內容 -->




		<div class="content-body" style="min-height: 884px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">預訂管理</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">修改表單</a></li>
					</ol>
				</div>
			</div>


			<!-- row -->


			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="form-validation">


									<!-- 標題行 -->
									<!-- 訂位編號 -->
									<h4 class="card-title">
									<c:if test="${bookingBean != null}">
										<label class="col-lg-4 col-form-label" for="val-username">
												#<c:out value='${bookingBean.booking_id}' />
										</label>
									</c:if></h4>
									
									<!-- form:action -->

									<form:form id="form" name="form" cssclass="form-valide"
										action="../save" method="post"
										modelAttribute="bookingBean" enctype="multipart/form-data">

									<form:hidden path="booking_id" id="booking_id"></form:hidden>
									
									
									
										<!-- 修改表單 -->
										
										

										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="booking_table">訂位桌號
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<form:select path="booking_table" item="${booking_table}"
													itemValue="key1" type="select" cssClass="form-control"
													id="booking_table" autocomplete="off">
													<form:option value="1" />
													<form:option value="2" />
													<form:option value="3" />
													<form:option value="4" />
													<form:option value="5" />
												</form:select>
											</div>
										</div>



										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="booking_people">訂位人數
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<form:select path="booking_people" item="${booking_people}"
													itemValue="key1" type="select" cssClass="form-control"
													id="booking_people" autocomplete="off">
													<form:option value="1" />
													<form:option value="2" />
													<form:option value="3" />
													<form:option value="4" />
													<form:option value="5" />
												</form:select>
											</div>
										</div>


										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="booking_date">訂位日期
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<form:input path="booking_date" type="Date"
													cssClass="form-control" id="booking_date" max="3000-12-31"
													autocomplete="off" maxlength="10" />
											</div>
										</div>


										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="booking_period">用餐時段
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<form:select path="booking_period" item="${booking_period}"
													itemValue="key1" type="select" cssClass="form-control"
													id="booking_period" autocomplete="off">
													<form:option value="上午" />
													<form:option value="中午" />
													<form:option value="下午" />
												</form:select>
											</div>
										</div>


										<div class="form-group row">
											<label class="col-lg-4 col-form-label"
												for="booking_cteateTime">用餐時間 <span
												class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<form:input path="booking_cteateTime" type="time"
													cssClass="form-control" id="booking_cteateTime"
													autocomplete="off" />
											</div>
										</div>


										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="booking_status">訂位狀態
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<form:select path="booking_status" item="${booking_status}"
													itemValue="key1" type="select" cssClass="form-control"
													id="booking_status" autocomplete="off">
													<form:option value="訂位成功" />
													<form:option value="訂位取消" />
													<form:option value="訂位審核" />
												</form:select>
											</div>
										</div>


										<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="photoUpload">照片
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="file" accept="image/*" class="form-control" name="photoUpload"
												id="photoUpload" th:field="*{booking_photo}">
										</div>
									</div>

										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="store_id">商家編號
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
											<input type="text" class="form-control" name="store_name"
												id="store_name" placeholder="輸入商家名稱.." th:field="*{store_id}">
												<form:input path="store_id" type="hidden"
													cssClass="form-control" id="store_id" name="store_id" autocomplete="off" />
											</div>
										</div>


										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="client_id">會員編號
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
											<input type="text" class="form-control" name="client_name"
												id="client_name" placeholder="輸入會員名稱.."
												th:field="*{client_id}">
												<form:input path="client_id" type="hidden"
													cssClass="form-control" id="client_id" name="client_id" autocomplete="off" />
											</div>
										</div>



										<div class="form-group row">
											<div class="col-lg-8 ml-auto">
												<button id="oneClickEnter" type="button"
													class="btn btn-info" onclick="oneok()" id="oneok">一鍵輸入</button>
												<button id="form_button_submit" type="submit"
													onclick="add();" class="btn btn-primary"
													name="form_button_submit">送出</button>
												<button type="button" class="btn btn-primary"
													onclick="cancel();">返回</button>
											</div>

										</div>


									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #/ container -->



		</div>
		<!--**********************************Content body end***********************************-->

		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/footer.jsp"%>
		<!--**********************************Footer end****************************************-->
	</div>
	<!--**********************************Main wrapper end**************************************-->
	<!--**********************************Scripts***********************************************-->
	<%@include file="/resources/includes/javascript.jsp"%>
	<script type="text/javascript" language="javascript"
		src="<%=request.getContextPath()%>/resources/js/bookingEditForm.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<!--**********************************Scripts end********************************************-->
<script type="text/javascript">
	$(function(){
		
		var store_id = $('#store_id').val();
		var client_id = $('#client_id').val();
		
		$.ajax({
			url: '../../booking/order/booking/'+store_id,
			dataType: 'json',
			contentType: 'application/json',
			success: function(data){
				console.log(data.store_name);
				$("#store_name").val(data.store_name);
			},
			error: function(e){
				console.log(e);
				console.log('error');
			}
				
		});
		
		$.ajax({
			url: '../../booking/order/clientName/'+client_id,
			dataType: 'json',
			contentType: 'application/json',
			success: function(data){
				console.log(data.client_name);
				$("#client_name").val(data.client_name);
			},
			error: function(e){
				console.log(e);
				console.log('error');
			}
				
		});
		
		
		
$('#store_name').autocomplete({
			source: function( request, response ) {
				if( request.term == undefined ) {request.term = "空值"};
		        $.ajax({
		        	
		          url: "<%=request.getContextPath()%>/booking/storeName/list",
		          dataType: "json",
		          data: {
                      key: request.term//在input輸入的值(key),回傳給後端
                  },
		          contentType: 'application/json',
		          success: function( data ) {
		        	  response($.map(data, function (item) {
	                        console.log('搜索欄所選店家:' + item.store_name); //debug
	                        store_id = item.store_id;
	                        //搜尋欄顯示
	                        return {
	                            // label和value是基本參數
	                            label: item.store_name,  //列表所顯示的文字
	                            store_id: item.store_id	//列表選項的值
	                        };
	                    }));
		          },
		    	});
		      },
		      minLength: 1,
		      select: function (event, ui) {
		            $("#store_id").val(store_id);
		        }
	})
$('#client_name').autocomplete({
			source: function( request, response ) {
				if( request.term == undefined ) {request.term = "空值"};
		        $.ajax({
		        	
		          url: "<%=request.getContextPath()%>/booking/clientName/list",
		          dataType: "json",
		          data: {
                      key: request.term//在input輸入的值(key),回傳給後端
                  },
		          contentType: 'application/json',
		          success: function( data ) {
		        	  response($.map(data, function (item) {
	                        console.log('搜索欄所選店家:' + item.client_name); //debug
	                        client_id = item.client_id;
	                        //搜尋欄顯示
	                        return {
	                            // label和value是基本參數
	                            label: item.client_name,  //列表所顯示的文字
	                            client_id: item.client_id	//列表選項的值
	                        };
	                    }));
		          },
		    	});
		      },
		      minLength: 1,
		      select: function (event, ui) {
		            $("#client_id").val(client_id);
		        }
	})
	
	});
</script>
</body>
</html>
