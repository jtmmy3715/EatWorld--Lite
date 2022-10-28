<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<title>管理</title>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--**********************************Main wrapper start***********************************-->
	<div id="main-wrapper">
		<!--***********************Nav-header/Header/Nk-sidebar start***************************-->
		<%@include file="/resources/includes/store-navheader.jsp"%>
		<%@include file="/resources/includes/store-header.jsp"%>
		<%@include file="/resources/includes/store-sidebar.jsp"%>
		<!--***********************Nav-header/Header/Nk-sidebar End*****************************-->
		<!--**********************************Content body start********************************-->


		<!-- 這裡寫內容 -->




		<div class="content-body" style="min-height: 884px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">優惠活動</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">廠商新增參與活動</a></li>
					</ol>
				</div>
			</div>
			
<%------------------------------- 印出所有優惠活動以供選擇 --------------------------------------------------%>

	<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">目前所有優惠活動</h4><br>
							 	<button type="submit" class="btn btn-sm btn-outline-secondary" form="form0" name="submit" value="Set">選擇</button>									
								<div class="table-responsive">
								<br>
									<form id="form0" action="storeSelected" method="post">
									
									<table class="table table-bordered verticle-middle" id="table_id">

										<thead>
											<tr>
												<th scope="col"></th>
												<th scope="col">活動編號</th>
												<th scope="col">活動名稱</th>
												<th scope="col">優惠活動內容</th>
												<th scope="col">活動圖片</th>
												<th scope="col">折扣(%)</th>
												<th scope="col">折扣代碼</th>
												<th scope="col">活動起始日</th>
												<th scope="col">活動截止日</th>	
												<th scope="col">已參加產品</th>									 
											</tr>
										</thead>
										
										<tbody>
								    		<c:forEach var="event" items="${allEvent}">
											
												<tr>
													<td><input type="radio" name="eventSelected" value="${event.event_id}" checked></td>
													<td width="55"><c:out value="${event.event_id}" /></td>
													<td><c:out value="${event.event_Name}" /></td>
													<td><c:out value="${event.description}" /></td>
												 	<td><img src="<%=request.getContextPath()%>/photo/${event.event_Img}" width="150px" height="100px"></td>
													<td width="55"><c:out value="${event.discount}" /></td>
													<td><c:out value="${event.code}" /></td>
													<td><c:out value="${event.start_Date}" /></td>
													<td><c:out value="${event.end_Date}" /></td>
																																				
													<td><c:forEach var="item" items="${event.allProducts}"><c:if test="${item.store==4}">
													<c:out value="${item.product_id}  "/><c:out value="${item.name}"/><br></c:if></c:forEach></td>
													 																							
												</tr>											
											</c:forEach>
											
										</tbody>
									</table>
								
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			


		</div>
		<!--**********************************Content body end***********************************-->

		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/footer.jsp"%>
		<!--**********************************Footer end****************************************-->
	</div>
	<!--**********************************Main wrapper end**************************************-->
	<!--**********************************Scripts***********************************************-->
	<%@include file="/resources/includes/javascript.jsp"%>
	
	<!--**********************************Scripts end********************************************-->
</body>
</html>