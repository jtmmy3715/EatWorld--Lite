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
						<li class="active">blog details</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="blog-area pt-100 pb-100">
			<div class="container">
				<div class="row flex-row-reverse">
				<!-- 文章 -->
					<div class="col-lg-9">
						<div class="blog-details-wrapper ml-20">
							<div class="blog-details-top">
							<!-- 文章圖片 -->
								<div class="blog-details-img mb-20">
									<img alt="" src="<%=request.getContextPath()%>/photo/${postBean.titlePhoto}" height="300">
								</div>
								<div class="blog-details-content">
								<!-- 文章標籤 
									<span>Fashion</span>
								-->
									<h3>${postBean.title}</h3>
									<div class="blog-dec-meta">
									<!-- 文章作者+時間 -->
										<span><i class="la la-user"></i>${postBean.storeMember.sName}${postBean.clientMember.clientName}</span><span><i
											class="la la-clock-o"></i>${postBean.postDate}</span>
									</div>
									<div>
										${postBean.postContent}
									</div>
								</div>
							</div>
							<!-- 前一篇or後一篇文章按鈕 
							<div class="next-previous-post mt-50">
								<a href="javascript:void(0);"><i class="la la-angle-left"></i>prev post</a><a
									href="javascript:void(0);">next post <i class="la la-angle-right"></i></a>
							</div>
							-->
							<!-- 回覆的內文 -->
							<div class="blog-comment-wrapper mt-55" >
								<h4 class="blog-dec-title">comments : ${countpcommit}</h4>
								<c:forEach var="pcommitBean" items="${pcommitBean}">
								<div class="single-comment-wrapper mt-35" style="border-radius:20px;border:1px solid #666;padding:10px">
									<div class="blog-comment-img">
										<img src="<%=request.getContextPath()%>/photo/${pcommitBean.clientMember.clientMemberDetail.clientLogo}" alt="">
										<img src="<%=request.getContextPath()%>/photo/${pcommitBean.storeMember.sLogo}" alt="">
									</div>
									<div class="blog-comment-content">
										<h4>${pcommitBean.clientMember.clientName}</h4>
										<h4>${pcommitBean.storeMember.sName}</h4>
										<span><fmt:formatDate value="${pcommitBean.commitDate}" pattern="yyyy-MM-dd HH:mm:ss "/></span>
										<p>
										${pcommitBean.commitContent}
										</p>
										<div class="blog-details-btn">
											<c:if test="${user != null}">
											<a href="javascript:void(0);" onclick="recommit();" id="reply">reply</a>
												
												<c:if test="${user.id == pcommitBean.storeMember.id && user.clientId == pcommitBean.clientMember.clientId}">
													<a href="javascript:void(0);" onclick="delcommit(${pcommitBean.postcommitId});">刪除</a>
												</c:if>
											
											</c:if>
										</div>
									</div>
								</div>
									<div id="inputcomment"></div>
								
								</c:forEach>	
								<!--  巢狀 -->
								<c:forEach var="recommitBean" items="${recommitBean}">
								<div class="single-comment-wrapper ml-120 mt-50"  style="border-radius:20px;border:1px solid #666;padding:10px">
									<div class="blog-comment-img">
										<img src="<%=request.getContextPath()%>/photo/${recommitBean.clientMember.clientMemberDetail.clientLogo}" alt="">
										<img src="<%=request.getContextPath()%>/photo/${recommitBean.storeMember.sLogo}" alt="">
									</div>
									<div class="blog-comment-content">
										<h4>${recommitBean.clientMember.clientName}</h4>
										<h4>${recommitBean.storeMember.sName}</h4>
										<span><fmt:formatDate value="${recommitBean.commitDate}" pattern="yyyy-MM-dd HH:mm:ss "/></span>
										<p>
										${recommitBean.commitContent}
										</p>
										<div class="blog-details-btn">
											<c:if test="${user != null}">
											<a href="javascript:void(0);" onclick="recommit2();" id="reply">reply</a>
												
												<c:if test="${user.id == recommitBean.storeMember.id && user.clientId == recommitBean.clientMember.clientId}">
													<a href="javascript:void(0);" onclick="delcommit(${recommitBean.postcommitId});">刪除</a>
												</c:if>
											
											</c:if>
										</div>
									</div>
								</div>
								</c:forEach>	
								<div id="inputcomment2"></div>
							</div>
							<!-- 回覆區塊 -->
							<div class="blog-reply-wrapper mt-50">
								<h4 class="blog-dec-title">回覆</h4>
							<c:if test="${user == null}">
							<div class="d-grid gap-3 col-sm-auto">
								<button class="btn btn-danger" type="button" onclick="login();">請登入</button>
							</div>
							</c:if>
							<c:if test="${user != null}">
								<form class="blog-form" action="<%=request.getContextPath()%>/frontBlog/commitsave" method="post">
									<div class="row">
										<div class="col-md-6">
										
											<div class="leave-form">
												<input type="hidden" name="postId" id="postId" value="${postBean.postId}"/>
												
												<c:if test="${not empty user.clientId}">
													<input type="hidden" name="clientId" id="clientId" value="${user.clientId}"/>
													<input type="hidden" name="id" id="id" value=""/>
													<img style="width:50px;height:50px;" src="<%=request.getContextPath()%>/photo/${user.clientMemberDetail.clientLogo}" alt="">
													${user.clientName}
												</c:if>
												
												<c:if test="${not empty user.id}">
													<input type="hidden" name="clientId" id="clientId" value=""/>
													<input type="hidden" name="id" id="id" value="${user.id}"/>
													<img style="width:50px;height:50px;" src="<%=request.getContextPath()%>/photo/${store.sLogo}" alt="">
													${user.sName}
												</c:if>
												  
											</div>
											
										</div>
										
										<div class="col-md-6">
											<div class="leave-form">
											
											</div>
										</div>
										<div class="col-md-12">
												<textarea style="resize:none;" rows="10" cols="" name="commitContent" id="commitContent"></textarea>
												
											<div class="text-leave">
												<button type="button" class="btn btn-danger" onclick="sendcommit();">送出</button>
												<button type="button" class="btn btn-danger" onclick="commit();">一鍵輸入</button>
											</div>
										</div>
									</div>
								</form>
							</c:if>
							
							</div>
						</div>
					</div>
					<!-- 左bar -->
					<div class="col-lg-3">
						<div class="sidebar-style">
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">Search</h4>
								<div class="pro-sidebar-search mb-50 mt-25">
									<form class="pro-sidebar-search-form" action="./../frontlistpostkey" method="post">
										<input type="text" name="keyword" placeholder="Search here...">
										<button type="submit">
											<i class="la la-search"></i>
										</button>
									</form><p>${errorMsgMap.QueryError}</p>
								</div>
							</div>
							<!-- 標籤Bar -->
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
	<!-- sweetalert2 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript">
	function commit(){
			$('#commitContent').val("超好吃，超級推薦大家來吃吃看！保證不會後悔～");
	}
	function sendcommit(){
		
		//取表單值
		var clientId = $('#clientId').val();
		if(clientId!=""){
		var clientMember = {clientId : clientId};
		}
		var id = $('#id').val();
		if(id!=""){
		var storeMember = {id :id};
		}
		var postId = $('#postId').val();
		var postBean = {postId : postId};
		var commitContent = $('#commitContent').val();
		//傳值陣列
		var params = {
				"clientMember" : clientMember,
				"storeMember" : storeMember,
				"postBean" : postBean,
				"commitContent" : commitContent,
				
		}
		//debug
		console.log("clientMember: " + clientMember);
		console.log("storeMember: " + storeMember);
		console.log("postBean: " + postBean);
		console.log("commitContent: " + commitContent);
		
		Swal.fire({
			title: 'Are you sure?',
			text: "您將送出回覆",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '確認!',
			cancelButtonText: '取消',
			})
			.then(function(check) {
				if (check.isConfirmed) {
					//送出
					console.log("送出");
					
					$.ajax({
						type: 'post',
						url: '<%=request.getContextPath()%>/frontBlog/commitsave',
						dataType: 'JSON',
						contentType : 'application/json',
						data : JSON.stringify(params),//陣列轉json格式
						//data : params,
						//console.log('data: ' + data);
						success : function(data) {
							console.log('success: ' + data);
							//debug
							$.each(data, function(index, value) {
								console.log(value);
							});
							
							//跳轉頁面
							//window.location.href = "../serchPostForm/"+ postId;
						},
						error: function(e){
							console.log('error');
							console.log(e);
						}
						
					});
					
					Swal.fire(
						'送出成功!'
					)
				window.setTimeout((() => window.location.href = "../serchPostForm/"+ postId),800);
			}
			
		})
		
	}
	
	
	 function recommit() {
		 document.getElementById('reply').onclick = null; 
     	
         let content = `
        		<form class="blog-form" action="<%=request.getContextPath()%>/frontBlog/commitsave" method="post">
				
					<div class="col-md-6">
					
						<div class="leave-form">
							<input type="hidden" name="pid" id="pid"/>
							<input type="hidden" name="postId" id="postId" value="${postBean.postId}"/>
							
							<c:if test="${not empty user.clientId}">
								<input type="hidden" name="clientId" id="clientId" value="${user.clientId}"/>
								<input type="hidden" name="id" id="id" value=""/>
								<img style="width:50px;height:50px;" src="<%=request.getContextPath()%>/photo/${user.clientMemberDetail.clientLogo}" alt="">
								${user.clientName}
							</c:if>
							
							<c:if test="${not empty user.id}">
								<input type="hidden" name="clientId" id="clientId" value=""/>
								<input type="hidden" name="id" id="id" value="${user.id}"/>
								<img style="width:50px;height:50px;" src="<%=request.getContextPath()%>/photo/${store.sLogo}" alt="">
								${user.sName}
							</c:if>
							  
						</div>
						
					</div>
					
					<div class="col-md-6">
						<div class="leave-form">
						
						</div>
					</div>
					<div class="col-md-12">
							<textarea style="resize:none;" rows="10" cols="" name="commitContent" id="commitContent"></textarea>
							
						<div class="text-leave">
							<button type="button" class="btn btn-danger" onclick="sendcommit();">送出</button>
						</div>
					</div>
				
			</form>
                     `
         $('#inputcomment').append(content)
     }
	 
	 function recommit2() {
		 document.getElementById('reply').onclick = null; 
     	
         let content = `
        		<form class="blog-form" action="<%=request.getContextPath()%>/frontBlog/commitsave" method="post">
				
					<div class="col-md-6">
					
						<div class="leave-form">
							<input type="hidden" name="pid" id="pid"/>
							<input type="hidden" name="postId" id="postId" value="${postBean.postId}"/>
							
							<c:if test="${not empty user.clientId}">
								<input type="hidden" name="clientId" id="clientId" value="${user.clientId}"/>
								<input type="hidden" name="id" id="id" value=""/>
								<img style="width:50px;height:50px;" src="<%=request.getContextPath()%>/photo/${user.clientMemberDetail.clientLogo}" alt="">
								${user.clientName}
							</c:if>
							
							<c:if test="${not empty user.id}">
								<input type="hidden" name="clientId" id="clientId" value=""/>
								<input type="hidden" name="id" id="id" value="${user.id}"/>
								<img style="width:50px;height:50px;" src="<%=request.getContextPath()%>/photo/${store.sLogo}" alt="">
								${user.sName}
							</c:if>
							  
						</div>
						
					</div>
					
					<div class="col-md-6">
						<div class="leave-form">
						
						</div>
					</div>
					<div class="col-md-12">
							<textarea style="resize:none;" rows="10" cols="" name="commitContent" id="commitContent"></textarea>
							
						<div class="text-leave">
							<button type="button" class="btn btn-danger" onclick="sendcommit();">送出</button>
						</div>
					</div>
				
			</form>
                     `
         $('#inputcomment2').append(content)
     }
	
	
	function serch(postId) {
		window.location.href ='<%=request.getContextPath()%>/frontBlog/serchPostForm/'+postId;
		
	}
	
	function login() {
		window.location.href = "<%=request.getContextPath()%>/login";
	}
	
	function delcommit(postcommitId) {
		
		swal.fire({
			title: '確定刪除此回覆嗎?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '確認',
			cancelButtonText: '取消',
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
				swal.fire(
					'已成功刪除',
				)
				window.setTimeout((() => window.location.href = "<%=request.getContextPath()%>/frontBlog/deletecommit/"+postcommitId),800);
			} else if (
				/* Read more about handling dismissals below */
				result.dismiss === Swal.DismissReason.cancel
			) {
				swal.fire(
					'取消刪除'
				)
			}
		})
		
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