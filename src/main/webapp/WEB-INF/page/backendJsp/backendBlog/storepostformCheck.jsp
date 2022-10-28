<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% String path = request.getContextPath();%>

<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
</head>
<body>
	<!--**********************************Main wrapper start***********************************-->
	<div id="main-wrapper">
		<!--***********************Nav-header/Header/Nk-sidebar start***************************-->
		<%@include file="/resources/includes/store-navheader.jsp"%>
		<%@include file="/resources/includes/store-header.jsp"%>
		<%@include file="/resources/includes/store-sidebar.jsp"%>
		<!--***********************Nav-header/Header/Nk-sidebar End*****************************-->
		<!--**********************************Content body start********************************-->


		<!-- 這裡寫內容 -->




		<div class="content-body" style="min-height: 884px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">文章管理</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">審核表單</a></li>
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


									
									<!-- 修改表單 -->
									<c:if test="${postBean != null}">
										<h3 class="card-title">審核表單</h3>
										
									</c:if>
									<form id="form" name="form" class="form-valide"
										action="<%=request.getContextPath()%>/backendBlog/statePost" method="post">

									<input type="hidden" name="postId" value="<c:out value='${postBean.postId}'/>"/>
									<input type="hidden" name="postDate" value="<c:out value='${postBean.postDate}'/>"/>
									<input type="hidden" name="updateDate" value="<c:out value='${postBean.updateDate}'/>"/>
									<input type="hidden" name="countView" id="countView" value="<c:out value='${postBean.countView}'/>"/>

										<div class="form-group row">
											<label class="col-lg-4 col-form-label">文章標題
											</label>
											<div class="col-lg-6" id="title">
											<hr/>
											<input type="hidden" name="title" value="<c:out value='${postBean.title}'/>"/>
												${postBean.title}
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-lg-4 col-form-label">文章標題
											</label>
											<div class="col-lg-6" id="title">
											<hr/>
											<input type="hidden" name="title" value="<c:out value='${postBean.postTag}'/>"/>
												${postBean.postTag}
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-lg-4 col-form-label">標題圖片
											</label>
											<div class="col-lg-6">
											<hr/>
												<input type="hidden" name="titlePhoto" value="<c:out value='${postBean.titlePhoto}'/>"/>
												<img src="<%=request.getContextPath()%>/photo/${postBean.titlePhoto}" name="titlePhoto" width="130" height="130">
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-skill">內文
											</label>
											<div class="col-lg-6" >
											<hr/>
											<input type="hidden" name="postContent" value="<c:out value='${postBean.postContent}'/>"/>
												${postBean.postContent}
											</div>
										</div> 
										
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-skill">審核狀態
											</label>
											<div class="col-lg-6">
												
												<c:if test="${postBean.postState == 1}">
												審核中
												</c:if>
												<c:if test="${postBean.postState == 2}">
												審核成功
												</c:if>
												<c:if test="${postBean.postState == 3}">
												審核失敗
												</c:if>
												
											</div>
										</div> 




										<div class="form-group row">
											<div class="col-lg-8 ml-auto">
												<button type="button" class="btn btn-primary"
												onclick="cancel2();">返回</button>
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
	<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/resources/js/postform.js"></script>
	<!--**********************************Scripts end********************************************-->
	<script type="text/javascript">
	function cancel2() {
		window.location.href = '../storelistpost/${user.id}';
	}
	</script>
</body>
</html>
