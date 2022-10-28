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
				<li class="breadcrumb-item active"><a href="javascript:void(0)">商品管理</a></li>
			</ol>
		</div>
	</div>

	
    <%!

    public void jspInit() {

    	System.out.println("formInit");

    }

    public void jspDestroy() {

        System.out.println("formDestroy");

    }%>




<!-- row -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">菜單管理</h4>
						<!-- 按鈕群組 -->
						<div class="d-grid gap-2 d-md-block">
						  <button class="btn btnProduct btnBigClass" type="button" value="0">全部</button>
						  <button class="btn btnProduct btnBigClass" type="button" value="1">上架商品</button>
						  <button class="btn btnProduct btnBigClass" type="button" value="2">下架商品</button>
						  <button class="btn btnProduct btnBigClass" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCategory"
						   aria-expanded="false" aria-controls="collapseCategory" value="3">商品分類</button>
						</div>
						<!-- 分類按鈕摺疊內容--> 
						<div class="collapse" id="collapseCategory">
						  <div class="card card-body">
						    <div class="d-grid gap-2 d-md-block" >
						    	<span id="span_classification">
							     <!--  
								  <button class="btn btnProduct" type="button">主食</button>-->
								  
							  	</span>
							  <button class="btnAdd btnAdd1" type="button"><i class="fa-regular fa-plus"></i></button>
							  <button class="btn btnEdit" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEdit"
						   		aria-expanded="false" aria-controls="collapseEdit" id="classification_edit"><i class="fa-solid fa-pen-to-square"></i></button>
							</div>
						  </div>
						</div>
						<!-- 修改按鈕的摺疊內容--> 
						<div class="collapse" id="collapseEdit">
						  <div class="card card-body">
						    <div class="d-grid gap-2 d-md-block">
						    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" id="select_classification">
								<option>請選擇修改的項目</option>

							</select>
							  	修改為:<input class="" type="text" placeholder="輸入空白為刪除" id="input_tx_classification"></button>
							  	<button class="btnEdit" type="button" value="btn_product_edit"data-bs-toggle="collapse" data-bs-target="#collapseEdit"
						   aria-expanded="false" aria-controls="collapseEdit" id="btn_edit_OK">送出 </button>
							</div>
						  </div>
						</div>
						

						
						<!--  
						<div class="cart">
            				<a class ="a1" href="#"><i class="fa-solid fa-cart-shopping"></i>購物車</a>
            				<a class ="a1" href="#"><i class="fa-solid fa-list"></i>訂單</a>
    					</div>
    					-->
						<div class="table-responsive">
							<table class="table table-bordered verticle-middle" id="table_id" width="100%">
								<thead>
									<tr>
										<th scope="col">相片</th>
										<th scope="col">名字</th>
										<th scope="col">內容</th>
										<th scope="col">價格</th>
										<th scope="col">現在庫存</th>
										<th scope="col">上架狀態</th>
										<th scope="col">每日銷售量</th>
										<th scope="col">商品觀看數</th>
										<th scope="col">
											<button type="button"
												class=" btn btn-sm btn-outline-secondary"
												onclick="insertProduct()">
												<i class="bi bi-patch-plus"></i>新增
											</button>
										</th>
									</tr>
								</thead>
								<tbody id="backend_product_display">

								</tbody>
							</table>

							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--  <form action="queryData" method="post" id="form_query_data">
	<input type="hidden" name="store_id" id="query_data_store_id">
	
	</form>-->	
	<!-- #/ container -->
	<!-- 內容結束 -->
