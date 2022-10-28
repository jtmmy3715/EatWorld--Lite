<%@page import="tw.eatworld.event.model.Event"%>
<%@page import="tw.eatworld.product.model.ProductService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="tw.eatworld.event.model.Product"%>
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
			
<%------------------------------- 印出優惠活動與參加之商品 --------------------------------------------------%>

	<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">									
								<div class="table-responsive">
									
									<table class="table table-bordered verticle-middle" id="">

										<thead>
											<tr>											
												<th scope="col">活動編號</th>
												<th scope="col">活動名稱</th>
												<th scope="col">優惠活動內容</th>
												<th scope="col">活動圖片</th>
												<th scope="col">折扣(%)</th>
												<th scope="col">折扣代碼</th>
												<th scope="col">活動起始日</th>
												<th scope="col">活動截止日</th>										 
											</tr>
										</thead>
										
										<tbody>
										
												<tr>
													<td width="55"><c:out value="${event.event_id}" /></td>
													<td><c:out value="${event.event_Name}" /></td>
													<td><c:out value="${event.description}" /></td>
												 	<td><img src="<%=request.getContextPath()%>/photo/${event.event_Img}" width="150px" height="100px"></td>
													<td width="55"><c:out value="${event.discount}" /></td>
													<td><c:out value="${event.code}" /></td>
													<td><c:out value="${event.start_Date}" /></td>
													<td><c:out value="${event.end_Date}" /></td>											
												</tr>											
											
										</tbody>
									</table><br>
									
									<form id="form2" action="storeDeleteItem" method="post">
								
									<table class="table table-bordered verticle-middle" id="table_id">

										<thead>
											<tr>
												<th scope="col"></th>
												<th scope="col">產品編號</th>
												<th scope="col">產品名稱</th>
												<th scope="col">產品內容</th>
												<th scope="col">產品價格</th>							 
												<th scope="col">打折後價格</th>							 
												<th scope="col">商家編號</th>							 
											</tr>
										</thead>
										
										<tbody>
										<% if("${event.allProducts}" != null){	%>
											<c:forEach var="item" items="${event.allProducts}">								
 											<c:if test="${item.store==4}">							
												<tr>
													<td><input type="radio" name="productSelected" value="${item.product_id}" checked></td>
													<td width="55"><c:out value="${item.product_id}" /></td>
													<td><c:out value="${item.name}" /></td>
													<td><c:out value="${item.content}" /></td>
													<td width="100"><c:out value="${item.price}" /></td>										
													<td width="100"><c:out value="${item.price*event.discount/100}" /></td>										
													<td width="55"><c:out value="${item.store}" /></td>										
												</tr>
											</c:if> 
											</c:forEach>
										<%}%>
										</tbody>
									</table>
 	

		<button type="submit" class="btn btn-primary" name="submit" form="form2" value="DeleteItem" title="刪除參加商品" onclick="return(confirm('確定刪除?'))">刪除</button>
		<a data-toggle="modal" data-target="#addItem" title="新增參加商品" href="#" class="btn btn-primary" id="again">新增商品</a>
		<a title="返回廠商優惠活動首頁" href="../Event/storeStart" class="btn btn-primary" id="again">返回</a>
		
	</form><br>
								
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
		
<%--------------------------------------------------- 新增參與商品彈跳視窗開始 --------------------------------------------%>
	<div class="modal fade" id="addItem" tabindex="-1" role="dialog">
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
	<p style=color:red ><strong>新增參與活動之商品: </strong></p>
	<br>
	
								<form name="" id="form4" action="storeAppendItem" method="post">
								
								<table class="table table-bordered verticle-middle" id="table_id">

										<thead>
											<tr>
												<th scope="col"></th>
												<th scope="col">產品編號</th>
												<th scope="col">產品名稱</th>
												<th scope="col">產品內容</th>
												<th scope="col">產品價格</th>							 
												<th scope="col">商家編號</th>							 
											</tr>
										</thead>
										<tbody>
										<c:forEach var="item" items="${storeProduct}">		
										<tr>
												<td><input type="radio" name="idSelected" value="${item.product_id}" checked></td>
												<td width="55">${item.product_id}</td>
												<td>${item.name}</td>
												<td>${item.content}</td>
												<td width="55">${item.price}</td>										
												<td width="55">${item.store}</td>										
										</tr>
										</c:forEach>
										</tbody>
									</table>

		<button type="submit" class="btn btn-primary" name="submit" form="form4" value="AppendItem">新增</button>
	</form><br>
	</div>
							
					</div>
	</div>
	</div>
<!---------------------------------------- 新增參與商品彈出資訊內容 結束 ------------------------------------------->	
		
	</div>
	<!--**********************************Main wrapper end**************************************-->
	<!--**********************************Scripts***********************************************-->
	<%@include file="/resources/includes/javascript.jsp"%>
	
	<!--**********************************Scripts end********************************************-->
</body>
</html>