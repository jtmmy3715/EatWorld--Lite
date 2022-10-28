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
				<li class="breadcrumb-item"><a href="javascript:void(0)">菜單管理</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">套餐</a></li>
			</ol>
		</div>
	</div>


	


	<!-- row -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h2 class="card-title">套餐管理</h2>
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
										<th scope="col">內文</th>
										<th scope="col">相片</th>
										<th scope="col">名字</th>
										<th scope="col">價格</th>
										<th scope="col">
											<button type="button"
												class=" btn btn-sm btn-outline-secondary"
												onclick="goToComboPage();">新增
											</button></th>
									
									</tr>
								</thead>
								<tbody id="showCombo">
								<c:forEach var="combo" items="${sessionScope.comboList}" varStatus="loop">
										<tr>
											
											<td>
											<input type="hidden" value="${combo.combo_name}" name="name"/>
											<input value="close" id="show_detail_status" type="hidden"/>
											<input value="#demo${loop.index}" id="id_loop_index" type="hidden"/>
											<a  class="btn btn-primary showDetail" data-bs-toggle="collapse" href="#demo${loop.index}" role="button" aria-expanded="false" aria-controls="collapseExample">
   												 <i class="fa-solid fa-circle-plus" id="fa_style"></i></a>
   												 </td>
											<td><img src="${pageContext.request.contextPath}/photo/${combo.photo}" width=150px height=120px></td>
											<td class="edit_td td_name"><c:out value="${combo.combo_name}" /></td>
											
											<td class="edit_td" id="id_combo_price">
												<c:out value="${combo.price}" />元</td>
											<td><span>
	
														<!-- -->
														<a href="#" data-toggle="button" data-placement="top" title="刪除" > 
														<i class="fa fa-close color-danger" onclick="delete_data('${combo.combo_name}');"
														id="delete_data"></i></a>

											</span></td>
										</tr>
										<tr class="show_combo_tr">
								            <td colspan="12" class="hiddenRow">
												<div class="accordian-body collapse" id="demo${loop.index}"> 
										              <table class="table table-striped">
										                      <thead>
										                        <tr class="info">
																	<th>名稱</th>
																	<th>價格</th>
																	<th >數量</th>		
								
																	<th>Action</th>	
																</tr>
															</thead>	
											  		
															<tbody class="table_combo_product">
															
															<!--
				                        						<tr>
				                        						  
																	<td> <a href="###" onclick="edit_combo_product(${combo.combo_id});">Enginner Software</a></td>
																	<td>$80</td>
																	<td>1</td>
																	<td> 
																		<a href="#" class="btn btn-default btn-sm"></a>
																	</td>
																	
																</tr>
																
																<tr  class="accordion-toggle" >
																	<td> 總金額:</td>
																	<td >$<span id="sp_combo_total">80</span></td>
																	<td> <input type="text" id="input_combo_price"/></td>
																	<td> <button class= "btn btnCombo"type="button" value="combo_price_submit" id="btn_combo_price">送出</button></td>
																</tr>-->
																
															</tbody>
														</table>
													</div>
												</td>
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
var comboName="combo";
$(function () {
/*
    $('.combobtn').mousedown(function(e){
		if(e.which==1){
			comboName = $(this).val();
			let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","comboChange");
			let eleCombo=$(document.createElement('input')).attr('name','combo_name').val(comboName);
			//let eleAction=$(document.createElement('input')).attr('name','action').val("changeComboData");
		 	form.append(eleCombo);
		 	$("body").append(form);
		 	form.submit();
		}else if(e.which==3){
			comboName = $(this).val();
			let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","deleteCombo");
			let eleCombo=$(document.createElement('input')).attr('name','combo_name').val(comboName);
			//let eleAction=$(document.createElement('input')).attr('name','action').val("delete_combo");
		 	form.append(eleCombo);
		 	$("body").append(form);
		 	form.submit();
		}
	})*/
	
	$('.showDetail').on('click',function(){
		var combo_name = $(this).closest('td').find("input").val();
		//先用JQUERY在外取得
		var $comboProduct=$(this).closest('tr').next().find('.table_combo_product');
		var $faStyle=$(this).closest('td').find('#fa_style')
		var status=$("#show_detail_status").val();
		if(status==="close")
		{
			updateComboProduct(combo_name,$comboProduct,$faStyle);
		}else{
			$("#show_detail_status").val("close");
			$(this).closest('td').find('#fa_style').attr('class','fa-solid fa-circle-plus')
		}
	});
	//傾聽修改價格按鈕
	$(document).on('click','.btnPriceSubmit',function(){
		let combo_name=$(this).attr('name');
		let price=$(this).closest("td").prev().find('#input_price').val();
		$(this).closest(".show_combo_tr").prev().find("#id_combo_price").html(price+"元");
		//let loop_index = $(this).closest(".show_combo_tr").prev().find("#id_loop_index").val();
		
		console.log(combo_name+'/'+price+"/");
		//AJAX修改
		$.ajax({
			type:"POST",
			url:"/EatWorld/ProductController/updateComboPrice",
			async:"false",
			data:"combo_name="+combo_name+"&price="+price,
			success:function(resopnse,status,xhr){
				console.log("JQUERY連線成功");
				console.log(xhr.status);
				console.log(xhr.readyState);
				//判斷是否修改價格成功
				if(xhr.readyState==4&&xhr.status==200){
					if(xhr.responseText=="ok"){
						console.log("新增成功!");
					}else{
						console.log("新增失敗!");
					}
				}
				
			}
		});
		
	});
    
})

