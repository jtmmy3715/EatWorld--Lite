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
											name="product_name" placeholder="請填入商品名稱" required>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username" >商品內容
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
									<textarea rows="10" cols="30" class="form-control" name="product_content" required>請輸入商品資訊</textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">商品價格
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
									<input type="text" class="form-control"
											name="product_price">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">商品每日限量
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
									<input type="text" class="form-control"
											name="product_inventory" required>
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
											id="smllClass">
											
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
											name="product_datafile">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-8 ml-auto">
										<button type="submit" class="btn btn-primary"
											name="product_submit" value = "insert_form">送出</button>
										<button type="button" class="btn btn-primary"
											onclick="cancel();">返回</button>
									</div>
								</div>
							</FORM>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- #/ container -->
	<!-- 內容結束 -->

<!--**********************************Content body end***********************************-->