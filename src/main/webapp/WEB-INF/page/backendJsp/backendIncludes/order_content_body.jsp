<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.eatworld.product.model.*,java.util.*"%>
<%
String path = request.getContextPath();
%>
<!--**********************************Content body start********************************-->
<div class="content-body" style="min-height: 884px;">

	<div class="row page-titles mx-0">

		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">訂單管理</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">訂單</a></li>
			</ol>
		</div>
	</div>

	<!-- row -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h2 class="card-title">訂單管理</h2>
						<div class="table-responsive">
						<!--  
						<c:forEach var="showcomboName" items="${sessionScope.comboList}" varStatus="comboloop">
							<button type="button" display="inline-block" value="${showcomboName.combo_name}"
							class=" btn btn-sm btn-outline-secondary combobtn">
								${showcomboName.combo_name}</button>
								
						</c:forEach>
						-->
						<script type="text/javascript"></script>
							<table class="table table-bordered verticle-middle" id="table_id" width="100%">
											
								<thead>
									<tr>
										<th>訂單編號</th>
										<th>會員編號</th>
										<th>訂單日期</th>
										<th>付款方式</th>
										<th>狀態</th>
										<th>金額</th>
										
									</tr>
								</thead>
								<tbody id="showCombo">
								<c:forEach var="orderitem" items="${orderList}" varStatus="loop">
								<tr>
									<td><c:out value="${orderitem.orderid}"></c:out></td>
									<td><c:out value="${orderitem.clientMember.clientId}"></c:out></td>
									<td><c:out value="${orderitem.ordertime}"></c:out></td>
									<c:choose>
									    <c:when test="${orderitem.paymentmethod eq 0}">
									    	<td>現場付款</td>
									    </c:when>
									    <c:when test="${orderitem.paymentmethod eq 1}">
									    	<td>信用卡</td>
									    </c:when>
									    <c:otherwise>
									    	<td>現場付款</td>
									    </c:otherwise>
									</c:choose>
									<c:choose>
									    <c:when test="${orderitem.status eq 300}">
									    	<td>付款中</td>
									    </c:when>
									   
									    <c:when test="${orderitem.status eq 400}">
									    	<td>
									    		<input type="hidden" value="${orderitem.orderid}"/>
												<select class="form-select select_order_status" aria-label="Default select example">
												<option selected value="0">已付款</option>
												<option value="1">完成訂單</option>
												</select>
											</td>
									    </c:when>
									    <c:when test="${orderitem.status eq 500}">
									    	<td>訂單完成</td>
									    </c:when>
									    <c:when test="${orderitem.status eq 600}">
									    	<td>申請退款中</td>
									    </c:when>
									    <c:when test="${orderitem.status eq 650}">
									    	<td>退款失敗</td>
									    </c:when>
									    <c:when test="${orderitem.status eq 700}">
									    	<td>已退款</td>
									    </c:when>
									    <c:otherwise>
									    
									    </c:otherwise>
									</c:choose>
									
									<td><c:out value="${orderitem.price}"></c:out></td>
									<!--  
									<td><a href="cart.html" class="check-btn sqr-btn ">刪除</a></td>
									   -->
								</tr>
							
							</c:forEach>


								<!--  
									<c:forEach var="product" items="${sessionScope.comboProductList}" varStatus="loop">
										<tr>
											<td><img src="${pageContext.request.contextPath}/photo/${product.photo}" width=150px height=120px></td>
											<td class="edit_td td_name"><c:out value="${product.productName}" /></td>
											<td class="edit_td"><c:out value="${product.price}" /></td>
											<td><span>
										<!--	<a href="#" data-toggle="button"
													data-placement="top" title="修改"> <i
														class="fa fa-pencil color-muted m-r-5"
														onclick="editPhoto();" id="edit"></i></a> -->
														<!-- 
														<a href="#" data-toggle="button" data-placement="top" title="刪除" > 
														<i class="fa fa-close color-danger" onclick="delete_data('${product.combo_id}');"
														id="delete_data"></i></a>

											</span></td>
										</tr>


									</c:forEach>
									-->
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
	<script src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
	<script src="${pageContext.request.contextPath}/js/styleSwitcher.js">
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://kit.fontawesome.com/bd205bf38d.js" crossorigin="anonymous"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

$(function () {
	$('.select_order_status').change(function(){
		if($(this).val()==1){
			$(this).val('0');
			let order_id =$(this).closest('td').find('input').val();
			   swal.fire({
				     title: '確定完成訂單嗎?',
				     icon: 'warning',
				     showCancelButton: true,
				     confirmButtonText: '好',
				     cancelButtonText: '不要',
				     reverseButtons: true
				   }).then((result) => {
				     if (result.isConfirmed) {
				    	 $.ajax({
				 			type:"GET",
				 			url:"/EatWorld/OrderController/updateOrderStatus",
				 			async:"true",
				 			data:"order_id="+order_id,
				 			success:function(resopnse,status,xhr){
				 				//判斷修改是否成功
				 				if(xhr.readyState==4&&xhr.status==200){
				 					if(xhr.responseText=="ok"){
				 						
				 						 window.location.reload();
				 						
	
				 					}else{
				 						console.log("更改失敗!");
				 					}
				 				}
				 				
				 			}
				 		});
				       
				     } else if (
				       /* Read more about handling dismissals below */
				       	result.dismiss === Swal.DismissReason.cancel
				       	
				     ) {
				       swal.fire(
				         '取消更改',
				         'error'
				       )
				     }
				   })
		}
		
	});
})



</script>