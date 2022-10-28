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
							<FORM ACTION="gotoProductInsert" method="post" enctype="multipart/form-data">
								<!-- 新增表單 -->
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">商品名稱
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control"
											name="product_name" placeholder="請填入商品名稱" required id="id_product_name">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username" >商品內容
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
									<textarea rows="10" cols="30" class="form-control" name="product_content" required id="id_product_content">請輸入商品資訊</textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">商品價格
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
									<input type="text" class="form-control"
											name="product_price" id="id_product_price">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">商品每日限量
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
									<input type="text" class="form-control"
											name="product_inventory" required id="id_product_inventory">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">商品上架
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<select class="form-control" name="product_sold"
											id="product_sold">
											<option value="0">未上架</option>
											<option value="1">上架</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">商品小分類
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<select class="form-control" name="product_small_classification"
											id="smallClass">
											
											<c:forEach var="classification" items="${sessionScope.classificationList}" varStatus="loop">
												<option value="${classification.product_category_id}">${classification.name}</option>
											</c:forEach>
											<!--  
											<option value="0">主食</option>
											<option value="1">點心</option>
											<option value="2">飲料</option>-->
										</select>
									</div>
								</div>
								<!--  
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">商家
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<select class="form-control" name="store_id">
											<option value="1">好吃火鍋</option>
											<option value="2">永川牛肉麵</option>
											<option value="3">麥味登</option>
										</select>
									</div>
								</div>
						-->
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">商品照片
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="file" class="form-control"
											name="product_datafile" id="input_product_file">
										<img id="id_product_show_photo" src="" alt="您選的圖片" style="display: none;width: 250px;height:200px">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-8 ml-auto">
										<button type="submit" class="btn btn-primary"
											name="product_submit" value = "insert_form">送出</button>
										<button type="button" class="btn btn-primary"
											onclick="cancel();">返回</button>
										<button type="button" class="btn btn-primary" onclick="oneInput();">一鍵輸入</button>
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
</div>
<!--**********************************Content body end***********************************-->
<script>

$(function(){
	viewPhoto();
})

function oneInput(){
	$('#id_product_name').val('來來牛肉麵');
	$('#id_product_content').val('來喔，好吃的牛肉麵，牛肉一塊，加量加價，打卡送湯');
	$('#id_product_inventory').val('650');
	$('#id_product_price').val('300');
}

function cancel(){
	history.back();
}
//預覽圖片
function viewPhoto(){
	$('#input_product_file').change(function(e){
		console.log('2233');
		//將上傳檔案轉換為base64字串
		  let file = this.files[0];
		//建立FileReader物件
		  let fr = new FileReader();
		
		  fr.onload = function (e) {
			  
		    $('#id_product_show_photo').attr('src', e.target.result);//讀取的结果放入圖片
		    $('#id_product_show_photo').show();
		  };
		      
		  // 使用 readAsDataURL 將圖片轉成 Base64
		  fr.readAsDataURL(file);
	})
	
}

</script>