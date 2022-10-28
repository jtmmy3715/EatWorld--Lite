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
									<input type="hidden" name="clientMember" value="<c:out value='${postBean.clientMember.clientId}'/>"/>
									<input type="hidden" name="storeMember" value="<c:out value='${postBean.storeMember.id}'/>"/>
									
									<div id="inuptform">

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
											<label class="col-lg-4 col-form-label" for="val-skill">文章分類
											</label>
											<div class="col-lg-6">
											<select class="form-control" name="postTag" id="postTag">
												<option value="${postBean.postTag}">
												<c:if test="${postBean.postTag == null}">
												未分類
												</c:if>
												<c:if test="${postBean.postTag == 1}">
												公告
												</c:if>
												<c:if test="${postBean.postTag == 2}">
												新品
												</c:if>
												<c:if test="${postBean.postTag == 3}">
												開幕
												</c:if>
												<c:if test="${postBean.postTag == 4}">
												推廣
												</c:if>
												</option>
												<option value="1">公告</option>
												<option value="2">新品</option>
												<option value="3">開幕</option>
												<option value="3">推廣</option>
											</select>
											</div>
										</div> 
										
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-skill">審核狀態
											</label>
											<div class="col-lg-6">
											<select class="form-control" name="postState" id="postState">
												<option value="${postBean.postState}">
												<c:if test="${postBean.postState == 1}">
												審核中
												</c:if>
												<c:if test="${postBean.postState == 2}">
												審核成功
												</c:if>
												<c:if test="${postBean.postState == 3}">
												審核失敗
												</c:if>
												</option>
												<option value="1">審核中</option>
												<option value="2">審核成功</option>
												<option value="3">審核失敗</option>
											</select>
											</div>
										</div> 
										
										
										
										
									</div>




										<div class="form-group row">
											<div class="col-lg-8 ml-auto">
												<button id="oneClickEnter" type="button"
													class="btn btn-info" onclick="oneok1()" id="oneok1">一鍵輸入</button>
												<button id="form_button_submit" type="submit"
													 class="btn btn-primary">送出</button>
												<button type="button" class="btn btn-primary"
												onclick="cancel();">返回</button>
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
	
	 $(function () {
         $('#postState').change(function () {
        	 var state = $('#postState').val();;
        	 console.log(state);
        	 if(state==3){
        	 	statepost();
        	 }
         })
         
	 })
	 function statepost() {
             let content = `
            	 <div class="form-group row">
					<label class="col-lg-4 col-form-label">失敗原因
					</label>
					<div class="col-lg-6" id="errmsg">
					<input type="text" name="msg" id="msg" size="80" />
					</div>
				</div>
                         `
             $('#inuptform').append(content)
         }
	</script>
	
</body>
</html>
