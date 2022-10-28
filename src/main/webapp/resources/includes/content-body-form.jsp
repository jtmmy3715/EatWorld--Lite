<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--**********************************Content body start********************************-->

<div class="content-body" style="min-height: 884px;">

	<div class="row page-titles mx-0">

		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">管理</a></li>
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

							<!-- 新增表單 -->
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-username">資料名稱
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" name="dataname" placeholder="請填入資料">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-username">資料數量
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<select class="form-control" name="datanumber"
										id="peopleNumber">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-username">資料日期
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<input type="date" class="form-control" name="datadate">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-username">資料時間
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<input type="time" class="form-control" name="datatime">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-username">資料檔案
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<input type="file" class="form-control" name="datafile">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-8 ml-auto">
									<button type="submit" class="btn btn-primary">送出</button>
									<button type="button" class="btn btn-primary"
										onclick="cancel();">返回</button>
								</div>
							</div>
							
							
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