</div>
<!--**********************************Content body end***********************************-->
	<script src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
	<script src="${pageContext.request.contextPath}/js/styleSwitcher.js">
	

	<script src="//cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	var product_id=0;
	
	$(function() {
		
		//點擊表格，更改商品頁面
		updateProductDetail();
		//顯示更新商品頁面
		updateProduct(0,0);
		//顯示所有分類
		showAllClassification();
		//傾聽分類按鈕
		listener_classification();
		//傾聽商品上架狀態
		onclickSoldStatus();

		
		
	})
	// 初始化datatable
	function initDataTable(){
		
		$('#table_id').DataTable({
			"destroy": true,
			"autoWidth": false,
			"columnDefs" : [ {
				"orderable" : false,
				"targets" : [ 0,5,8 ],   
				
			},{
			    targets: '_all',
			    "className": 'text-center'              
			}, {
			    targets: [2],
			    createdCell: function (td, cellData, rowData, row, col) {
			        $(td).css('width', '12%')
			    },
			},
			],
			
			language: {
			    "lengthMenu": "顯示 _MENU_ 筆資料",
			    "sProcessing": "處理中...",
			    "sZeroRecords": "没有匹配结果",
			    "sInfo": "目前有 _MAX_ 筆資料",
			    "sInfoEmpty": "目前共有 0 筆紀錄",
			    "sInfoFiltered": " ",
			    "sInfoPostFix": "",
			    "sSearch": "搜尋:",
			    "sUrl": "",
			    "sEmptyTable": "尚未有資料紀錄存在",
			    "sLoadingRecords": "載入資料中...",
			    "sInfoThousands": ",",
			    "oPaginate": {
			        "sFirst": "首頁",
			        "sPrevious": "上一頁",
			        "sNext": "下一頁",
			        "sLast": "末頁"
			     },
			     "order": [[0, "desc"]],
			     "oAria": {
			         "sSortAscending": ": 以升序排列此列",
			         "sSortDescending": ": 以降序排列此列"
			     }
			    },
			
			
		}); 
	}
	//顯示所有分類
	function showAllClassification(){
		$.getJSON({
			type:"POST",
			url:"/EatWorld/ProductController/getAllClassificationByStoreid",
			async:"true",
			success:function(data){
				var total=0;
				console.log("JQUERY讀取分類連線成功");
				console.log("分類大小"+data.length);
				//清空商品列表
				$('#span_classification').empty();
				$('#select_classification').empty();
				$.each(data, function (index, value) {
					console.log(value.name);
					//更新分類按鈕
			        $('#span_classification').append(
			                $('<button/>').addClass("btn btnProduct btnSmallClass")
			                .attr("type","button")
			                .attr('value',value.product_category_id)
			                .html(value.name)
			          )
			        //更新select選項
			        $('#select_classification').append(
			        	$('<option/>')
			        	.attr("value",value.product_category_id)
			        	.html(value.name)
			        		
			        )
			         
		        })

			},error:function(data){
				console.log("讀取分類失敗");
			}
		});
	}
	
	
	
	//傾聽增加分類按鈕
	$('.btnAdd1').on("click",function(){
		$.ajax({
			type:"POST",
			url:"/EatWorld/ProductController/insertClassification",
			async:"false",
			success:function(resopnse,status,xhr){
				console.log("JQUERY連線成功");
				console.log(xhr.status);
				console.log(xhr.readyState);
				//判斷新增是否成功
				if(xhr.readyState==4&&xhr.status==200){
					if(xhr.responseText=="ok"){
						console.log("新增至分類成功!");
						//更新分類
						showAllClassification();

					}else{
						console.log("新增分類失敗!");
						Swal.fire({
							  icon: 'error',
							  title: '新增失敗',
							  text: '請重新再試',
							
							})
					}
				}
				
			}
		});
		
	});
	function listener_classification(){
		/*傾聽分類按鈕
		*bigClass 大分類是全部，上架，下架，商品分類
		*smallClass 主食..使用者自定義
		*/
		let bigClass=0;
		let smallClass=0;
		
		$('.btnBigClass').on('click',function(){
			bigClass=$(this).val();
			console.log("大分類"+$(this).val());
			if(bigClass!=3){
				updateProduct(bigClass,smallClass)
			}
			
			
		});
		
		$('#span_classification').on('click','.btnSmallClass',function(){
			smallClass=$(this).val();
			console.log("小分類"+$(this).val());
			updateProduct(bigClass,smallClass)
		});
	}
	
	
	//清空修改的內容
	$('#classification_edit').click(function(){
		$("#input_tx_classification").val("");
	});
	
	//分類修改的送出按鈕
	$("#btn_edit_OK").click(function(){
		let classification_id=$("#select_classification").val();
		let name=$("#input_tx_classification").val();
		console.log("選項"+classification_id);
		console.log("輸入:"+name);
		$.ajax({
			type:"POST",
			url:"/EatWorld/ProductController/updateClassification",
			async:"true",
			data:"classification_id="+classification_id+"&name="+name,
			success:function(data){
			
				console.log("JQUERY修改分類連線成功");
				console.log("分類"+data.length);
				//清空分類列表重讀
				showAllClassification();

			},error:function(data){
				console.log("修改分類失敗");
			}
		});
		
	});
	/*
	 // 單選傾聽
	 function select_storeid(){
		let store_id=$("#select_id").val();
		let form=$(document.createElement('form')).css({display:'none'}).attr("method","post").attr("action","queryData");
		let eleStore=$(document.createElement('input')).attr('name','store_id').val(store_id);
		//let eleAction=$(document.createElement('input')).attr('name','action').val("query");
		form.append(eleStore);
		$("body").append(form);
		form.submit();
//		$('#query_data_store_id').val(store_id);
//		$('#form_query_data').submit();
		
	}
	*/
	function edit_photo(product_id){
		let file_name='null';
		$('.upload').each(function(){
			if($(this).val()!=""){
				file_name = $(this).val();
			}
		})
		let pos=file_name.lastIndexOf("\\");
		let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","editPhoto");
		let eleProduct=$(document.createElement('input')).attr('name','product_id').val(product_id);
		//let eleAction=$(document.createElement('input')).attr('name','action').val("edit_photo");
		let eleFileName=$(document.createElement('input')).attr('name','file_name').val(file_name.substring(pos+1));
		form.append(eleProduct).append(eleFileName);
		$("body").append(form);
		form.submit();
	}
	 //新增產品
	function insertProduct(){
		var list = [];
		var id_list = [];
		$(".productCheckBox").each(function() { //遍歷所有複選框
			if ($(this).prop('checked') == true) {
					list.push($(this).val());
					id_list.push($(this).prev("input").val());
			    }
			});
        console.log(list); //列印當前選中的複選框的值
		if(list.length>0){
			var text="";
			var table=document.getElementById('table_id');
			list.forEach(function (value) {
				text+=table.rows[value].cells[1].innerHTML;
				text+=",";
				console.log(text);
				
            })
			text = text.substring(0, text.length-1);
			var comboName = prompt("請輸入套餐名稱\n您選擇的內容:\n" + text);
			//新增為套餐
			if(comboName!=null){
				let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","insertCombo");
				let eleProduct=$(document.createElement('input')).attr('name','product_id').val(product_id);
				//let eleAction=$(document.createElement('input')).attr('name','action').val("insertCombo");
				let eleIdList=$(document.createElement('input')).attr('name','id_list').val(id_list);
				let eleComboName=$(document.createElement('input')).attr('name','comboName').val(comboName);
				form.append(eleProduct).append(eleIdList).append(eleComboName);
				$("body").append(form);
				form.submit();
			}
		}else{
			let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","gotoInsertJsp");
			let eleAction=$(document.createElement('input')).attr('name','action').val("insert");
			form.append(eleAction);
			$("body").append(form);
			form.submit();
			
		}

		
	}
	 
	 
	 // 編輯

	 function edit(index,tr_index,value){
		 
		 let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","editProduct");
		 let eleIndex=$(document.createElement('input')).attr('name','index').val(index);
		 //let eleAction=$(document.createElement('input')).attr('name','action').val("edit");
		 let eleTrIndex=$(document.createElement('input')).attr('name','tr_index').val(tr_index);
		 let eleValue=$(document.createElement('input')).attr('name','value').val(value);
		 form.append(eleIndex).append(eleTrIndex).append(eleValue);
		 $("body").append(form);
		 form.submit();
		 
	}
	 // 刪除商品
	 function delete_data(product_id){

	   swal.fire({
	     title: '確定刪除此商品嗎?',
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
	       	let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","deleteProduct");
			let eleProduct=$(document.createElement('input')).attr('name','product_id').val(product_id);
			//let eleAction=$(document.createElement('input')).attr('name','action').val("delete");
		 	form.append(eleProduct);
		 	$("body").append(form);
		 	form.submit();
	       
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

	 function updateProductDetail(){
		 $(document).on('click','.edit_td',function(event){ 
			 //td中已經有了input,則不需要響應點選事件
			 if($(this).children("input").length > 0) 
			 return false; 
			 var tdObj = $(this); 
			 var preText = tdObj.html().trim();
			 //得到當前文字內容 
			 var inputObj = $("<input type='text' />");
			 //建立一個文字框元素 
			 tdObj.html(""); //清空td中的所有元素 
			 inputObj 
			 .width(tdObj.width())
			 //設定文字框寬度與td相同 
			 .height(tdObj.height()) 
			 .css({border:"0px",fontSize:"17px"})
			 .val(preText) 
			 .appendTo(tdObj)
			 //把建立的文字框插入到tdObj子節點的最後
			 .trigger("focus")
			 //用trigger方法觸發事件 
			 .trigger("select"); 
			 inputObj.keyup(function(event){ 
			 var tr_index = tdObj.parent().index();
			 var index = tdObj.index();
			 if(13 == event.which)
			 { 
				 var text = $(this).val(); 
				 tdObj.html(text);
				 edit(index,tr_index,text);

			 } 
			 else if(27 == event.which)
			 //ESC鍵 
			 { 
			 	tdObj.html(preText+tdSeq+trSeq); 
			 } 
			 }); 
			 //已進入編輯狀態後，不再處理click事件 
			 inputObj.click(function(){ 
			 return false; 
		 }); 
		}); 
	 }
	 //category大分類(全部，上架，下架，商品分類)
	 //product_category商品細項分類(主食，飲料，小菜等..)
		function updateProduct(category,product_category){
			//更新商品顯示
			$.getJSON({
				type:"GET",
				url:"/EatWorld/ProductController/getCategoryDataByStoreid",
				async:"true",
				data:"category="+category+"&product_category="+product_category,
				success:function(data){
					$('#table_id').DataTable().destroy();
					console.log("JQUERY讀取商品連線成功");
					console.log("商品:"+data.length);
					//清空商品列表
					updateProductHTML(data)
			        initDataTable();
			        

				},error:function(data){
					console.log("讀取商品失敗");
				}
			});
		}
	 
	 
	 function updateProductHTML(data){
			$('#backend_product_display').empty();
			
			
			$.each(data, function (index, value) {
				if(value.sold==0){
					var sold_html="<button value='0' class='btn btn_sold_status btn_start_sold' name='"+value.product_id+"'>開始上架</button>"; 
				}else{
					var sold_html="<button value='1' class='btn btn_sold_status btn_cancel_sold' name='"+value.product_id+"'>取消上架</button>"; 
				}
					
			       $('#backend_product_display').append(
			               $('<tr/>')
			                   .append(
			                       $('<td/>')
			                       	.addClass('')
			                           .append(
			                        		$("<div/>")
			                        		.css("height","130")
			                        		.css("width","150")
			                        		.append(
			                        				$('<img/>')
					                                   .attr('src', '/EatWorld/photo/' + value.photo)
					                                   .css("height", '80%')
					                                   .css("width", '80%')
					                           )
			                        		)
			                        		
			                               
			                   )
			                   .append(
			                       $('<td/>').addClass('edit_td')
			                           .text(value.name)
			                   )
			                   .append(
			                       $('<td/>').addClass('edit_td')
			                           .text(value.content)
			                   )
			                   .append(
			                       $('<td/>').addClass('edit_td')
			                           .text(value.price)
			                   )
			                   .append(
			                       $('<td/>').addClass('edit_td')
			                           .text(value.inventory)
			                   )
			                   .append(
			                       $('<td/>')
			                       	.html(sold_html)
			                           //.text(value.sold)
			                   )
			                   .append(
			                       $('<td/>')
			                           .text(value.count_sale)
			                   )
			                   .append(
			                       $('<td/>')
			                           .text(value.count_view)
			                   )
			                   .append(
			                       $('<td/>')
			                           .append(
			                               $('<span/>')
			                                   .append(
			                                       $('<label/>').addClass('btn fa-regular fa-image')
			                                       .addClass('btn-info')
			                                           .append(
			                                               $('<input/>').addClass('upload ')
			                                                   .css('display','none')
			                                                   .attr('type', 'file')
			                                                   .attr('onchange', 'edit_photo(' + value.product_id + ')')
			                                                   
			                                           )
			                                   )
			                                   .append(
			                                		$('<a/>').addClass('btn fa fa-close color-danger')
			                                           .attr("href", "#")
			                                           .attr('onclick', 'delete_data(' + value.product_id + ')')
			                                           .attr('data-toggle', "button")
			                                           .attr("data-placement", "top")
			                                           .attr("title", "刪除")
			                                   )
			                                   .append(
			                                       $('<input/>')
			                                           .attr('type', 'hidden')
			                                           .attr('value', value.product_id)
			                                   )
			                                   
			                           )
			                   )

			           )
				

	        })
	 }
	 /*
	//商品上架
	function sold_up(product_id){
		$.ajax({
			type:"POST",
			url:"/EatWorld/ProductController/updateSoldStatus",
			async:"true",
			data:"product_id="+product_id+"&sold=1",
			success:function(resopnse,status,xhr){
				console.log("JQUERY連線成功");
				
				//判斷新增是否成功
				if(xhr.readyState==4&&xhr.status==200){
					if(xhr.responseText=="ok"){
						Swal.fire({
							  icon: 'success',
							  title: '更改上架成功',
							})
						//更新商品
						

					}else{
						console.log("更改上架失敗!");
						Swal.fire({
							  icon: 'error',
							  title: '更改上架失敗',
							  text: '請重新再試',
							
							})
					}
				}
				
			}
		});
		
	}
	//商品下架
	function sold_down(product_id){
		$.ajax({
			type:"POST",
			url:"/EatWorld/ProductController/updateSoldStatus",
			async:"true",
			data:"product_id="+product_id+"&sold=0",
			success:function(resopnse,status,xhr){
				console.log("JQUERY連線成功");
				
				//判斷新增是否成功
				if(xhr.readyState==4&&xhr.status==200){
					if(xhr.responseText=="ok"){
						Swal.fire({
							  icon: 'success',
							  title: '更改下架成功',
							})
						//更新商品
							

					}else{
						console.log("更改下架失敗!");
						Swal.fire({
							  icon: 'error',
							  title: '更改下架失敗',
							  text: '請重新再試',
							
							})
					}
				}
				
			}
		});
	}*/
	function onclickSoldStatus(){
		$(document).on("click",".btn_sold_status",function(){
			let sold_status =$(this).val();
			let product_id = $(this).attr("name")
			if(sold_status==0){
				//將商品上架
				$(this).val('1');
				$(this).css('background-color',"#FF5151");
				$(this).css('border',"2px #FF5151 solid");
				$(this).html("取消上架");
				$.ajax({
					type:"POST",
					url:"/EatWorld/ProductController/updateSoldStatus",
					async:"true",
					data:"product_id="+product_id+"&sold=1",
					success:function(resopnse,status,xhr){
						console.log("JQUERY連線成功");
						
						//判斷新增是否成功
						if(xhr.readyState==4&&xhr.status==200){
							if(xhr.responseText=="ok"){
								Swal.fire({
									  icon: 'success',
									  title: '更改上架成功',
									})
								//更新商品
								

							}else{
								console.log("更改上架失敗!");
								Swal.fire({
									  icon: 'error',
									  title: '更改上架失敗',
									  text: '請重新再試',
									
									})
							}
						}
						
					}
				});
				
				
			}else{
				//將商品下架
				$(this).val('0');
				$(this).css('background-color',"#7571F9");
				$(this).css('border',"2px #7571F9 solid");
				$(this).html("開始上架");
				$.ajax({
					type:"POST",
					url:"/EatWorld/ProductController/updateSoldStatus",
					async:"true",
					data:"product_id="+product_id+"&sold=0",
					success:function(resopnse,status,xhr){
						console.log("JQUERY連線成功");
						
						//判斷新增是否成功
						if(xhr.readyState==4&&xhr.status==200){
							if(xhr.responseText=="ok"){
								Swal.fire({
									  icon: 'success',
									  title: '更改下架成功',
									})
								//更新商品
									

							}else{
								console.log("更改下架失敗!");
								Swal.fire({
									  icon: 'error',
									  title: '更改下架失敗',
									  text: '請重新再試',
									
									})
							}
						}
						
					}
				});
				
				
			}
		});
	}
	
</script>