<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page import="tw.eatworld.event.model.Product"%>
<%@ page import="tw.eatworld.event.model.Event" %>
<%@ page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
String path = request.getContextPath();
%>
<!doctype html>
<html>
<head>

<%@include file="/resources/includes/head.jsp"%>

<title>優惠活動管理</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function(){
		$(".inputImageFile").change(function(e){
			var sourceImageUrl = URL.createObjectURL(e.target.files[0]);		
			document.querySelector(".sourceImage").src = sourceImageUrl;			
		});	
	});
	
	$(document).ready(function(){
		$("#updateImageFile").change(function(e){
			var sourceImageUrl = URL.createObjectURL(e.target.files[0]);		
			document.querySelector("#updateImage").src = sourceImageUrl;			
		});	
	});
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
<div class="content-body" style="min-height: 884px;">
	
	<div class="row page-titles mx-0">

		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">優惠活動管理</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">折扣碼活動管理</a></li>
			</ol>
		</div>
	</div>



	<!-- row -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">優惠活動管理</h4>
						<div class="table-responsive">
<!-- 這裡寫內容 -->


<%-------------------------------印出所有優惠活動以供選擇查詢,修改,新增 --------------------------------------------------%>
	<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">目前所有優惠活動</h4>
						  	 	<a data-toggle="modal" data-target="#addModal"	title="新增活動" href="#" class="btn btn-sm btn-outline-secondary">新增優惠活動</a>
								<button type="submit" class="btn btn-sm btn-outline-secondary" form="form0" name="submit" value="Read">
								<i class="fa-solid fa-user-plus"></i>查詢與修改活動</button> 					
								<button type="submit" class="btn btn-sm btn-outline-secondary" form="form0" name="submit"value="Delete" onclick="return(confirm('確定刪除?'))">
								<i class="fa-solid fa-user-plus"></i>刪除活動</button>
								<div class="table-responsive">
									<form id="form0" action="EventsMain" method="post">
									
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
		

         <%---------------------------------此區域為印出新增,刪除,修改成功之訊息------------------------------------------------%>	
	<%if(session.getAttribute("status")=="Append") out.println("<p style='color:#D94600;font:bold;font-size:20px;'>新增一筆活動名稱: "
																+ session.getAttribute("event_Name") + " 成功</p>");%>
	<%if(session.getAttribute("status")=="Delete") out.println("<p style='color:#D94600;font:bold;font-size:20px;'>刪除一筆活動編號: "
															+ session.getAttribute("event_id") + "成功</p>");	%>
	<%if(session.getAttribute("status")=="UpdateConfirm") out.println("<p style='color:#D94600;font:bold;font-size:20px;'>修改一筆活動編號: "
															+ session.getAttribute("event_id") + "成功</p>");	%>
	
	<br><hr>
	
					
	
 
