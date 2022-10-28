<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String path = request.getContextPath();%>

<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/postform.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/editor/ckeditor/ckeditor.js"></script>
<style>
textarea{
resize:none
}
#cke_editor1{
width:100%;
height:100%;
}

.cke_inner.cke_reset{
height:100%;
}

</style>

</head>
<body>
	<!--**********************************Main wrapper start***********************************-->
	<div id="main-wrapper">
		<!--***********************Nav-header/Header/Nk-sidebar start***************************-->
		<%@include file="/resources/includes/nav-header.jsp"%>
		<%@include file="/resources/includes/header.jsp"%>
		<%@include file="/resources/includes/nk-sidebar.jsp"%>
		<!--***********************Nav-header/Header/Nk-sidebar End*****************************-->
		<!--**********************************Content body start********************************-->


		<!-- 這裡寫內容 -->




		<div class="content-body" style="min-height: 884px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">文章管理</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">新增表單</a></li>
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


									<!-- 標題行 -->
										<h4 class="card-title">新增表單</h4>
								
										

									<!-- form:action -->

									<form action="savePost" method="post" enctype="multipart/form-data" class="form-valide" name="form" id="form">
									
									<input type="hidden" name="postId" id="postId" value="<c:out value='${postBean.postId}'/>"/>
									
									<c:if test="${not empty user.clientId}">
									<input type="hidden" name="clientMember" id="clientMember" value="${user.clientId}"/>
									</c:if>
									
									<c:if test="${not empty user.id}">
									<input type="hidden" name="storeMember" id="storeMember" value="${user.id}"/>
									</c:if>
									
										<div class="form-group row">
											<label class="col-lg-4 col-form-label">文章標題
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<input type="text" name="title" id="title"/>
												
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-lg-4 col-form-label">標題圖片
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<input type="file" class="form-control" id="titlePhoto" name="myFile"/>
											</div>
										</div>
										
										
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-skill">內文
												<span class="text-danger">*</span>
											</label>
										</div>
										<div class="form-group row" style="height: 800px">
												<textarea id="editor1" name="postContent">
												</textarea>
										</div>
									   
									   <script>
							                // Replace the <textarea id="editor1"> with a CKEditor
							                // instance, using default configuration.
							                CKEDITOR.replace( 'editor1' ,{ height: '90%', width: '100%' });
							                CKEDITOR.instances.editor1.setData(null) ;
							                
							           </script>

										<div class="form-group row">
											<div class="col-lg-8 ml-auto">
												<button id="oneClickEnter" type="button"
													class="btn btn-info" onclick="oneok()" id="oneok">一鍵輸入</button>
												<button id="form_button_submit" type="button"
												onclick="add();" class="btn btn-primary" name="form_button_submit">送出</button>
												<button type="button" class="btn btn-primary"
												onclick="cancel1();">返回</button>
											</div>

										</div>


									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #/ container -->



		</div>
		<!--**********************************Content body end***********************************-->

		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/footer.jsp"%>
		<!--**********************************Footer end****************************************-->
	</div>
	<!--**********************************Main wrapper end**************************************-->
	<!--**********************************Scripts***********************************************-->
	<%@include file="/resources/includes/javascript.jsp"%>
	
	<!--**********************************Scripts end********************************************-->
	
	
</body>
 
</html>
