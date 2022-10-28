
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
		<%@include file="/resources/includes/store-header.jsp"%>
		<%@include file="/resources/includes/store-navheader.jsp"%>
		<%@include file="/resources/includes/store-sidebar.jsp"%>
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
										<h4 class="card-title">
										</h4>
									<!-- Form action -->
										<form class="form-valide" action="storesave"
											name="form" id="form" method="post" enctype="multipart/form-data">

									<!-- 新增表單 -->
									<div class="form-group row">
									</div>
									<div class="form-group row">
									</div>
									
									
									
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="store_id">商家名稱
											<span class="text-danger"></span>
										</label>
										<div class="col-lg-6">
											<input type="text" disabled="disabled" class="form-control" name="store_name"
												 value="${user.sName}" style="background-color:white; border-color:white">
										</div>
									</div>
									
									
									<!--  <div class="form-group row">
										<label class="col-lg-4 col-form-label" for="booking_table" >訂位桌號
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select th:field="*{booking_table}" class="form-control"
												name="booking_table" id="booking_table" >
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
										</div>
									</div>-->



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

									 <!--<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="store_id">商家編號
											<span class="text-danger">*</span>
										</label>-->
										<div class="col-lg-6">
											<input type="hidden" class="form-control" name="store_id"
												id="store_id" placeholder="輸入商家編號.." th:field="*{store_id}" value="${user.id}">
										</div>
									<!--</div>-->

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
	<!-- <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/resources/js/bookingForm.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var store_id = document.getElementById("store_id").value;
		var client_id = document.getElementById("client_id").value;
		console.log('廠商編號: ' + store_id);
		console.log('會員編號: ' + client_id);
		
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
	});
	});
	$(".form-valide").submit(function() {
		var form = document.getElementById("form").value;
		//var booking_table = document.getElementById("booking_table").value;
		var booking_people = document.getElementById("booking_people").value;
		var booking_date = document.getElementById("booking_date").value;
		var booking_period = document.getElementById("booking_period").value;
		var booking_cteateTime = document.getElementById("booking_cteateTime").value;
		var booking_status = document.getElementById("booking_status").value;
		var booking_photo = document.getElementById("photoUpload").value;
		var store_id = document.getElementById("store_id").value;
		var client_id = document.getElementById("client_id").value;

	//sweetalert2
		/*if (booking_table == null || booking_table == '') {
			Swal.fire({
				icon: 'error',
				title: '請輸入桌號！！',
			})
			return;
		}*/
		if (booking_people == null || booking_people == '') {
			Swal.fire({
				icon: 'error',
				title: '請輸入人數！！',
			})
			return;
		}
		if (booking_date == null || booking_date == '') {
			Swal.fire({
				icon: 'error',
				title: '請輸入日期！！',
			})
			return;
		}
		if (booking_period == null || booking_period == '') {
			Swal.fire({
				icon: 'error',
				title: '請輸入時段！！',
			})
			return;
		}
		if (booking_cteateTime == null || booking_cteateTime == '') {
			Swal.fire({
				icon: 'error',
				title: '請輸入用餐時間！！',
			})
			return;
		}
		if (booking_status == null || booking_status == '') {
			Swal.fire({
				icon: 'error',
				title: '請輸入訂位狀態！！',
			})
			return;
		}
		if (booking_cteateTime == null || booking_cteateTime == '') {
			Swal.fire({
				icon: 'error',
				title: '請輸入時間！！',
			})
			return;
		}

		if (booking_photo == null || booking_photo == '') {
			Swal.fire({
				icon: 'error',
				title: '請選擇照片！！',
			})
			return false;
		}


		if (store_id == null || store_id == '') {
			Swal.fire({
				icon: 'error',
				title: '請輸入店家！！',
			})
			return;
		}

		if (store_id.search(/^[0-9]$/) == -1 || client_id.search(/^[0-9]$/) == -1) {

			Swal.fire({
				icon: 'error',
				title: '請輸入數字！！',
			})

			return;
		}


		if (client_id == null || client_id == '') {
			Swal.fire({
				icon: 'error',
				title: '請輸入會員！！',
			})
			return;
		}


	//是否新增訂位
		if (booking_id == null || booking_id == '') {
			Swal.fire({
				title: 'Are you sure?',
				text: "您將新增訂位表單",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonText: '新增!',
				cancelButtonText: '取消',
			}).then(function(check) {
				if (check.isConfirmed) {
					//送出
					console.log("送出");
					Swal.fire(
						'新增成功!',
						'您已成功新增一筆資料',
						'success'
					)
					window.setTimeout((() => document.querySelector(".form-valide").submit()),800);
				} else {
					//console.log("不送");
					return false;
				}
			})
		}
	//是否修改訂位
		if (booking_id != null && booking_id != '') {

			Swal.fire({
				title: 'Are you sure?',
				text: "您將修改訂位表單",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonText: '修改!',
				cancelButtonText: '取消',
			}).then((result) => {
				if (result.isConfirmed) {
					//送出
					console.log("送出");
					Swal.fire(
						'修改成功!',
						'您已成功新增一筆資料',
						'success'
					)
					window.setTimeout((() => document.querySelector(".form-valide").submit()),800);
				}
			})
		}
		
		return false
	})




	//jquery.validate
	function add() {
		//Fetch form to apply custom Bootstrap validation
		let form = $(".needs-validation")

		

		form.addClass('was-validated');

		//Make ajax call here

		function isNumberKey(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;
			return true;
		}

		//to confirm input takes only number input
		//use class ".shouldNumber" in your html <input type="text" /> element
		$('.shouldNumber').on('keypress', function() {
			return isNumberKey(event)
		});

	} (jQuery);
	jQuery(".form-valide").validate({
		rules: {
			"booking_table": {
				required: !0
			},
			"booking_people": {
				required: !0
			},
			"booking_date": {
				required: !0
			},
			"booking_period": {
				required: !0
			},
			"booking_cteateTime": {
				required: !0
			},
			"booking_status": {
				required: !0
			},
			"booking_photo": {
				required: !0
			},
			"store_id": {
				required: !0,
				digits: !0
			},
			"client_id": {
				required: !0,
				digits: !0
			}
		},
		messages: {
			/*"booking_table": {
				required: "請選擇桌號",
			},*/
			"booking_people": {
				required: "請選擇人數",
			},
			"booking_date": {
				required: "請選擇日期",
			},
			"booking_period": {
				required: "請選擇時段",
			},
			"booking_cteateTime": {
				required: "請選擇用餐時間",
			},
			"booking_status": {
				required: "請選擇訂單狀態",
			},
			"booking_photo": {
				required: "請選擇照片",
			},
			"store_id": {
				required: "請輸入商家編號",
				digits: "只能輸入數字"
			},
			"client_id": {
				required: "請輸入會員編號",
				digits: "只能輸入數字"
			}
		},

		ignore: [],
		errorClass: "invalid-feedback animated fadeInUp",
		errorElement: "div",
		errorPlacement: function(e, a) {
			jQuery(a).parents(".form-group > div").append(e)
		},
		highlight: function(e) {
			jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")
		},
		success: function(e) {
			jQuery(e).closest(".form-group").removeClass("is-invalid"), jQuery(e).remove()
		},
	});


	//取消
	function cancel() {
		history.back()
	}
	
	
	//一鍵輸入
	function oneok() {
		var count = Math.floor(Math.random() * 3 + 1);


		if (count == 1) {
			//document.form.booking_table.value = "1";
			document.form.booking_people.value = "3";
			document.form.booking_date.value = "2022-10-29";
			document.form.booking_period.value = "上午";
			document.form.booking_cteateTime.value = "10:30:00";
			document.form.booking_status.value = "訂位成功";

			//document.form.store_id.value = "1";
			document.form.client_id.value = "4";
		}
		if (count == 2) {
			//document.form.booking_table.value = "3";
			document.form.booking_people.value = "1";
			document.form.booking_date.value = "2025-11-22";
			document.form.booking_period.value = "中午";
			document.form.booking_cteateTime.value = "12:00:00";
			document.form.booking_status.value = "訂位審核";

			//document.form.store_id.value = "2";
			document.form.client_id.value = "8";
		}


		if (count == 3) {
			//document.form.booking_table.value = "5";
			document.form.booking_people.value = "4";
			document.form.booking_date.value = "2027-12-22";
			document.form.booking_period.value = "下午";
			document.form.booking_cteateTime.value = "15:30:00";
			document.form.booking_status.value = "訂位取消";

			//document.form.store_id.value = "3";
			document.form.client_id.value = "9";
		}
		
		var client_id = document.form.client_id.value;
		$.ajax({
			url: '../booking/order/clientName/'+client_id,
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
		
		
	};
	</script>
	
	
	
	<!--**********************************Scripts end********************************************-->
	
</body>
</html>