<%----------------------------------按活動"查詢或修改"按鈕後顯示之該活動內容與欲變更內容之form -------------------------------%>
	
	<%
		if(session.getAttribute("status")=="Read"){
		Event event = (Event)session.getAttribute("event");
		
		ArrayList<Product> storeProduct = (ArrayList<Product>)session.getAttribute("storeProduct");			
		ArrayList<Product> allProduct = (ArrayList<Product>)session.getAttribute("allProduct");
	
	%>
 	<p style=color:red ><strong>所查詢活動編號: <%=event.getEvent_id()%> 之優惠活動 </strong></p>
 	<p>活動名稱: <%=event.getEvent_Name()%></p>
 	<img src = "<%=request.getContextPath()%>/photo/<%=event.getEvent_Img()%>" width="150px" height="100px">
	<p>活動內容: <%=event.getDescription()%></p>
	<p>活動折扣: <%=event.getDiscount()%>折; 活動折扣碼: <%=event.getCode()%>; 活動起始日: <%=event.getStart_Date()%>; 活動截止日: <%=event.getEnd_Date()%></p>
 <%--  	<form id="form10" action="gotoUpdate" method="post"></form>  --%>
  	<a data-toggle="modal" data-target="#UpdateEvent" title="修改活動內容" href="#" class="btn btn-primary" >修改</a>	
<%--  	<button type="submit" class="btn btn-primary" name="submit" form="form10" value="Update" title="修改活動內容">修改</button> --%>
	<br><br><br>
 	<p style=color:red ><strong>參加活動編號: <%=event.getEvent_id()%> 之商品: </strong></p>
 	
 <div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
								<form id="form2" action="gotoDeleteItem" method="post">
								
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
										<%
										if(storeProduct != null){	%>
											<c:forEach var="item" items="${allProduct}">
											
												<tr>
													<td><input type="radio" name="productSelected" value="${item.product_id}" checked></td>
													<td width="55"><c:out value="${item.product_id}" /></td>
													<td><c:out value="${item.name}" /></td>
													<td><c:out value="${item.content}" /></td>
													<td width="55"><c:out value="${item.price}" /></td>	
													<td><c:out value="${event.discount*item.price/100}"/></td>									
													<td width="55"><c:out value="${item.store}" /></td>										
												</tr>
											</c:forEach>
										<%
										}	%>
										</tbody>
									</table>
 	

		<button type="submit" class="btn btn-primary" name="submit" form="form2" value="DeleteItem" title="刪除參加商品" onclick="return(confirm('確定刪除?'))">刪除</button>
		<a data-toggle="modal" data-target="#addItem" title="新增參加商品" href="#" class="btn btn-primary" id="again">新增商品</a>
	</form><br>
          <%----------------------------------------此區域為印出新增或刪除一筆產品成功之訊息-------------------------------------%>
	<%
	if(session.getAttribute("AppendItem").equals("True")) out.println("<p style='color:#D94600;font:bold;font-size:16px;'>新增一筆產品編號: " 
																+ session.getAttribute("product_id") + " 成功</p>");
	if(session.getAttribute("DeleteItem").equals("True")) out.println("<p style='color:#D94600;font:bold;font-size:16px;'>刪除一筆產品編號: "
																+ session.getAttribute("product_id") + " 成功</p>");
	%>
	

							</div>
						</div>
					</div>
				</div>
			</div>
	</div>	
						
 	
 	<% } %>
	

	
	


<!-- 內容結束 -->
			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- #/ container -->
	
		</div>
		<!--**********************************Content body end**********************************-->



		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/footer.jsp"%>
		<!--**********************************Footer end****************************************-->
		
<%----------------------------------按活動新增按鈕後,產生新增活動之選擇項目(彈跳視窗)------------------------------------------------------------%>

 	<div class="modal fade" id="addModal" tabindex="-1" role="dialog">
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
								
	<p style=color:blue><strong>請設定增加優惠內容</strong></p>
	<form name="addEvent" id="form1" action="gotoAppend" method="post">
	<p>優惠活動名稱:<input type="text" style="width:400px" name="event_Name" required></p>
	<p>優惠活動內容:<input type="text" style="width:400px" name="description" required></p>

    <%------------------新增圖片-------------------------%>
       <input type="file" name="inputImageFile" class="inputImageFile" data-target="file-uploader" accept="image/*">
       <br>
       Source image:
       <br>
       <img class="sourceImage" width="150px" height="100px" /> 
       <br><br>
    <%------------------------------------------------%>			
	<p>
	活動起始日:<input type="date" name="start_Date" required> 優惠折扣碼:<input type ="text" name="code"> 優惠打折數(%)
	<input type="number" name="discount" min="1" max="99" required> 活動截止日：<input type="date" name="end_Date" required>
	</p>
	<p style="color:red">有配合活動產品請按 "新增" 後再按 "查詢與修改" 按鈕，新增參加活動商品：
	<button type="button" class="btn btn-info" onclick="oneclick()">一鍵輸入</button>
	<button type="submit" class="btn btn-primary" name="submit" form="form1" value="Append">新增</button>
	</p>	
	</form>	
	</div>	
						</div>
	</div>
	</div>
<!---------------------------------- 新增彈出資訊內容 結束 -------------------------------------------------------------------->

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

	廠商編號Store_id : <input type="number" class="searchInput" name="store_id" required>
	<button type="submit" class="btn btn-primary" form="form3" name="submit" value="ReadStore" onclick="ReadStore()">確認</button>

	<br>
	
								<form name="" id="form4" action="gotoAppendItem" method="post">
								
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
										
										<tbody class="showStoreProduct">
										
										</tbody>
									</table>

		<button type="submit" class="btn btn-primary" name="submit" form="form4" value="AppendItem">新增</button>
	</form><br>
	</div>
							
					</div>
	</div>
	</div>
