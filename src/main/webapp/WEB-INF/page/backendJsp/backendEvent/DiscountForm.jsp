<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.ArrayList"%>
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
<title>廠商優惠管理</title>
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


<%@page import="tw.eatworld.event.model.Product"%>
<%@page import="tw.eatworld.event.model.ProductDiscount"%>
<%@page import="java.io.ObjectInputFilter.Status"%>
<%@page import="java.util.Iterator"%>
<%
response.setContentType("text/html;charset=UTF-8");
//避免 jsp 被 browser cache住而無法更新 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", -1);
%>
<div class="content-body" style="min-height: 884px;">
	
	<div class="row page-titles mx-0">

		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">GOGOEAT</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">廠商優惠管理</a></li>
			</ol>
		</div>
	</div>



	<!-- row -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">廠商優惠管理</h4>
						<div class="table-responsive">
<!-- 這裡寫內容 -->
	
	<form id="form0" action="login" method="POST"> 
	Store ID : <input type="number" name="store_id">
	<button type="submit" class="btn btn-primary" form="form0" name="submit" value="login">確認</button>
	</form><br>
	
	<h2>廠商增修優惠商品</h2>
	<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">請選擇欲增加優惠商品</h4>
								<div class="table-responsive">
								<form name="" id="form1" action="All" method="post">
								
								<table class="table table-bordered verticle-middle" id="table_id">

										<thead>
											<tr>
												<th scope="col"></th>
												<th scope="col">產品編號</th>
												<th scope="col">產品名稱</th>
												<th scope="col">產品內容</th>
												<th scope="col">產品價格</th>							 
											</tr>
										</thead>
										
										<tbody>
											<c:forEach var="item" items="${allProducts}">
											
												<tr>
													<td><input type="radio" name="productSelected" value="${item.product_id}" checked></td>
													<td width="55"><c:out value="${item.product_id}" /></td>
													<td><c:out value="${item.name}" /></td>
													<td><c:out value="${item.content}" /></td>
													<td width="55"><c:out value="${item.price}" /></td>										
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<button type="submit" class="btn btn-primary" name="submit" form="form1" value="All">確認</button>
									</form><br>
								</div>
								
								<h4 class="card-title">目前已登記之優惠商品，如欲修改或刪除請選擇</h4>
								<div class="table-responsive">
								<form id="form2" action="UpDateAndDelete" method="post">
								
								<table class="table table-bordered verticle-middle" id="table_id">

										<thead>
											<tr>
												<th scope="col"></th>
												<th scope="col">產品編號</th>
												<th scope="col">產品名稱</th>
												<th scope="col">產品價格</th>
												<th scope="col">優惠起始日</th>							 
												<th scope="col">優惠折扣(%)</th>							 
												<th scope="col">折扣後價格</th>							 
												<th scope="col">優惠截止日</th>							 
											</tr>
										</thead>
										
										<tbody>
											<c:forEach var="item" items="${discountProducts}">
											
												<tr>
													<td><input type="radio" name="update" value="${item.PD_id}" checked></td>
													<td width="55"><c:out value="${item.product.product_id}" /></td>
													<td><c:out value="${item.product.name}" /></td>
													<td><c:out value="${item.product.price}" /></td>
													<td><c:out value="${item.start_Date}" /></td>										
													<td><c:out value="${item.discount}" /></td>										
													<td><c:out value="${item.discount*item.product.price/100}"/></td>										
													<td><c:out value="${item.end_Date}" /></td>										
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<button type="submit" class="btn btn-primary" name="submit" form="form2" value="Update">修改</button>
									<button type="submit" class="btn btn-primary" name="submit" form="form2" value="Delete" onclick="return(confirm('確定刪除?'))">刪除</button>
									</form><br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
								

