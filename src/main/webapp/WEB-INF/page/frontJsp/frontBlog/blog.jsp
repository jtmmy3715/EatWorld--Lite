<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<title>EatWorld Blog</title>
<%@include file="/resources/includes/frontHead.jsp"%>
</head>
<body>
	<div class="main-wrapper wrapper-2">
	<!--**********************************Header start**************************************-->
	<%@include file="/resources/includes/frontHeader.jsp"%>
	<!--**********************************Header end****************************************-->
		<div class="breadcrumb-area pt-95 pb-100 bg-img"
			style="background-image: url(<%=request.getContextPath()%>/resources/assets/images/bg/breadcrumb.jpg);">
			<div class="container">
				<div class="breadcrumb-content text-center">
					<div class="breadcrumb-title">
						<h2>部落格</h2>
					</div>
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active">blog</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="blog-area pt-100 pb-100">
			<div class="container">
			<!-- body -->
				<div class="row flex-row-reverse">
					<div class="col-lg-9">
					<!--文章-->
						<div class="row">
						
						<c:forEach var="postBean" items="${postBean}">
							<div class="col-lg-6 col-md-6" id="search_insert">
						
								<div class="blog-wrap mb-30">
									<div class="blog-img mb-15">
									
										<a href="javascript:void(0);" onclick="serch('${postBean.postId}');" id="serch"><img alt=""
											src="<%=request.getContextPath()%>/photo/${postBean.titlePhoto}" width="100" height="200"></a>
									</div>
									
									<div class="blog-content text-center">
									<!--
										<div class="blog-category">
										<!-- 文章標籤 
											<a href="javascript:void(0);">Fashion</a>
										</div>
									-->
										<h3>
											<a href="javascript:void(0);" onclick="serch('${postBean.postId}');" id="title">${postBean.title}</a>
										</h3>
										<div class="blog-meta">
											<a href="javascript:void(0);"><i class="la la-user"></i>${postBean.storeMember.sName}${postBean.clientMember.clientName}</a><a href="javascript:void(0);"><i
												class="la la-clock-o"></i><fmt:formatDate value="${postBean.postDate}" pattern="yyyy-MM-dd HH:mm:ss "/></a>
										</div>
										<div class="blog-meta">
											<a href="javascript:void(0);">瀏覽人數<i class="la la-child"></i>${postBean.countView}</a>
										</div>
										<div class="blog-btn">
											<a href="javascript:void(0);" onclick="serch('${postBean.postId}');" id="serch">read more</a>
										</div>
									</div>
									</div>
							
								</div>
								</c:forEach>
								
							</div>
						<!-- 分頁Bar -->
						<div
							class="pro-pagination-style text-center mt-20 pagination-mrg-xs-none">
							
							<ul>
							<c:if test="${postBean.size() > 0 }">
								<c:if test="${number > 0 }">
								<li><a class="prev" href="frontlistpost?page=${number-1}&size=${size}"><i
										class="la la-angle-left"></i></a></li>
								</c:if>
								<c:forEach begin="0" end="${totalPages-1}" var="page">
								<li><a class="active" href="frontlistpost?page=${page}&size=${size}">${page+1}</a></li>
								</c:forEach>
								
								<c:if test="${totalElements/size-number-1 > 0 }">
								<li><a class="next" href="frontlistpost?page=${number+1}&size=${size}"><i
										class="la la-angle-right"></i></a></li>
								 </c:if>
							   </c:if>
							</ul>
						</div>
					</div>
					<div class="col-lg-3">
					<!-- 左bar -->
						<div class="sidebar-style">
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">Search</h4>
								<div class="pro-sidebar-search mb-50 mt-25">
									<form class="pro-sidebar-search-form" action="frontlistpostkey" method="post">
										<input type="text" name="keyword" placeholder="Search here...">
										<button type="submit">
											<i class="la la-search"></i>
										</button>
									</form><p>${errorMsgMap.QueryError}</p>
								</div>
							</div>
							<!-- 標籤 -->
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">Categories</h4>
								<div class="sidebar-widget-list mt-20">
									<ul>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=1 id="check_box_1" name="postTag" onclick="postTag1();"><a href="javascript:void(0);" onclick="postTag1();">公告
													<span>${countTag1}</span>
												</a>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value="2" name="postTag" id="check_box_2" onclick="postTag2();"><a href="javascript:void(0);" onclick="postTag2();">新品
													<span>${countTag2}</span>
												</a>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value="3" name="postTag" id="check_box_3" onclick="postTag3();"><a href="javascript:void(0);" onclick="postTag3();">開幕
													<span>${countTag3}</span>
												</a>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value="4" name="postTag" id="check_box_4" onclick="postTag4();"><a href="javascript:void(0);" onclick="postTag4();">推廣
													<span>${countTag4}</span>
												</a>
											</div></li>
									</ul>
								</div>
							</div>
							<!-- 熱門文章 -->
							<div class="sidebar-widget mt-40">
								<h4 class="pro-sidebar-title">熱門文章</h4>
								<div class="sidebar-project-wrap mt-30">
								<c:forEach var="postTop" items="${postTop}">
									<div class="single-sidebar-blog">
										<div class="sidebar-blog-img">
											<a href="javascript:void(0);" onclick="serch('${postTop.postId}');" id="serch"><img src="<%=request.getContextPath()%>/photo/${postTop.titlePhoto}"
												alt=""></a>
										</div>
										<div class="sidebar-blog-content">
											<!--<span>Photography</span>-->
											<h4>
												<a href="javascript:void(0);" onclick="serch('${postTop.postId}');">${postTop.title}</a>
											</h4>
										</div>
									</div>
								</c:forEach>
									
									
								</div>
							</div>
							<div class="sidebar-widget mt-30">
								<h4 class="pro-sidebar-title">Archive</h4>
								<div class="sidebar-widget-archive mt-20">
									<ul>
										<li><a href="javascript:void(0);" onclick="postDate2022();">2022</a></li>
										<li><a href="javascript:void(0);"onclick="postDate2021();">2021</a></li>
										<li><a href="javascript:void(0);"onclick="postDate2020();">2020</a></li>
									</ul>
								</div>
							</div>
							<div class="sidebar-widget mt-50">
								<h4 class="pro-sidebar-title">Tag</h4>
								<div class="sidebar-widget-tag mt-25">
									<ul>
										<li><a href="javascript:void(0);" onclick="postTag1();">公告</a></li>
										<li><a href="javascript:void(0);" onclick="postTag2();">新品</a></li>
										<li><a href="javascript:void(0);" onclick="postTag3();">開幕</a></li>
										<li><a href="javascript:void(0);" onclick="postTag4();">推廣</a></li>
										<!--<li><a href="#">Fashion</a></li>  -->
									</ul>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/frontFooter.jsp"%>
		<!--**********************************Footer end****************************************-->
		
	</div>
	<!-- JS============================================ -->
	<!-- Modernizer JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
	<!-- jQuery JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/jquery-3.3.1.min.js"></script>
	<!-- Popper JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/bootstrap.min.js"></script>
	<!-- Slick Slider JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/countdown.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/counterup.js"></script>
	<!--<script src="assets/js/plugins/instafeed.js"></script>-->
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/jquery-ui-touch-punch.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/magnific-popup.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/owl-carousel.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/scrollup.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/waypoints.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/wow.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/slick.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/elevatezoom.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/sticky-sidebar.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/ajax-mail.js"></script>
	<!-- Main JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
	
	<script>
	$(document).ready(function() {
		getAllpost();
	});
	
	function serch(postId) {
	window.location.href ='<%=request.getContextPath()%>/frontBlog/serchPostForm/'+postId;
	}
	
	function postTag1(){
		window.location.href ='<%=request.getContextPath()%>/frontBlog/frontlistpost1';
	}
	
	function postTag2(){
		window.location.href ='<%=request.getContextPath()%>/frontBlog/frontlistpost2';
	}
	
	function postTag3(){
		window.location.href ='<%=request.getContextPath()%>/frontBlog/frontlistpost3';
	}
	
	function postTag4(){
		window.location.href ='<%=request.getContextPath()%>/frontBlog/frontlistpost4';
	}
	
	function postDate2022(){
		window.location.href ='<%=request.getContextPath()%>/frontBlog/frontlistpostDate22';
	}
	
	function postDate2021(){
		window.location.href ='<%=request.getContextPath()%>/frontBlog/frontlistpostDate21';
	}
	
	function postDate2020(){
		window.location.href ='<%=request.getContextPath()%>/frontBlog/frontlistpostDate20';
	}
	</script>
	
</body>
</html>