<!---------------------------------------- 新增參與商品彈出資訊內容 結束 ------------------------------------------->	

<%----------------------------------按活動"修改"按鈕後,產生該活動內容與更改之選擇項目 ------------------------------------------------------------%>
  	<div class="modal fade" id="UpdateEvent" tabindex="-1" role="dialog">
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
	<%
	if(session.getAttribute("status")=="Read"){	
		Event event = (Event)session.getAttribute("event");
	%>
	<p>活動編號: <%=event.getEvent_id()%></p>
	<img src="<%=request.getContextPath()%>/photo/<%=event.getEvent_Img()%>" width="150px" height="100px"><br><br>
	<p>活動名稱: <%=event.getEvent_Name()%></p>
	<p>活動內容: <%=event.getDescription()%></p>
    <p>活動折扣: <%=event.getDiscount()%>折; 活動折扣碼: <%=event.getCode()%>; 活動起始日: <%=event.getStart_Date()%>; 活動截止日: <%=event.getEnd_Date() %></p>	
	<p style=color:blue><strong>請設定更改優惠內容</strong></p>
	<form modelAttribute="updateEvent" id="form5" action="gotoUpdateConfirm" method="post">
	<p>優惠活動名稱:<input type="text" style="width:420px" name="event_Name" placeholder="${event.event_Name}" onfocus="this.placeholder=''" 
	onblur="this.placeholder='${event.event_Name}'"/></p>
	<p>優惠活動內容:<input type="text" style="width:420px" name="description" placeholder="${event.description}" onfocus="this.placeholder=''" 
	onblur="this.placeholder='${event.description}'"/></p>
	
	    <%------------------修改圖片-------------------------%>
       <input type="file" name="inputImageFile" id="updateImageFile" data-target="file-uploader" accept="image/*">
       <br>
       Update image:
       <br>
       <img src="<%=request.getContextPath()%>/photo/<%=event.getEvent_Img()%>" id="updateImage" width="150px" height="100px" /> 
       <br><br>
       <%------------------------------------------------%>
    
    <p>
	活動起始日:<input type="date" name="start_Date" value="${event.start_Date}"/> 
	優惠折扣碼:<input type ="text" name="code" placeholder="${event.code}" onfocus="this.placeholder=''" onblur="this.placeholder='${event.code}'"/> 
	優惠打折數(%)<input type="number" name="discount" min="1" max="99" placeholder="${event.discount}" onfocus="this.placeholder=''" 
	onblur="this.placeholder='${event.discount}'"/> 
	活動截止日：<input type="date" name="end_Date" value="${event.end_Date}"/>
	</p>
	<button type="submit" class="btn btn-primary" name="submit" form="form5" value="UpdateConfirm">確定修改</button>
	</form>
	<% } %>
   	</div>
							
					</div>
	</div>
	</div>   	
<!----------------------------------------修改活動彈出資訊內容 結束 ------------------------------------------->				
			
		
	</div>
	<!--**********************************Main wrapper end**************************************-->
	<!--**********************************Scripts***********************************************-->
	<script type="text/javascript">
	//一鍵輸入
	function oneclick() {
			document.addEvent.event_Name.value = "萬聖節快樂";
			document.addEvent.description.value = "精選商品八折優惠";
			document.addEvent.start_Date.value = "2022-10-30";
			document.addEvent.code.value = "Halloween";
			document.addEvent.discount.value = "80";
			document.addEvent.end_Date.value = "2022-11-01";
	};

	</script>
	<script src="<%=request.getContextPath()%>/plugins/common/common.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/custom.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/settings.js"></script>
	<script src="<%=request.getContextPath()%>/js/gleek.js"></script>
	<script src="<%=request.getContextPath()%>/js/styleSwitcher.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="<%=request.getContextPath()%>/resources/js/EventForm.js"></script>


</body>
</html>
