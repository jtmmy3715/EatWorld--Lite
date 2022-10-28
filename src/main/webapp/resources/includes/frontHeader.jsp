<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header-area sticky-bar">
	<div class="main-header-wrap">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-xl-2 col-lg-2">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/"><img
							src="<%=request.getContextPath()%>/assets/images/logo/logo.png"
							alt="logo"></a>
					</div>
				</div>
				<div class="col-xl-8 col-lg-8">
					<div class="main-menu">
						<nav>
							<ul>
								<li class="angle-shape"><a
									href="${pageContext.request.contextPath}/"><strong>首頁</strong></a></li>
								<li class="angle-shape"><a href="<%=request.getContextPath()%>/store/check"><strong>所有商店</strong></a>
									</li>
								<li class="angle-shape"><a href="<%=request.getContextPath()%>/frontBlog/frontlistpost"><strong>部落格</strong></a></li>
								<li class="angle-shape"><a href="<%=request.getContextPath()%>/front/booking/store/list"><strong>訂位</strong></a></li>

								<li class="angle-shape"><a href="<%=request.getContextPath()%>/Event/front"><strong>優惠活動</strong></a></li>

								<li class="angle-shape"><a href="<%=request.getContextPath()%>/user/accountInfo"><strong>會員中心</strong></a></li>

								<li class="angle-shape"><a href="#"><strong>聯絡我們</strong></a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-xl-2 col-lg-2">
					<div class="header-right-wrap">
						<div class="same-style cart-wrap">
							<a href="#" class="cart-active" id="get_cart_all"><i
								class="la la-shopping-cart"></i>
								<span class="count-style" id="cart_size">0
									
								</span>
							</a>
						</div>
						<div class="same-style header-search ml-15">
							<a class="search-active" href="#"><i class="la la-search"></i></a>
						</div>
						<c:if test="${user == null && googleUser == null}">
							<div class="same-style setting-wrap ml-15">
								<a class="setting-active" href="#"><i class="la la-user"></i></a>
								<div class="setting-content">
									<ul class="submenu" style="text-align:center;">
										<div id="account"><li><a href="${pageContext.request.contextPath}/login">會員登入</a></li></div>
										<div id="account"><li><a href="${pageContext.request.contextPath}/register">會員註冊</a></li></div>
									</ul>
								</div>
							</div>
						</c:if>
						<c:if test="${user != null && googleUser == null}">
							<div class="same-style setting-wrap ml-15">
								<c:choose>
									<c:when test="${user.clientId != null}">
									<a class="setting-active" href="#">
									<img id="photo" src="<%=request.getContextPath()%>/photo/${user.clientMemberDetail.clientLogo}" style="width:30px; height:30px; border-radius:999em;"/></a>
									</c:when>
											
									<c:otherwise>
									<a class="setting-active" href="#">
									<img id="photo" src="<%=request.getContextPath()%>/photo/${user.sLogo}" style="width:30px; height:30px; border-radius:999em;"/></a>
									</c:otherwise>
								</c:choose>

								<div class="setting-content">
									<ul class="submenu">
										<div id="account"><li><a href="${pageContext.request.contextPath}/user/accountInfo"><i class="fa fa-user"></i>&nbsp;&nbsp;&nbsp;會員資料</a></li></div>
										<div id="account"><li><a href="${pageContext.request.contextPath}/OrderController/user/orders"><i class="fa fa-cart-arrow-down"></i>&nbsp;&nbsp;&nbsp;我的訂單</a></li></div>
										<div id="account"><li><a href="${pageContext.request.contextPath}/user/wishList"><i class="fa fa-heart"></i>&nbsp;&nbsp;&nbsp;收藏商家</a></li></div>
										<div id="account"><li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;&nbsp;會員登出</a></li></div>
									</ul>
								</div>
							</div>
						</c:if>
						
						<c:if test="${user == null && googleUser != null}">
							<div class="same-style setting-wrap ml-15">
									<a class="setting-active" href="#">
									<img id="photo" src="${googleUser.clientMemberDetail.clientLogo}" style="width:30px; height:30px; border-radius:999em;"/></a>

								<div class="setting-content">
									<ul class="submenu">
										<div id="account"><li><a href="${pageContext.request.contextPath}/user/accountInfo"><i class="fa fa-user"></i>&nbsp;&nbsp;&nbsp;會員資料</a></li></div>
										<div id="account"><li><a href="${pageContext.request.contextPath}/user/orders"><i class="fa fa-cart-arrow-down"></i>&nbsp;&nbsp;&nbsp;我的訂單</a></li></div>
										<div id="account"><li><a href="${pageContext.request.contextPath}/user/wishList"><i class="fa fa-heart"></i>&nbsp;&nbsp;&nbsp;收藏商家</a></li></div>
										<div id="account"><li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;&nbsp;會員登出</a></li></div>
									</ul>
								</div>
							</div>
						</c:if>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header-small-mobile">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-6">
					<div class="mobile-logo">
						<a href="index.html"><img alt=""
							src="<%=request.getContextPath()%>/assets/images/logo/logo.png"></a>
					</div>
				</div>
				<div class="col-6">
					<div class="header-right-wrap">
						<div class="same-style cart-wrap">
							<a href="#" class="cart-active"><i
								class="la la-shopping-cart"></i><span class="count-style">02</span></a>
						</div>
						<div class="same-style mobile-off-canvas">
							<a class="mobile-aside-button" href="#"><i
								class="la la-navicon"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<div class="mobile-off-canvas-active">
	<a class="mobile-aside-close"><i class="la la-close"></i></a>
	<div class="header-mobile-aside-wrap">
		<div class="mobile-search">
			<form class="search-form" action="#">
				<input type="text" placeholder="Search entire store…">
				<button class="button-search">
					<i class="la la-search"></i>
				</button>
			</form>
		</div>
		<div class="mobile-menu-wrap">
			<!-- mobile menu start -->
			<div class="mobile-navigation">
				<!-- mobile menu navigation start -->
				<nav>
					<ul class="mobile-menu">
						<li class="menu-item-has-children"><a href="#">回首頁</a></li>
						<li class="menu-item-has-children"><a href="#">所有商店</a></li>
						<li class="menu-item-has-children"><a href="#">部落格</a></li>
						<li class="menu-item-has-children"><a href="#">優惠活動</a></li>
						<li class="menu-item-has-children"><a href="#">聯絡我們</a></li>
					</ul>
				</nav>
				<!-- mobile menu navigation end -->
			</div>
			<!-- mobile menu end -->
		</div>
		<div class="mobile-curr-lang-wrap">
			<div class="single-mobile-curr-lang">
				<a class="mobile-account-active" href="#">會員中心<i
					class="la la-angle-down"></i></a>
				<div class="lang-curr-dropdown account-dropdown-active">
					<ul>
						<li><a href="#">登入</a></li>
						<li><a href="#">註冊</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- search start -->
