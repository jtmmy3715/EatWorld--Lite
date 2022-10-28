<%@	page import="tw.eatworld.booking.model.BookingBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String path = request.getContextPath();%>
<%@ page isELIgnored="false" %>
<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<title>訂位管理</title>

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
		<div class="content-body" style="min-height: 884px;">




			<!-- 這裡寫內容 -->




			<div class="row page-titles mx-0">

				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">預訂管理</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">訂位管理</a></li>
					</ol>
				</div>
			</div>




			<!-- row -->


			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								
								<h4 class="card-title">
								<a href="#" data-toggle="button" data-placement="top" title="新增"> <i class="fa-solid fa-plus" onclick="new_data()"></i></a>
								訂位管理
								
								</h4>
								<h4 class="card-title">
								<span style="text-align:center;display:block;">店家: ${user.sName}</span>
								</h4>
								<div class="table-responsive">
									<table class="table table-bordered verticle-middle"
										id="table_id">


										<thead>
											<tr>
												<!-- <th scope="col">商家</th>-->
												<th scope="col">編號</th>
												<th scope="col">會員</th>
												<!-- <th scope="col">桌號</th>-->
												<th scope="col">人數</th>
												<th scope="col">日期</th>
												<th scope="col">時段</th>
												<th scope="col">時間</th>
												<th scope="col">狀態</th>
												<th scope="col">照片</th>
												


												<th scope="col">Action</th>
											</tr>


										</thead>
										<tbody>
										<!-- Loop Start -->
										<c:forEach var="booking" items="${bookingBeans}">
										<!-- update url -->
										<!-- delete url -->
												<tr>
													<!--<td><c:out value="${booking.storeMemberBean.store_name}" /></td>-->
													<td><c:out value="#${booking.booking_id}" /></td>
													<td><c:out value="${booking.clientMemberBean.client_name}" /></td>
													<!--<td><c:out value="${booking.booking_table}" /></td>-->
													<td><c:out value="${booking.booking_people}" /></td>
													<td><c:out value="${booking.booking_date}" /></td>
													<td><c:out value="${booking.booking_period}" /></td>
													<td><c:out value="${booking.booking_cteateTime}" /></td>
													<td>
													<c:if test="${booking.booking_status=='訂位審核'}">
															<span class="badge badge-warning px-4">審核</span>
														</c:if> <c:if test="${booking.booking_status=='訂位取消'}">
															<span class="badge badge-secondary px-4">取消</span>
														</c:if> <c:if test="${booking.booking_status=='訂位成功'}">
															<span class="badge badge-success px-4">成功</span>
														</c:if>
													</td>
													<td>
													
													<c:if test="${booking.booking_photo != '' }">
															<a href="#" data-toggle="button" data-placement="top"
																title="照片預覽"> <i class="fa-solid fa-magnifying-glass"
																onclick="search_photo('../../photo/${booking.booking_photo}');"></i>
															</a>
														</c:if>
													<c:out value="${booking.booking_photo}" /> 
													
														</td>
													

													<td align="center"><span> <a href="#"
															data-toggle="button" data-placement="top" title="修改">
																<i class="fa fa-pencil color-muted m-r-5"
																onclick="edit('${booking.booking_id}');" id="edit"></i>
														</a> <a href="#" data-toggle="button" data-placement="top"
															title="刪除"> <i class="fa fa-close color-danger"
																onclick="delete_data('${user.id}/${booking.booking_id}');"
																id="delete_data"></i></a>
													</span></td>




												</tr>
											</c:forEach>
											<!-- Loop End -->
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
	<%@include file="/resources/includes/javascript.jsp"%>
	
	<!-- js -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bookingment.js"></script>
	
	<!-- data-table -->
	<script type="text/javascript">
	$(function() {
		$('#table_id').DataTable({
			//設定中文
			language: {
				url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json",
				"emptyTable": "目前沒有資料，重新查詢"+ `<a href="#" data-toggle="button" data-placement="top" title="查詢">
												<i class="fa-solid fa-magnifying-glass" onclick="query()"></i>
												</a>`
			},
			//最後一欄不排序 //全部欄位置中
			columnDefs:[
				{targets:[8],orderable:false},
				{targets: '_all',className: 'text-center'}
			]
			
		}); // 初始化datatable
	})
	
	
	// button function
	// 新增
	function new_data() {
	window.location.href = "../storeform";
	}
	// 查詢
	function query() {
	window.location.href = "../storelist";
}
	// 編輯
	function edit(updateLink) {
	window.location.href = '../storeupdate/'+updateLink;
	}
	// 刪除
	function delete_data(deleteLink) {
		swal.fire({
			title: '確定刪除此訂位嗎?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '好',
			cancelButtonText: '不要',
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
				swal.fire(
					'Deleted!',
					'已成功刪除',
					'success'
				)
				window.setTimeout((() => window.location.href = '../storedelete/'+deleteLink),800);
			} else if (
				/* Read more about handling dismissals below */
				result.dismiss === Swal.DismissReason.cancel
			) {
				swal.fire(
					'取消刪除',
					'error'
				)
			}
		})
	}


	// 顯示圖片
	function search_photo(booking_photo) {
		console.log(booking_photo);
		swal.fire({
			imageUrl:booking_photo,
			imageWidth:300
		}
		
		)

	}

	
	
	</script>


	<!--**********************************Scripts end********************************************-->
</body>
</html>