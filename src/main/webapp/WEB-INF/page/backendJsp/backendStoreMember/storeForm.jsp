<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
String path = request.getContextPath();
%>
<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<title>管理</title>
<script>
	window.onload = function() {
		document.title = '餐廳管理';
	};
</script>
</head>
<body>


	<!--**********************************Main wrapper start***********************************-->
	<div id="main-wrapper">



		<!--**********************************Nav header start**********************************-->
		<%@include file="/resources/includes/nav-header.jsp"%>
		<!--**********************************Nav header end************************************-->
		<!--**********************************Header start**************************************-->
		<%@include file="/resources/includes/header.jsp"%>
		<!--**********************************Header end ti-comment-alt*************************-->
		<!--**********************************Sidebar start*************************************-->
		<%@include file="/resources/includes/nk-sidebar.jsp"%>
		<!--**********************************Sidebar end***************************************-->
		<!--**********************************Content body start********************************-->


		<!-- 這裡寫內容 -->
		<div class="content-body" style="min-height: 884px;">

			<div class="row page-titles mx-0">

				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">餐廳管理</a></li>

						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">新增餐廳</a></li>


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

									<!-- action -->

									<form:form class="form-valide" action="saveStore" method="post"
										id="StoreForm" enctype="multipart/form-data"
										modelAttribute="store">
										<div class="form-group row">
											<form:label path="sUsername" class="col-lg-4 col-form-label"
												for="sUsername">餐廳帳號
            <span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="sUsername" type="text"
													class="form-control" id="sUsername" name="sUsername" />
											</div>
										</div>
										<div class="form-group row">
											<form:label path="sPwd" class="col-lg-4 col-form-label"
												for="sPwd">餐廳密碼
            <span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="sPwd" type="text" class="form-control"
													id="sPwd" name="sPwd" />
											</div>
										</div>
<div class="form-group row">
    <form:label path="sLogo" class="col-lg-4 col-form-label" for="sLogo">餐廳圖片或Logo
        <span class="text-danger">*</span>
    </form:label>
    <div class="col-lg-6">
        <input path="sLogo" type="file" class="form-control" id="sLogo" name="sfiles" />
    </div>
</div>
										  <div class="form-group row">
											<form:label path="sName" class="col-lg-4 col-form-label"
												for="sName">餐廳名稱
            <span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="sName" type="text" class="form-control"
													id="sName" name="sName" />
											</div>
										</div>

										<!--  <div class="form-group row">
											<form:label path="sLogo" class="col-lg-4 col-form-label"
												for="val-username">餐廳LOGO
            <span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="sLogo" type="file" class="form-control"
													id="sLogo" name="sLogo"  />
											</div>
										</div> -->

										<div class="form-group row">
											<form:label path="sPhone" class="col-lg-4 col-form-label"
												for="sPhone">聯絡電話
            <span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="sPhone" type="text" class="form-control"
													id="sPhone" name="sPhone" />
											</div>
										</div>
										<div class="form-group row">
											<form:label path="sEmail" class="col-lg-4 col-form-label"
												for="sEmail">聯絡信箱
            <span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="sEmail" type="text" class="form-control"
													id="sEmail" name="sEmail" />
											</div>
										</div>

										<div class="form-group row">
											<form:label path="sIntroduction"
												class="col-lg-4 col-form-label" for="sIntroduction">餐廳簡介
            <span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="sIntroduction" type="text"
													class="form-control" id="sIntroduction"
													name="sIntroduction" />
											</div>
										</div>

										<div class="form-group row">
											<form:label path="sAddress" class="col-lg-4 col-form-label"
												for="sAddress">餐廳地址
            <span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="sAddress" type="text" class="form-control"
													id="sAddress" name="sAddress" />
											</div>
										</div>

										<div class="form-group row">
											<form:label path="openTime" class="col-lg-4 col-form-label"
												for="openTime">開始營業時間
            <span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="openTime" type="time" class="form-control"
													id="openTime" name="openTime" />
											</div>
										</div>

										<div class="form-group row">
											<form:label path="endTime" class="col-lg-4 col-form-label"
												for="endTime">結束營業時間
            <span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="endTime" type="time" class="form-control"
													id="endTime" name="endTime" />
											</div>
										</div>
										
										  <div class="form-group row">
        <form:label path="sBooking" class="col-lg-4 col-form-label" for="sBooking">訂位功能
            <span class="text-danger">*</span>
        </form:label>
        <div class="col-lg-6">
            <form:select path="sBooking" type="text" class="form-control" id="sBooking" name="sBooking">
                <form:option value="1">開啟</form:option>
                <form:option value="0">關閉</form:option>
            </form:select>
        </div>
    </div> 
    
    <div class="form-group row">
    <form:label path="storeclassification.cId" class="col-lg-4 col-form-label" for="sCategory">商家分類
    <span class="text-danger">*</span>
</form:label>
<div class="col-lg-6">
    <form:select path="storeclassification.cId" type="text" class="form-control" id="sCategory"
        name="sCategory">
        <option selected>請選擇您的餐廳類型</option>
        <form:option value="4">速食</form:option>
        <form:option value="5">下午茶</form:option>
        <form:option value="6">飲料</form:option>
        <form:option value="7">美式</form:option>
        <form:option value="8">中式</form:option>
        <form:option value="9">泰式</form:option>
        <form:option value="10">義式</form:option>
        <form:option value="11">日式</form:option>
        <form:option value="12">早午餐</form:option>
        <form:option value="14">小吃</form:option>

    </form:select>
    </div>
    </div>




										<div class="form-group row">
											<div class="col-lg-8 ml-auto">
												<form:button type="submit" class="btn btn-primary"
													name="submit">送出</form:button>

												<button type="button" class="btn btn-primary"
													onclick="back();">返回</button>
												<!--  <button type="button" class="btn btn-primary " id="correct">正確資料</button>
												<button type="button" class="btn btn-primary" id="error">錯誤資料</button> -->
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
			<!-- 內容結束 -->


			<!--**********************************Content body end**********************************-->



			<!--**********************************Footer start**************************************-->
			<%@include file="/resources/includes/footer.jsp"%>
			<!--**********************************Footer end****************************************-->
		</div>
		<!--**********************************Main wrapper end**************************************-->
		<!--**********************************Scripts***********************************************-->
		<script
			src="<%=request.getContextPath()%>/plugins/common/common.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/custom.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/settings.js"></script>
		<script src="<%=request.getContextPath()%>/js/gleek.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/styleSwitcher.js"></script>

		<script
			src="<%=request.getContextPath()%>/plugins/validation/jquery.validate.min.js"></script>
		<script>
			function back() {
				window.location.href = "storeList";
			}
		</script>
</body>
</html>
