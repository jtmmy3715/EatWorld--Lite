<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
%>
<%@ page isELIgnored="false" %>
<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<title>文章管理</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
		<div class="content-body" style="min-height: 884px;">




			<!-- 這裡寫內容 -->




			<div class="row page-titles mx-0">

				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">部落格管理</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">文章管理</a></li>
					</ol>
				</div>
			</div>




			<!-- row -->


			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<c:if test="${user.clientPermission==2}">
								<h4 class="card-title">
									文章管理
								</h4>
								<div style="float:left;">
						             <input type="button" value="Add Post"
											onclick="window.location.href='addPostForm'; return false;"
											class="btn btn-primary" /> <br />
					            </div>
					            <div style="float:right;">
					            <input type="button" value="審核中 ${countstate1}"
											onclick="window.location.href = '<%=request.getContextPath()%>/backendBlog/liststatepost/'+${postState=1};"
											class="btn btn-primary" /> <br />
					            </div>
					            <div style="float:right;">
								<input type="button" value="審核成功 ${countstate2}"
											onclick="window.location.href = '<%=request.getContextPath()%>/backendBlog/liststatepost/'+${postState=2};"
											class="btn btn-primary" /> <br />
					            </div>
					            <div style="float:right;">
								<input type="button" value="審核失敗 ${countstate3}"
											onclick="window.location.href = '<%=request.getContextPath()%>/backendBlog/liststatepost/'+${postState=3};"
											class="btn btn-primary" /> <br />
					            </div>
					            
								<div class="table-responsive">
									<table class="table table-bordered verticle-middle"
										id="table_id" style="text-align: center">
									
										


										<thead>
											<tr>
												<th scope="col">文章編號</th>
												<th scope="col">標題</th>
												<th scope="col">標題圖片</th>
												<th scope="col">發文日期</th>
												<th scope="col">更新日期</th>
												<th scope="col">審核狀態</th>


												<th scope="col">Action</th>
											</tr>


										</thead>
										<tbody>
										<!-- Loop Start -->
										<c:forEach var="postBean" items="${postBean}">
										
												<tr>
													<td id="postId"><c:out value="${postBean.postId}" /></td>
													<td><c:out value="${postBean.title}" /></td>
													<td><img src="<%=request.getContextPath()%>/photo/${postBean.titlePhoto}" width="130" height="130"></td>
													<td><fmt:formatDate value="${postBean.postDate}" pattern="yyyy-MM-dd HH:mm:ss "/></td>
													<td><fmt:formatDate value="${postBean.updateDate}" pattern="yyyy-MM-dd HH:mm:ss "/></td>
													<td>
													<c:if test="${postBean.postState == 1}">
													<button type="button" class="btn btn-primary" 
													onclick="check('${postBean.postId}');" id="check">審核中
													</button>
													</c:if>
													<c:if test="${postBean.postState == 2}">
													<button type="button" class="btn btn-primary" style="background-color:green"
													onclick="checkok('${postBean.postId}');" id="check">審核成功
													</button>
													</c:if>
													<c:if test="${postBean.postState == 3}">
													<button type="button" class="btn btn-primary" style="background-color:red"
													onclick="check('${postBean.postId}');" id="check">審核失敗
													</button>
													</c:if>
													</td>
													
													<td align="center"><span> 
												
													<a href="#" data-toggle="button" data-placement="top" title="修改">
																<i class="fa fa-pencil color-muted m-r-5"
																onclick="edit('${postBean.postId}');" id="edit"></i>
														</a> 
														<a href="#" data-toggle="button" data-placement="top"
															title="刪除"> <i class="fa fa-close color-danger"
																onclick="delete_data('${postBean.postId}');"
																id="delete_data"></i></a>
													
													</span></td>


												</tr>
											</c:forEach>
											<!-- Loop End -->
										</tbody>
									</table>
								</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- #/ container -->



			<!-- 內容結束 -->




		</div>
		<!--**********************************Content body end***********************************-->
	</div>
	<!--**********************************Main wrapper end***************************************-->
	<!--**********************************Footer start*******************************************-->
	<%@include file="/resources/includes/footer.jsp"%>
	<!--**********************************Footer end*********************************************-->
	<!--**********************************Scripts************************************************-->
	<%@include file="/resources/includes/javascript.jsp"%>
	
	<!-- js -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/postlist.js"></script>
	
	
 	

	<!--**********************************Scripts end********************************************-->
</body>
</html>