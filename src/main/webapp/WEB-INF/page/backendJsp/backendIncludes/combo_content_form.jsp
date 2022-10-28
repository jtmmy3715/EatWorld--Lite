<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--**********************************Content body start********************************-->

<div class="content-body" style="min-height: 884px;">

	<div class="row page-titles mx-0">

		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">菜單管理</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">新增表單</a></li>
			</ol>
		</div>
	</div>


	<!-- row -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="form-validation">

							<!-- action -->
							<FORM ACTION="insertCombo" method="post" enctype="multipart/form-data" id="id_combo_submit">
								<!-- 新增表單 -->
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">套餐名稱
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control"
											name="combo_name" placeholder="請填入商品名稱" required id="id_input_combo_name">
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">套餐價格
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
									<input type="text" class="form-control"
											name="combo_price" required id="id_input_combo_price">
									</div>
								</div>

								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">套餐商品
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<!-- Button trigger modal -->	
										<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#productModal"
										onclick="getAllProduct();">選擇商品</button>
										
										<ol id="id_show_chosen"></ol>
									</div>
									<input type="hidden" name="combo_product_list" id="id_combo_product_list" />
								</div>


						
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">商品照片
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="file" class="form-control"
											name="combo_datafile" id="input_combo_file" required>
										<img id="id_show_photo" src="" alt="您選的圖片" style="display: none;width: 250px;height:200px">
									</div>

								</div>
								<div class="form-group row">
									<div class="col-lg-8 ml-auto">
										<button type="submit" class="btn btn-primary"
											name="product_submit" value = "insert_form" >送出</button>
										<button type="button" class="btn btn-primary"
											onclick="cancel();">返回</button>
										<button type="button" class="btn btn-primary"
											onclick="combo_one_input();">一鍵輸入</button>
									</div>
								</div>
							</FORM>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- #/ container -->
	<!-- 內容結束 -->


<!-- Modal -->
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="comboModalLabel">商品細項</h3>
      	
      </div>
      <!-- 被選擇的商品 -->
      <div class="modal-body">
      	
      	<div id="id_show_combo_product">
      	<!-- Jquery動態新增被選擇商品 -->
      	</div>
      	</hr>
      	<div id="id_total_combo_product">
      		
      	</div>
      	<button class="btnDelete" id="btn_delete_combo_product" type="button"><i class="fa-solid fa-trash"></i></button>
      </div>
      <div class="modal-body" id="id_combo_modal">
      <!-- Jquery動態新增商品 -->
      
      <!--  
        <hr/>
        <button class="btn btnComboProductAdd"><i class="fa-solid fa-plus"></i></button>
        
        <span>主食</span>
        <hr/>
        <span>飲料</span>
        -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
        <button type="button" class="btn btn-primary" id="btn_combo_product_OK" data-bs-dismiss="modal">確定</button>
      </div>
    </div>
  </div>
</div>
	
</div>
<!--**********************************Content body end***********************************-->
<script>
$(function(){
	var list=[];
	var list_name=[];
	var list_price=[];
	var total = 0;
	//預覽圖片
	viewPhoto();
	//傾聽新增按鈕
	$(document).on('click','.btnComboProductAdd',function(){
		
		var product_id = $(this).val();
		var product_name = $(this).attr('name');
		var price =$(this).closest('div').find('#id_input_hidden_price').val();
		total+=parseInt(price);
		$('#id_show_combo_product').append(
			$('<div/>')
				.html('&ensp;'+'&ensp;'+product_name)
				.append(
					$('<span/>').html('&ensp;'+'$'+price)
						
				)
		)
		$('#id_total_combo_product').html('&ensp;'+'&ensp;'+'總金額'+'&ensp;'+'$'+total+'元');
		list.push(product_id);
		list_name.push(product_name);
		list_price.push(price);
		console.log(list);
	});
	
	
	$('#id_combo_submit').submit(function(){
		
		$('#id_combo_product_list').val(list);
		if($('#id_combo_product_list').val()!=""){
			console.log('true');
			return true;
		}else{
			console.log('false');
			swal.fire(
			         '錯誤!',
			         '請選擇套餐商品',
			         'error'
			       )
			return false
		}
	});
			
			
			
	$('#btn_delete_combo_product').click(function(){
		list.length=0;
		list_name.length=0;
		list_price.length=0;
		$('#id_show_combo_product').empty();
		$('#id_show_chosen').empty();
		total = 0;
		$('#id_total_combo_product').html('');
	});
	$('#btn_combo_product_OK').click(function(){
		//清空列表
		$('#id_show_chosen').empty();
		if(list_name.length!=0){
			//var text="";
			//顯示在comboform商品頁
			$.each(list_name,function(index,name){
				//text += "<li>"+name+"</li>";
				$('#id_show_chosen').append(
						$('<li/>')
						.html(name+'&ensp;'+'$'+list_price[index])
					)
			});
			//text+="<li>"+'總金額'+total+'元</li>';
			$('#id_show_chosen').append(
					$('<li/>')
					.html('總金額'+'&ensp;'+'$'+total+'元')
				)
			/*
			$('#id_show_chosen').append(
					$('<div/>')
					.html(text)
				)
				*/
		}

	});
	
	
	//getAllProduct();
	
})
function getAllProduct(){

	//讀全部商品
	$.getJSON({
	    type:"GET",
	    url:"/EatWorld/ProductController/getCategoryDataByStoreid",
	    async:"true",
	    data:"category=0"+"&product_category=0",
	    success:function(data){
	    
	     console.log("JQUERY讀取商品連線成功");
	     console.log("商品"+data.length);
	     //清空商品列表，JQUERY在外取得完才能用
	    	$('#id_combo_modal').empty();
			$.each(data, function (index, value) {

				$('#id_combo_modal').append(
			    	                $('<hr/>')
			    	            )
			    	            .append($('<div/>')
		    	            		.append(
					    	            	$('<input/>').attr('id','id_input_hidden_price')
					    	            	.attr('type','hidden')
					    	            	.attr('value',value.price)
					    	            )
					    	            .append(
					    	            	$('<button/>').addClass('btn btnComboProductAdd fa-solid fa-plus')
					    	            	.attr('value',value.product_id)
					    	            	.attr('name',value.name)
					    	            )
					    	            .append(
					    	            	$('<spen/>').html('&ensp;'+value.name)		
					    	            )
					    	            .append(
					    	            	$('<spen/>')
					    	            	.html('&ensp;'+'$'+'&ensp;'+value.price)		
					    	            )
			    	            	
			    	            )
			    	            
	        })

	     
	           

	    },error:function(data){
	     console.log("讀取套餐商品失敗");
	    }
	   });
	
}

//預覽圖片
function viewPhoto(){
	$('#input_combo_file').change(function(e){
		console.log('2233');
		//將上傳檔案轉換為base64字串
		  let file = this.files[0];
		//建立FileReader物件
		  let fr = new FileReader();
		
		  fr.onload = function (e) {
			  
		    $('#id_show_photo').attr('src', e.target.result);//讀取的结果放入圖片
		    $('#id_show_photo').show();
		  };
		      
		  // 使用 readAsDataURL 將圖片轉成 Base64
		  fr.readAsDataURL(file);
	})
	
}

function combo_one_input(){
	$('#id_input_combo_name').val('三人划算套餐');
	
	$('#id_input_combo_price').val('520');
}

function cancel(){
	history.back();
}

</script>