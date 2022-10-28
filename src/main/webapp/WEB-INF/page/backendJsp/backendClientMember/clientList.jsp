<%@page import="tw.eatworld.client.model.ClientMember"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
%>
<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<title>所有會員</title>
<script>window.onload = function () {document.title = '會員管理';};</script>
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
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">所有會員</a></li>
					</ol>
				</div>
			</div>


			<!-- row -->


			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">所有會員</h4>
								<button type="button" class="btn btn-sm btn-outline-secondary" onclick="addClient();">
								<i class="fa-solid fa-user-plus"></i>新增會員</button>
								<button type="button" class="btn btn-sm btn-outline-secondary" onclick="exportPDF();">
								<i class="fa fa-download"></i>匯出會員資料</button>
								<div class="table-responsive">
									<table class="table table-bordered verticle-middle" id="table_id">
										<thead>
											<tr>
											<th scope="col" width="20">ID</th>
												<th scope="col">帳號</th>
												<th scope="col">名稱</th>
												<th scope="col">頭像</th>
												<th scope="col">電話</th>
												<th scope="col" width="80">信箱</th>
												<th scope="col" width="100">生日</th>


										 	  	<%--<button>
													<th scope="col"><button type="button"
															class=" btn btn-sm btn-outline-secondary"
															onclick="query()">
															<i class="bi bi-search"></i>查詢
														</button>--%>
														<th scope="col" width="100">操作</th>
											</tr>


										</thead>
										<tbody>
											<c:forEach var="client" items="${allClients}">
												<tr>
													<td width="20"><c:out value="${client.clientId}" /></td>
													<td><c:out value="${client.clientUsername}" /></td>
													<td width="80"><c:out value="${client.clientName}" /></td>
												 	<td width="100"><img src="<%=request.getContextPath()%>/photo/${client.clientMemberDetail.clientLogo}" width="100" height="100"></td>
													<td><c:out value="${client.clientMemberDetail.clientPhone}" /></td>
													<td width="80"><c:out value="${client.clientEmail}" /></td>
													<td width="100"><c:out value="${client.clientMemberDetail.clientBirthday}" /></td>
													<td><span> <a href="#" data-toggle="button"
															data-placement="top" title="修改">
															<i class="fa-solid fa-user-pen color-muted m-r-5"
																onclick="editClient('${client.clientId}');"></i></a>

															<a href="#" data-toggle="button" data-placement="top"
															title="刪除" width="100"> <i class="fa-solid fa-user-large-slash color-danger"
																onclick="deleteClient('${client.clientId}');"></i></a>
													</span></td>

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
	<%@include file="/resources/includes/backendClientJS.jsp"%>
	<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/resources/js/clientList.js"></script>
	<!--**********************************Scripts***********************************-->
</body>
</html>