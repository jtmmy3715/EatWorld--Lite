
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<title>所有會員</title>
<script>window.onload = function () {document.title = '所有餐廳';};</script>
<style>
img{
  display: block;
  margin: 0 auto;
}
</style>
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
		<div class="content-body" style="min-height: 884px;">

			<!-- 這裡寫內容 -->

			<div class="row page-titles mx-0">

				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">會員管理</a></li>
						<li class="breadcrumb-item active"><a href="javascript:void(0)">所有餐廳</a></li>
					</ol>
				</div>
			</div>

			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">所有餐廳</h4>
								<button type="button" class=" btn btn-sm btn-outline-secondary"
									onclick="addClient();">
									<i class="fa-solid fa-user-plus"></i>新增餐廳
								</button>
								<div class="table-responsive">
									<table class="table table-bordered verticle-middle"
										id="table_id">

										<thead>
											<tr>
												<th scope="col">編號</th>
												<th scope="col">圖片</th>
												<th scope="col">帳號</th>
												<th scope="col">商家名稱</th>
												<th scope="col">電話</th>
												<th scope="col">信箱</th>
												<th scope="col">加入日期</th>
												<th scope="col">地址</th>
												<th scope="col">訂位功能</th>
												<th scope="col">操作</th>
											</tr>

										</thead>
										<tbody>
											<c:forEach var="store" items="${store}">
												<tr>
													<td><c:out value="${store.id}" /></td>
													<td width="130">
														<img src="<%=request.getContextPath()%>/photo/${store.sLogo}" width="130" height="130"/>
													</td>
													<td><c:out value="${store.sUsername}" /></td>
													<td><c:out value="${store.sName}" /></td>
													<td><c:out value="${store.sPhone}" /></td>
													<td><c:out value="${store.sEmail}" /></td>
													<td><c:out value="${store.addDate}" /></td>
													<td><c:out value="${store.sAddress}" /></td>
                									<td>
                										<c:if test="${store.sBooking == 1 }">關閉</c:if>
                										<c:if test="${store.sBooking == 0 }">開啟</c:if>
                									</td>

													<td>
    												<span> 
    													<a href="#" data-toggle="button" data-placement="top" title="修改"> 
        												<i class="fa fa-pencil color-muted m-r-5"onclick="editClient('${store.id}');"></i>
    														</a>    &nbsp; 
    													<a href="#" data-toggle="button" data-placement="top" title="刪除"> 
        												<i class="fa fa-close color-danger"onclick="deleteClient('${store.id}');"></i></a>
    												</span>
													</td>
													
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- #/ container -->
			<!-- 內容結束 -->

		</div>
		<!--**********************************Content body end***********************************-->
	</div>
	<!--**********************************Main wrapper end***************************************-->
	<!--**********************************Footer start*******************************************-->
	<%@include file="/resources/includes/footer.jsp"%>
	<!--**********************************Footer end*********************************************-->
	<!--**********************************Scripts************************************************-->
	<script src="<%=request.getContextPath()%>/plugins/common/common.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/custom.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/settings.js"></script>
	<script src="<%=request.getContextPath()%>/js/gleek.js"></script>
	<script src="<%=request.getContextPath()%>/js/styleSwitcher.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="//cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://kit.fontawesome.com/98dd64d592.js" crossorigin="anonymous"></script>
	

	<script>
	// 初始化table
	$(function() {
		  $('#table_id').DataTable({
		   "columnDefs" : [ {
		    "orderable" : false,
		    "targets" : [ 8 ]
		   } ]
		  });
		 })
		 	 
 // button function
 // 新增
 function addClient(){
  window.location.href = "addStore";
 }

 // 編輯
 function editClient(id){
	 window.location.href = "updateStoreForm?id=" + id;
	 }
 
 // 刪除
 function deleteClient(id){

   
   swal.fire({
     title: '確定刪除此會員嗎?',
     icon: 'warning',
     showCancelButton: true,
     confirmButtonText: '確認',
     cancelButtonText: '取消',
     reverseButtons: true
   }).then((result) => {
     if (result.isConfirmed) {
       swal.fire(
         'Deleted!',
         '已成功刪除',
         'success'
       )
       window.location.href = "deleteStore?id=" + id;
     } else if (
       result.dismiss === Swal.DismissReason.cancel
     ) {
       swal.fire(
         '取消刪除'
       )
     }
   })
 }
 </script>
	<!--**********************************Scripts***********************************-->
</body>
</html>