function updateComboProduct(combo_name,$comboProduct,$faStyle){
	//修改開啟關閉狀態，避免多次讀取
	$("#show_detail_status").val("open");
	//修改按鈕樣式為-收起
	$faStyle.attr('class','fa-solid fa-circle-minus')
	var total=0;
	$.getJSON({
	    type:"POST",
	    url:"/EatWorld/ProductController/getComboProduct",
	    async:"true",
	    data:"combo_name="+combo_name,
	    success:function(data){
	    
	     console.log("JQUERY讀取套餐商品連線成功");
	     console.log("套餐"+data.length);
	     //清空商品列表，JQUERY在外取得完才能用
	    	$comboProduct.empty();
			$.each(data, function (index, value) {
				total+=value.productBean.price;
				$comboProduct.append(
			    	                $('<tr/>')
			    	                    .append(
			    	                        $('<td/>')
			    	                            .append(
			    	                                $('<a/>')
			    	                                    .attr('href', '###')
			    	                                    .attr('onclick', "")
			    	                                    .text(value.productBean.name)
			    	                            )
			    	                    )
			    	                    .append(
			    	                        $('<td/>')
			    	                            .text(value.productBean.price)
			    	                    )
			    	                    .append(
			    	                        $('<td/>')
			    	                            .text("1")
			    	                    )
			    	                    .append(
			    	                        $('<td/>')
			    	                            .append(
			    	                                $('<a/>').addClass("btn btn-default btn-sm")
			    	                                    .attr('href', '###')

			    	                            )
			    	                    )

			    	            )
	        })

	        $comboProduct.append(
	        		 $('<tr/>').addClass('accordion-toggle')
	        		 .append(
	        				 $('<td/>')
	        					.text('總金額:')
	        		 )
	        		 .append(
	        				 $('<td/>')
	        					.text('$'+total)
	        		 )
	        		 .append(
	        				 $('<td/>')
	        				 .append(
	        					$('<input/>')
	        					.attr('type','text')
	        					.attr('id','input_price')
	        					.attr('placeholder','套餐金額')
	        				 )
	        		 )
	        		 .append(
	        				 $('<td/>')
	        				 .append(
	        					$('<button/>').addClass('btn btnCombo btnPriceSubmit')
	        					.attr('type','button')
	        					.attr('name',combo_name)
	        					//.attr('onclick','edit_combo_price(' +'"' +combo_name +'"' + ')')
	        					.html('送出')
	        				 ) 
	        				 
	        		)
	        		
	        )
	     
	           

	    },error:function(data){
	     console.log("讀取套餐商品失敗");
	    }
	   });
}
	
/*	function edit_combo_price(combo_name){
		$("#input_price")
	console.log(combo_name);
	
}*/

	//新增套餐頁面
	function goToComboPage(){
		let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","goToComboPage");
		/*let eleTest=$(document.createElement('input')).attr('name','Test').val("123");
	 	form.append(eleTest);*/
	 	$("body").append(form);
	 	form.submit();
		
	}
	
	
	//刪除套餐
	function delete_data(combo_name){
	   swal.fire({
		     title: '確定刪除此套餐嗎?',
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
		       	
				let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","deleteCombo");
				let eleCombo=$(document.createElement('input')).attr('name','combo_name').val(combo_name);
				//let eleAction=$(document.createElement('input')).attr('name','action').val("delete_combo");
			 	form.append(eleCombo);
			 	$("body").append(form);
			 	form.submit();
		       
		     } else if (
		       /* Read more about handling dismissals below */
		       	result.dismiss === Swal.DismissReason.cancel
		     ) 
		     {
		       swal.fire(
		         '取消刪除',
		         '已取消'
		       )
		     }
		   })	
	}



</script>