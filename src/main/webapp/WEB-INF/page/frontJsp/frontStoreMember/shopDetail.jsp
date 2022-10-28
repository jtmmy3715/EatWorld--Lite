<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<title>餐廳資訊</title>
<%@include file="../../../../resources/includes/frontHead.jsp"%>
</head>
<body>
	<div class="main-wrapper wrapper-2">
		<!--**********************************Header start**************************************-->
		<%@include file="../../../../resources/includes/frontHeader.jsp"%>
		<!--**********************************Header end****************************************-->
		<div class="breadcrumb-area pt-95 pb-100 bg-img"
			style="background-image: url(assets/images/bg/breadcrumb.jpg);">
			<div class="container">
				<div class="breadcrumb-content text-center">
					<div class="breadcrumb-title">
						<h2>Product details</h2>
					</div>
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active">Product details</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="product-details-area pt-100 pb-100">
			<div class="container">
				<div class="row">
				<div class="col-lg-6 col-md-6">
								<div class="blog-wrap mb-30">
									<div class="blog-img mb-15">
										<a href="blog-details.html"><img alt=""
											src="assets/images/blog/blog-3.jpg"></a>
									</div>
								</div>
							</div>
					<div class="col-lg-6 col-md-6">
						<div class="product-details-content ml-30">
							<h2>Products Name Here</h2>

							<div class="pro-details-rating-wrap">
								<div class="pro-details-rating">
									<i class="la la-star"></i><i class="la la-star"></i><i
										class="la la-star"></i><i class="la la-star"></i><i
										class="la la-star"></i>
								</div>
								<br> <br> <span><a href="#">3 Reviews</a></span>
							</div>
							<div class="pro-details-list">
								<ul>
									<li>- 電話：03-4222111</li>
									<li>- 地址：</li>
									<li>- 餐廳類型：</li>
									<li>- 開始營業時間：</li>
									<li>- 結束營業時間：</li>
									<li>- 目前參加的活動：<a href="#">聖誕節優惠</a></li>
								</ul>
							</div>
							<div class="pro-details-quality">
								<div class="pro-details-cart btn-hover">
									<a href="#"><i class=" la la-cutlery"></i>查看菜單</a>
								</div>
								<div class="pro-details-cart btn-hover">
									<a href="#"><i class=" la la-edit"></i>餐廳訂位</a>
								</div>
								<div class="pro-details-cart btn-hover">
									<a href="#"><i class=" la la-heart-o"></i>收藏餐廳</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="description-review-area pb-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="description-review-wrapper">
							<div class="description-review-topbar nav">
								<a class="active" data-toggle="tab" href="#des-details1">餐廳簡介</a><a
									data-toggle="tab" href="#des-details3">餐廳位置</a><a
									data-toggle="tab" href="#des-details2">餐廳評論</a>
							</div>
							<div class="tab-content description-review-bottom">
								<div id="des-details1" class="tab-pane active">
									<div class="product-description-wrapper">
										<p>Pellentesque orci lectus, bibendum iaculis aliquet id,
											ullamcorper nec ipsum. In laoreet ligula vitae tristique
											viverra. Suspendisse augue nunc, laoreet in arcu ut,
											vulputate malesuada justo. Donec porttitor elit justo, sed
											lobortis nulla interdum et. Sed lobortis sapien ut augue
											condimentum, eget ullamcorper nibh lobortis. Cras ut bibendum
											libero. Quisque in nisl nisl. Mauris vestibulum leo nec
											pellentesque sollicitudin.</p>
									</div>
								</div>
								<div id="des-details3" class="tab-pane">
									<div class="product-anotherinfo-wrapper">
										<ul>
											<li><span>Weight</span>400 g</li>
											<li><span>Dimensions</span>10 x 10 x 15 cm</li>
											<li><span>Materials</span>60% cotton, 40% polyester</li>
											<li><span>Other Info</span>American heirloom jean shorts
												pug seitan letterpress</li>
										</ul>
									</div>
								</div>
								<div id="des-details2" class="tab-pane">
									<div class="review-wrapper">
										<div class="single-review">
											<div class="review-img">
												<img src="assets/images/product-details/client-1.jpg" alt="">
											</div>
											<div class="review-content">
												<p>âIn convallis nulla et magna congue convallis.
													Donec eu nunc vel justo maximus posuere. Sed viverra nunc
													erat, a efficitur nibhâ</p>
												<div class="review-top-wrap">
													<div class="review-name">
														<h4>Stella McGee</h4>
													</div>
													<div class="review-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i>
													</div>
												</div>
											</div>
										</div>
										<div class="single-review">
											<div class="review-img">
												<img src="assets/images/product-details/client-2.jpg" alt="">
											</div>
											<div class="review-content">
												<p>âIn convallis nulla et magna congue convallis.
													Donec eu nunc vel justo maximus posuere. Sed viverra nunc
													erat, a efficitur nibhâ</p>
												<div class="review-top-wrap">
													<div class="review-name">
														<h4>Stella McGee</h4>
													</div>
													<div class="review-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i>
													</div>
												</div>
											</div>
										</div>
										<div class="single-review">
											<div class="review-img">
												<img src="assets/images/product-details/client-3.jpg" alt="">
											</div>
											<div class="review-content">
												<p>âIn convallis nulla et magna congue convallis.
													Donec eu nunc vel justo maximus posuere. Sed viverra nunc
													erat, a efficitur nibhâ</p>
												<div class="review-top-wrap">
													<div class="review-name">
														<h4>Stella McGee</h4>
													</div>
													<div class="review-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="ratting-form-wrapper">
										<span>Add a Review</span>
										<p>
											Your email address will not be published. Required fields are
											marked <span>*</span>
										</p>
										<div class="star-box-wrap">
											<div class="single-ratting-star">
												<i class="la la-star"></i>
											</div>
											<div class="single-ratting-star">
												<i class="la la-star"></i><i class="la la-star"></i>
											</div>
											<div class="single-ratting-star">
												<i class="la la-star"></i><i class="la la-star"></i><i
													class="la la-star"></i>
											</div>
											<div class="single-ratting-star">
												<i class="la la-star"></i><i class="la la-star"></i><i
													class="la la-star"></i><i class="la la-star"></i>
											</div>
											<div class="single-ratting-star">
												<i class="la la-star"></i><i class="la la-star"></i><i
													class="la la-star"></i><i class="la la-star"></i><i
													class="la la-star"></i>
											</div>
										</div>
										<div class="ratting-form">
											<form action="#">
												<div class="row">
													<div class="col-md-12">
														<div class="rating-form-style mb-20">
															<label>Your review <span>*</span></label>
															<textarea name="Your Review"></textarea>
														</div>
													</div>
													<div class="col-md-12">
														<div class="rating-form-style mb-20">
															<label>Name <span>*</span></label><input type="text">
														</div>
													</div>
													<div class="col-md-12">
														<div class="rating-form-style mb-20">
															<label>Email <span>*</span></label><input type="email">
														</div>
													</div>
													<div class="col-lg-12">
														<div class="form-submit">
															<input type="submit" value="Submit">
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="product-area pb-100">
			<div class="container">
				<div class="section-title text-center mb-45">
					<h2>您可能有興趣的餐廳</h2>
					<p>探索更多美食餐廳</p>
				</div>
				<div class="product-slider-active owl-carousel">
					<div class="product-wrap product-border-1">
						<div class="product-img">
							<a href="product-details.html"><img
								src="assets/images/product/hm1-pro-1.jpg" alt="product"></a>
							<div class="product-action">
								<a data-toggle="modal" data-target="#exampleModal"
									title="Quick View" href="#"><i class="la la-plus"></i></a><a
									title="Add To Cart" href="#"><i class="la la-shopping-cart"></i></a><a
									title="Wishlist" href="wishlist.html"><i
									class="la la-heart-o"></i></a>
							</div>
						</div>
						<div class="product-content product-content-padding text-center">
							<h4>
								<a href="product-details.html">Demo Product Name</a>
							</h4>
							<div class="product-rating">
								<i class="la la-star"></i><i class="la la-star"></i><i
									class="la la-star"></i><i class="la la-star"></i><i
									class="la la-star"></i>
							</div>
							<div class="product-price">
								<span>Â£210.00</span>
							</div>
						</div>
					</div>
					<div class="product-wrap product-border-1">
						<div class="product-img">
							<a href="product-details.html"><img
								src="assets/images/product/hm1-pro-2.jpg" alt="product"></a><span
								class="product-badge">Sell</span>
							<div class="product-action">
								<a data-toggle="modal" data-target="#exampleModal"
									title="Quick View" href="#"><i class="la la-plus"></i></a><a
									title="Add To Cart" href="#"><i class="la la-shopping-cart"></i></a><a
									title="Wishlist" href="wishlist.html"><i
									class="la la-heart-o"></i></a>
							</div>
						</div>
						<div class="product-content product-content-padding text-center">
							<h4>
								<a href="product-details.html">Demo Product Name</a>
							</h4>
							<div class="product-rating">
								<i class="la la-star"></i><i class="la la-star"></i><i
									class="la la-star"></i><i class="la la-star"></i><i
									class="la la-star"></i>
							</div>
							<div class="product-price">
								<span>Â£150.00</span><span class="old">Â£180.00</span>
							</div>
						</div>
					</div>
					<div class="product-wrap product-border-1">
						<div class="product-img">
							<a href="product-details.html"><img
								src="assets/images/product/hm1-pro-3.jpg" alt="product"></a>
							<div class="product-action">
								<a data-toggle="modal" data-target="#exampleModal"
									title="Quick View" href="#"><i class="la la-plus"></i></a><a
									title="Add To Cart" href="#"><i class="la la-shopping-cart"></i></a><a
									title="Wishlist" href="wishlist.html"><i
									class="la la-heart-o"></i></a>
							</div>
						</div>
						<div class="product-content product-content-padding text-center">
							<h4>
								<a href="product-details.html">Demo Product Name</a>
							</h4>
							<div class="product-rating">
								<i class="la la-star"></i><i class="la la-star"></i><i
									class="la la-star"></i><i class="la la-star"></i><i
									class="la la-star"></i>
							</div>
							<div class="product-price">
								<span>Â£250.00</span>
							</div>
						</div>
					</div>
					<div class="product-wrap product-border-1">
						<div class="product-img">
							<a href="product-details.html"><img
								src="assets/images/product/hm1-pro-4.jpg" alt="product"></a><span
								class="product-badge">Sell</span>
							<div class="product-action">
								<a data-toggle="modal" data-target="#exampleModal"
									title="Quick View" href="#"><i class="la la-plus"></i></a><a
									title="Add To Cart" href="#"><i class="la la-shopping-cart"></i></a><a
									title="Wishlist" href="wishlist.html"><i
									class="la la-heart-o"></i></a>
							</div>
						</div>
						<div class="product-content product-content-padding text-center">
							<h4>
								<a href="product-details.html">Demo Product Name</a>
							</h4>
							<div class="product-rating">
								<i class="la la-star"></i><i class="la la-star"></i><i
									class="la la-star"></i><i class="la la-star"></i><i
									class="la la-star"></i>
							</div>
							<div class="product-price">
								<span>Â£270.00</span><span class="old">Â£290.00</span>
							</div>
						</div>
					</div>
					<div class="product-wrap product-border-1">
						<div class="product-img">
							<a href="product-details.html"><img
								src="assets/images/product/hm1-pro-5.jpg" alt="product"></a>
							<div class="product-action">
								<a data-toggle="modal" data-target="#exampleModal"
									title="Quick View" href="#"><i class="la la-plus"></i></a><a
									title="Add To Cart" href="#"><i class="la la-shopping-cart"></i></a><a
									title="Wishlist" href="wishlist.html"><i
									class="la la-heart-o"></i></a>
							</div>
						</div>
						<div class="product-content product-content-padding text-center">
							<h4>
								<a href="product-details.html">Demo Product Name</a>
							</h4>
							<div class="product-rating">
								<i class="la la-star"></i><i class="la la-star"></i><i
									class="la la-star"></i><i class="la la-star"></i><i
									class="la la-star"></i>
							</div>
							<div class="product-price">
								<span>Â£230.00</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--**********************************Footer start**************************************-->
		<%@include file="../../../../resources/includes/frontFooter.jsp"%>
		<!--**********************************Footer end****************************************-->
		<%-- 		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-5 col-sm-12 col-xs-12">
								<div class="tab-content quickview-big-img">
									<div id="pro-1" class="tab-pane fade show active">
										<img src="assets/images/product/quickview-l1.jpg" alt="">
									</div>
									<div id="pro-2" class="tab-pane fade">
										<img src="assets/images/product/quickview-l2.jpg" alt="">
									</div>
									<div id="pro-3" class="tab-pane fade">
										<img src="assets/images/product/quickview-l3.jpg" alt="">
									</div>
									<div id="pro-4" class="tab-pane fade">
										<img src="assets/images/product/quickview-l2.jpg" alt="">
									</div>
								</div>
								<!-- Thumbnail Large Image End -->
								<!-- Thumbnail Image End -->
								<div class="quickview-wrap mt-15">
									<div
										class="quickview-slide-active owl-carousel nav nav-style-2"
										role="tablist">
										<a class="active" data-toggle="tab" href="#pro-1"><img
											src="assets/images/product/quickview-s1.jpg" alt=""></a><a
											data-toggle="tab" href="#pro-2"><img
											src="assets/images/product/quickview-s2.jpg" alt=""></a><a
											data-toggle="tab" href="#pro-3"><img
											src="assets/images/product/quickview-s3.jpg" alt=""></a><a
											data-toggle="tab" href="#pro-4"><img
											src="assets/images/product/quickview-s2.jpg" alt=""></a>
									</div>
								</div>
							</div>
							<div class="col-md-7 col-sm-12 col-xs-12">
								<div class="product-details-content quickview-content">
									<h2>Products Name Here</h2>
									<div class="product-details-price">
										<span>$18.00</span><span class="old">$20.00</span>
									</div>
									<div class="pro-details-rating-wrap">
										<div class="pro-details-rating">
											<i class="la la-star"></i><i class="la la-star"></i><i
												class="la la-star"></i><i class="la la-star"></i><i
												class="la la-star-half-o"></i>
										</div>
										<span>3 Reviews</span>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisic elit
										eiusm tempor incidid ut labore et dolore magna aliqua. Ut enim
										ad minim venialo quis nostrud exercitation ullamco</p>
									<div class="pro-details-list">
										<ul>
											<li>- 0.5 mm Dail</li>
											<li>- Inspired vector icons</li>
											<li>- Very modern style</li>
										</ul>
									</div>
									<div class="pro-details-size-color">
										<div class="pro-details-color-wrap">
											<span>Color</span>
											<div class="pro-details-color-content">
												<ul>
													<li class="blue"></li>
													<li class="maroon active"></li>
													<li class="gray"></li>
													<li class="green"></li>
													<li class="yellow"></li>
													<li class="white"></li>
												</ul>
											</div>
										</div>
										<div class="pro-details-size">
											<span>Size</span>
											<div class="pro-details-size-content">
												<ul>
													<li><a href="#">s</a></li>
													<li><a href="#">m</a></li>
													<li><a href="#">l</a></li>
													<li><a href="#">xl</a></li>
													<li><a href="#">xxl</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="pro-details-quality">
										<div class="cart-plus-minus">
											<input class="cart-plus-minus-box" type="text"
												name="qtybutton" value="2">
										</div>
										<div class="pro-details-cart btn-hover">
											<a href="#">Add To Cart</a>
										</div>
										<div class="pro-details-wishlist">
											<a title="Add To Wishlist" href="#"><i
												class="la la-heart-o"></i></a>
										</div>
										<div class="pro-details-compare">
											<a title="Add To Compare" href="#"><i
												class="la la-refresh"></i></a>
										</div>
									</div>
									<div class="pro-details-meta">
										<span>Categories :</span>
										<ul>
											<li><a href="#">Minimal,</a></li>
											<li><a href="#">Furniture,</a></li>
											<li><a href="#">Fashion</a></li>
										</ul>
									</div>
									<div class="pro-details-meta">
										<span>Tag :</span>
										<ul>
											<li><a href="#">Fashion, </a></li>
											<li><a href="#">Furniture,</a></li>
											<li><a href="#">Electronic</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal end -->--%>
	</div>
	<!-- JS============================================ -->
	<!-- Modernizer JS -->
	<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
	<!-- jQuery JS -->
	<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
	<!-- Popper JS -->
	<script src="assets/js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="assets/js/vendor/bootstrap.min.js"></script>
	<!-- Slick Slider JS -->
	<script src="assets/js/plugins/countdown.js"></script>
	<script src="assets/js/plugins/counterup.js"></script>
	<!--<script src="assets/js/plugins/instafeed.js"></script>-->
	<script src="assets/js/plugins/jquery-ui.js"></script>
	<script src="assets/js/plugins/jquery-ui-touch-punch.js"></script>
	<script src="assets/js/plugins/magnific-popup.js"></script>
	<script src="assets/js/plugins/owl-carousel.js"></script>
	<script src="assets/js/plugins/scrollup.js"></script>
	<script src="assets/js/plugins/waypoints.js"></script>
	<script src="assets/js/plugins/wow.js"></script>
	<script src="assets/js/plugins/slick.js"></script>
	<script src="assets/js/plugins/elevatezoom.js"></script>
	<script src="assets/js/plugins/sticky-sidebar.js"></script>
	<script src="assets/js/plugins/ajax-mail.js"></script>
	<!-- Main JS -->
	<script src="assets/js/main.js"></script>
</body>
</html>