<div class="search-content-wrap main-search-active">
	<a class="search-close"><i class="la la-close"></i></a>
	<div class="search-content">
		<p>Start typing and press Enter to search</p>
		<form class="search-form" action="#">
			<input type="text" placeholder="Search entire store…">
			<button class="button-search">
				<i class="la la-search"></i>
			</button>
		</form>
	</div>
</div>
<!-- mini cart start -->
<div class="sidebar-cart-active">
	<div class="sidebar-cart-all">
		<a class="cart-close"><i class="la la-close"></i></a>
		<div class="cart-content">
			<h3>購物車清單</h3>
			
			<ul id="cart_ul">
				
	
			</ul>
			
			<!-- 
			<h5>套餐:</h5>
			<ul id="cart_combo_ul">
			

			</ul>
			 -->
			<div class="cart-total">
				<h4>
					總共是: <span id="cart_sum"></span>
				</h4>
			
			</div>
			<div class="cart-checkout-btn btn-hover default-btn">
			<form
				action="${pageContext.request.contextPath}/OrderController/goToCartPage"
				method="GET" enctype="text" id="goToCart">
				<!--  <input type = "hidden" value="initData" name = "action" >-->
				<a class="btn-size-md btn-bg-black btn-color" 
				href="javascript:document:goToCart.submit();">前往購物車</a>
			</form>
					<!--  
					<a class="no-mrg btn-size-md btn-bg-black btn-color"
					href="checkout.jsp">checkout</a>-->
			</div>
		</div>
	</div>
</div>


<!----------------------------------js  ---------------------------------->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/order.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