<%--------------------------此區域為顯示-增、刪、改-成功顯示畫面 --------------------------------------------------------%>
	<%
	if(session.getAttribute("status")=="2") {
	%>
	<P style=color:red>刪除一筆資料成功</P>
	<%
	}
	%>
	
	<%
		if(session.getAttribute("status")=="3") {
		%>
	<P style=color:red>新增一筆資料成功<br>
	<%
	ProductDiscount productDiscountBean = (ProductDiscount) request.getAttribute("procductDiscountBean");//用session.getAttribute去找會nullException，原因不明？？？
		out.println("產品編號: " + productDiscountBean.getProduct().getProduct_id() + ";  產品名稱: " + productDiscountBean.getProduct().getName() 
			+ ";  產品價格: " + productDiscountBean.getProduct().getPrice() + ";  優惠起始日: " + productDiscountBean.getStart_Date() 
			+ ";  優惠折扣: " + productDiscountBean.getDiscount() + "%;  折扣後價格: " 
			+ productDiscountBean.getProduct().getPrice()*productDiscountBean.getDiscount()/100 
			+ ";  優惠截止日: " + productDiscountBean.getEnd_Date());
		}
	%>
	</P>
	<%
	if(session.getAttribute("status")=="5") {
	%>
	<P style=color:red>修改一筆資料成功</P>
	<%
	}
	%>
			
			
	<br><hr><br>
<%----------------------------------------Status 1 印出已選擇欲新增產品之內容，然後選擇折扣與起訖日期 ----------------------------------%>	
	<%
		// 印出欲新增優惠項目並選擇
			if(session.getAttribute("status")=="1"){
		%>
	<P style=color:blue><strong>請設定增加優惠商品內容:</strong>
	
	<%
		Product productBean = (Product)session.getAttribute("productBean");
			out.println("產品編號: " + productBean.getProduct_id() + ";  產品名稱: " + productBean.getName() + ";  產品內容: " + productBean.getContent() + 
						";  產品價格: " + productBean.getPrice());
		%>
	
	</P>
	<form name="add" id="form3" action="Insert" method="post">
		<p>請選擇優惠開始日期<input type="date" name="start_Date" required> 請輸入優惠折數(%)<input type="number" name="discount" min="1" max="99" required>
		請選擇結束日期<input type="date" name="end_Date" required> 
		</p>
		<button type="submit" class="btn btn-primary" name="submit" form="form3" value="Insert">確認</button>
	</form>
	<%
	}
	%>		
	
<%----------------------------------------Status 4 印出已選擇欲修改產品之內容，然後選擇修改之折扣與起訖日期 ----------------------------------%>	
	<%
		// 印出欲修改優惠項目並選擇
			if(session.getAttribute("status")=="4"){
		%>
	<P style=color:blue><strong>欲修改商品優惠內容:</strong>
	
	<%
		ProductDiscount productDiscountBean = (ProductDiscount) session.getAttribute("productDiscountBean");
		//	if(productDiscountBean != null)
			out.println("產品編號: " + productDiscountBean.getProduct().getProduct_id() + ";  產品名稱: " + productDiscountBean.getProduct().getName() 
				+ ";  產品價格: " + productDiscountBean.getProduct().getPrice() + ";  優惠起始日: " + productDiscountBean.getStart_Date() 
				+ ";  優惠折扣: " + productDiscountBean.getDiscount() + "%;  折扣後價格: " 
				+ productDiscountBean.getProduct().getPrice()*productDiscountBean.getDiscount()/100 
				+ ";  優惠截止日: " + productDiscountBean.getEnd_Date());
		%>
	
	</P>
	<form name="Update" id="form4" action="Update_Confirm" method="post">
		<p>請選擇修改後優惠開始日期<input type="date" name="start" id="update1"> 請輸入修改後優惠折數(%)<input type="number" name="discount" min="1" max="99" 
		id="update2">請選擇修改後結束日期<input type="date" name="end" id="update3"> 
		</p>
		<p id="show" style="color:red"></p>
		<button type="submit" class="btn btn-primary" name="submit" form="form4" value="Update_Confirm">確認</button>
	</form>
	<%} %>		
	  
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
        $(function () {

			$('#update1,#update2,#update3').on('change keyup', function(){
				
				$('#show').text('修改後優惠起始日:  ' + ($('#update1').val()||'${productDiscountBean.getStart_Date()}') + ' 優惠折扣: ' + 
					($('#update2').val()||'${productDiscountBean.getDiscount()}') + '% 優惠截止日: '+ ($('#update3').val()||'${productDiscountBean.getEnd_Date()}'));
			})
        })
    </script>
	

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
	</div>
	<!--**********************************Main wrapper end**************************************-->
	<!--**********************************Scripts***********************************************-->
	<script src="<%=request.getContextPath()%>/plugins/common/common.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/custom.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/settings.js"></script>
	<script src="<%=request.getContextPath()%>/js/gleek.js"></script>
	<script src="<%=request.getContextPath()%>/js/styleSwitcher.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>



</body>
</html>
