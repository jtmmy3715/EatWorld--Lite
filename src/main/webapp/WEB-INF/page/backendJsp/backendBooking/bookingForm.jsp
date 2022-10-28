
<%@	page import="tw.eatworld.booking.model.BookingBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% String path = request.getContextPath();%>

<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<script>window.onload = function () {document.title = '新增訂位';};</script>
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
								href="javascript:void(0)">新增表單</a></li>
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
										<h4 class="card-title">新增表單</h4>

									<!-- Form action -->
										<form class="form-valide" action="save"
											name="form" id="form" method="post" enctype="multipart/form-data">

									<!-- 新增表單 -->

									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="booking_table">訂位桌號
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select th:field="*{booking_table}" class="form-control"
												name="booking_table" id="booking_table">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
										</div>
									</div>



									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="booking_people">訂位人數
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select class="form-control" name="booking_people"
												id="booking_people" th:field="*{booking_people}">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
										</div>
									</div>


									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="bookingdate">訂位日期
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="date" class="form-control" name="booking_date"
												id="booking_date" th:field="*{booking_date}">
										</div>
									</div>


									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="booking_period">用餐時段
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select class="form-control" name="booking_period"
												id="booking_period" th:field="*{booking_period}">
												<option value="上午">上午</option>
												<option value="中午">中午</option>
												<option value="下午">下午</option>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="booking_cteateTime">用餐時間
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="time" class="form-control"
												name="booking_cteateTime" id="booking_cteateTime"
												th:field="*{booking_cteateTime}">
										</div>
									</div>

									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="booking_status">訂位狀態
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select class="form-control" name="booking_status"
												id="booking_status" th:field="*{booking_status}">
												<option value="訂位成功">訂位成功</option>
												<option value="訂位取消">訂位取消</option>
												<option value="訂位審核">訂位審核</option>
											</select>
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
										<label class="col-lg-4 col-form-label" for="store_id">商家姓名
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="store_name"
												id="store_name" placeholder="輸入商家名稱.." th:field="*{store_id}">
											<input type="hidden" class="form-control" name="store_id"
												id="store_id" placeholder="輸入商家編號.." th:field="*{store_id}">
										</div>
									</div>

									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="client_id">會員姓名
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="client_name"
												id="client_name" placeholder="輸入會員名稱.."
												th:field="*{client_id}">
											<input type="hidden" class="form-control" name="client_id"
												id="client_id" placeholder="輸入會員編號.."
												th:field="*{client_id}">
										</div>
									</div>



									<div class="form-group row">
										<div class="col-lg-8 ml-auto">
											<button id="oneClickEnter" type="button" class="btn btn-info"
												onclick="oneok()" id="oneok">一鍵輸入</button>
											<button id="form_button_submit" type="submit"
												onclick="add();" class="btn btn-primary"
												name="form_button_submit">送出</button>
											<button type="button" class="btn btn-primary"
												onclick="cancel();">返回</button>
										</div>

									</div>


									</form>
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
	<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/resources/js/bookingForm.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<!--**********************************Scripts end********************************************-->
	<script type="text/javascript">
	
	$(function(){
		var store_id = $('#store_id').val();
		var client_id = $('#client_id').val();
		
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
