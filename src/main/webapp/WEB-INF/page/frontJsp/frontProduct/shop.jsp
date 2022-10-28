<!doctype html>
<html class="no-js" lang="en">
<head>
<title>Eliza - eCommerce Bootstrap 4 Template</title>
<%@include file="/resources/includes/frontHead.jsp"%>
</head>
<body>
	<div class="main-wrapper wrapper-2">
		<!--**********************************Header start**************************************-->
		<%@include file="/resources/includes/frontHeader.jsp"%>
		<!--**********************************Header end****************************************-->
		<div class="breadcrumb-area pt-95 pb-100 bg-img"
			style="background-image: url(assets/images/bg/breadcrumb.jpg);">
			<div class="container">
				<div class="breadcrumb-content text-center">
					<div class="breadcrumb-title">
						<h2>shop page</h2>
					</div>
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active">shop page</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="shop-area pt-95 pb-100">
			<div class="container">
				<div class="row flex-row-reverse">
					<div class="col-lg-9">
						<div class="shop-top-bar">
							<div class="select-shoing-wrap">
								<div class="shop-select">
									<select><option value="">Sort by newness</option>
										<option value="">A to Z</option>
										<option value="">Z to A</option>
										<option value="">In stock</option></select>
								</div>
								<p>Showing 1–12 of 20 result</p>
							</div>
							<div class="shop-tab nav">
								<a class="active" href="#shop-1" data-toggle="tab"><i
									class="la la-th-large"></i></a><a href="#shop-2" data-toggle="tab"><i
									class="la la-reorder"></i></a>
							</div>
						</div>
						<div class="shop-bottom-area mt-35">
							<div class="tab-content jump">
								<div id="shop-1" class="tab-pane active">
									<div class="row">
										<div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
											<div class="product-wrap product-border-1 mb-30">
												<div class="product-img">
													<a href="product-details.jsp"><img
														src="assets/images/product/hm1-pro-1.jpg" alt="product"></a><span
														class="product-badge">-30%</span>
													<div class="product-action">
														<a data-toggle="modal" data-target="#exampleModal"
															title="Quick View" href="#"><i class="la la-plus"></i></a><a
															title="Add To Cart" href="#"><i
															class="la la-shopping-cart"></i></a><a title="Wishlist"
															href="wishlist.jsp"><i class="la la-heart-o"></i></a>
													</div>
												</div>
												<div
													class="product-content product-content-padding text-center">
													<h4>
														<a href="product-details.jsp">Demo Product Name</a>
													</h4>
													<div class="product-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i>
													</div>
													<div class="product-price">
														<span>£210.00</span><span class="old">£230.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
											<div class="product-wrap product-border-1 mb-30">
												<div class="product-img">
													<a href="product-details.html"><img
														src="assets/images/product/hm1-pro-2.jpg" alt="product"></a>
													<div class="product-action">
														<a data-toggle="modal" data-target="#exampleModal"
															title="Quick View" href="#"><i class="la la-plus"></i></a><a
															title="Add To Cart" href="#"><i
															class="la la-shopping-cart"></i></a><a title="Wishlist"
															href="wishlist.html"><i class="la la-heart-o"></i></a>
													</div>
												</div>
												<div
													class="product-content product-content-padding text-center">
													<h4>
														<a href="product-details.html">Demo Product Name</a>
													</h4>
													<div class="product-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star-half-o"></i><i
															class="la la-star-half-o"></i>
													</div>
													<div class="product-price">
														<span>£210.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
											<div class="product-wrap product-border-1 mb-30">
												<div class="product-img">
													<a href="product-details.html"><img
														src="assets/images/product/hm1-pro-3.jpg" alt="product"></a><span
														class="product-badge">-30%</span>
													<div class="product-action">
														<a data-toggle="modal" data-target="#exampleModal"
															title="Quick View" href="#"><i class="la la-plus"></i></a><a
															title="Add To Cart" href="#"><i
															class="la la-shopping-cart"></i></a><a title="Wishlist"
															href="wishlist.html"><i class="la la-heart-o"></i></a>
													</div>
												</div>
												<div
													class="product-content product-content-padding text-center">
													<h4>
														<a href="product-details.html">Demo Product Name</a>
													</h4>
													<div class="product-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star-half-o"></i>
													</div>
													<div class="product-price">
														<span>£150.00</span><span class="old">£180.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
											<div class="product-wrap product-border-1 mb-30">
												<div class="product-img">
													<a href="product-details.html"><img
														src="assets/images/product/hm1-pro-4.jpg" alt="product"></a>
													<div class="product-action">
														<a data-toggle="modal" data-target="#exampleModal"
															title="Quick View" href="#"><i class="la la-plus"></i></a><a
															title="Add To Cart" href="#"><i
															class="la la-shopping-cart"></i></a><a title="Wishlist"
															href="wishlist.html"><i class="la la-heart-o"></i></a>
													</div>
												</div>
												<div
													class="product-content product-content-padding text-center">
													<h4>
														<a href="product-details.html">Demo Product Name</a>
													</h4>
													<div class="product-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star-half-o"></i>
													</div>
													<div class="product-price">
														<span>£210.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
											<div class="product-wrap product-border-1 mb-30">
												<div class="product-img">
													<a href="product-details.html"><img
														src="assets/images/product/hm1-pro-5.jpg" alt="product"></a>
													<div class="product-action">
														<a data-toggle="modal" data-target="#exampleModal"
															title="Quick View" href="#"><i class="la la-plus"></i></a><a
															title="Add To Cart" href="#"><i
															class="la la-shopping-cart"></i></a><a title="Wishlist"
															href="wishlist.html"><i class="la la-heart-o"></i></a>
													</div>
													<span class="product-badge">-30%</span>
												</div>
												<div
													class="product-content product-content-padding text-center">
													<h4>
														<a href="product-details.html">Demo Product Name</a>
													</h4>
													<div class="product-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star-half-o"></i>
													</div>
													<div class="product-price">
														<span>£210.00</span><span class="old">£230.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
											<div class="product-wrap product-border-1 mb-30">
												<div class="product-img">
													<a href="product-details.html"><img
														src="assets/images/product/hm1-pro-6.jpg" alt="product"></a>
													<div class="product-action">
														<a data-toggle="modal" data-target="#exampleModal"
															title="Quick View" href="#"><i class="la la-plus"></i></a><a
															title="Add To Cart" href="#"><i
															class="la la-shopping-cart"></i></a><a title="Wishlist"
															href="wishlist.html"><i class="la la-heart-o"></i></a>
													</div>
												</div>
												<div
													class="product-content product-content-padding text-center">
													<h4>
														<a href="product-details.html">Demo Product Name</a>
													</h4>
													<div class="product-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star-half-o"></i>
													</div>
													<div class="product-price">
														<span>£200.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
											<div class="product-wrap product-border-1 mb-30">
												<div class="product-img">
													<a href="product-details.html"><img
														src="assets/images/product/hm1-pro-7.jpg" alt="product"></a>
													<div class="product-action">
														<a data-toggle="modal" data-target="#exampleModal"
															title="Quick View" href="#"><i class="la la-plus"></i></a><a
															title="Add To Cart" href="#"><i
															class="la la-shopping-cart"></i></a><a title="Wishlist"
															href="wishlist.html"><i class="la la-heart-o"></i></a>
													</div>
													<span class="product-badge">New</span>
												</div>
												<div
													class="product-content product-content-padding text-center">
													<h4>
														<a href="product-details.html">Demo Product Name</a>
													</h4>
													<div class="product-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star-half-o"></i>
													</div>
													<div class="product-price">
														<span>£300.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
											<div class="product-wrap product-border-1 mb-30">
												<div class="product-img">
													<a href="product-details.html"><img
														src="assets/images/product/hm1-pro-8.jpg" alt="product"></a>
													<div class="product-action">
														<a data-toggle="modal" data-target="#exampleModal"
															title="Quick View" href="#"><i class="la la-plus"></i></a><a
															title="Add To Cart" href="#"><i
															class="la la-shopping-cart"></i></a><a title="Wishlist"
															href="wishlist.html"><i class="la la-heart-o"></i></a>
													</div>
												</div>
												<div
													class="product-content product-content-padding text-center">
													<h4>
														<a href="product-details.html">Demo Product Name</a>
													</h4>
													<div class="product-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star-half-o"></i>
													</div>
													<div class="product-price">
														<span>£130.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
											<div class="product-wrap product-border-1 mb-30">
												<div class="product-img">
													<a href="product-details.html"><img
														src="assets/images/product/hm1-pro-1.jpg" alt="product"></a><span
														class="product-badge">-30%</span>
													<div class="product-action">
														<a data-toggle="modal" data-target="#exampleModal"
															title="Quick View" href="#"><i class="la la-plus"></i></a><a
															title="Add To Cart" href="#"><i
															class="la la-shopping-cart"></i></a><a title="Wishlist"
															href="wishlist.html"><i class="la la-heart-o"></i></a>
													</div>
												</div>
												<div
													class="product-content product-content-padding text-center">
													<h4>
														<a href="product-details.html">Demo Product Name</a>
													</h4>
													<div class="product-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i>
													</div>
													<div class="product-price">
														<span>£210.00</span><span class="old">£230.00</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="shop-2" class="tab-pane">
									<div class="shop-list-wrap mb-30">
										<div class="row">
											<div class="col-xl-4 col-lg-5 col-md-5 col-sm-6">
												<div class="product-wrap product-border-1">
													<div class="product-img">
														<a href="#"><img
															src="assets/images/product/hm1-pro-1.jpg" alt="product"></a><span
															class="product-badge">-30%</span>
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class="la la-plus"></i></a>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-8 col-lg-7 col-md-7 col-sm-6">
												<div class="shop-list-content">
													<h3>
														<a href="#">Products Name Here</a>
													</h3>
													<div class="product-list-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i>
													</div>
													<div class="product-list-price">
														<span>$ 60.00</span><span class="old">$ 90.00</span>
													</div>
													<p>Lorem ipsum dolor sit amet, consecteto adipisic elit
														eiusm tempor incidid ut labore et dolore magna aliqua Ut
														enim ad minim</p>
													<div class="shop-list-btn-wrap">
														<div class="shop-list-cart default-btn btn-hover">
															<a href="#">ADD TO CART</a>
														</div>
														<div class="shop-list-wishlist default-btn btn-hover">
															<a href="#"><i class="la la-heart-o"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="shop-list-wrap mb-30">
										<div class="row">
											<div class="col-xl-4 col-lg-5 col-md-5 col-sm-6">
												<div class="product-wrap product-border-1">
													<div class="product-img">
														<a href="#"><img
															src="assets/images/product/hm1-pro-2.jpg" alt="product"></a>
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class="la la-plus"></i></a>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-8 col-lg-7 col-md-7 col-sm-6">
												<div class="shop-list-content">
													<h3>
														<a href="#">Products Name Here</a>
													</h3>
													<div class="product-list-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i>
													</div>
													<div class="product-list-price">
														<span>$ 100.00</span>
													</div>
													<p>Lorem ipsum dolor sit amet, consecteto adipisic elit
														eiusm tempor incidid ut labore et dolore magna aliqua Ut
														enim ad minim</p>
													<div class="shop-list-btn-wrap">
														<div class="shop-list-cart default-btn btn-hover">
															<a href="#">ADD TO CART</a>
														</div>
														<div class="shop-list-wishlist default-btn btn-hover">
															<a href="#"><i class="la la-heart-o"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="shop-list-wrap mb-30">
										<div class="row">
											<div class="col-xl-4 col-lg-5 col-md-5 col-sm-6">
												<div class="product-wrap product-border-1">
													<div class="product-img">
														<a href="#"><img
															src="assets/images/product/hm1-pro-3.jpg" alt="product"></a><span
															class="product-badge">-20%</span>
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class="la la-plus"></i></a>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-8 col-lg-7 col-md-7 col-sm-6">
												<div class="shop-list-content">
													<h3>
														<a href="#">Products Name Here</a>
													</h3>
													<div class="product-list-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i>
													</div>
													<div class="product-list-price">
														<span>$ 70.00</span><span class="old">$ 80.00</span>
													</div>
													<p>Lorem ipsum dolor sit amet, consecteto adipisic elit
														eiusm tempor incidid ut labore et dolore magna aliqua Ut
														enim ad minim</p>
													<div class="shop-list-btn-wrap">
														<div class="shop-list-cart default-btn btn-hover">
															<a href="#">ADD TO CART</a>
														</div>
														<div class="shop-list-wishlist default-btn btn-hover">
															<a href="#"><i class="la la-heart-o"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="shop-list-wrap mb-30">
										<div class="row">
											<div class="col-xl-4 col-lg-5 col-md-5 col-sm-6">
												<div class="product-wrap product-border-1">
													<div class="product-img">
														<a href="#"><img
															src="assets/images/product/hm1-pro-4.jpg" alt="product"></a>
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class="la la-plus"></i></a>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-8 col-lg-7 col-md-7 col-sm-6">
												<div class="shop-list-content">
													<h3>
														<a href="#">Products Name Here</a>
													</h3>
													<div class="product-list-rating">
														<i class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i><i class="la la-star"></i><i
															class="la la-star"></i>
													</div>
													<div class="product-list-price">
														<span>$ 20.00</span>
													</div>
													<p>Lorem ipsum dolor sit amet, consecteto adipisic elit
														eiusm tempor incidid ut labore et dolore magna aliqua Ut
														enim ad minim</p>
													<div class="shop-list-btn-wrap">
														<div class="shop-list-cart default-btn btn-hover">
															<a href="#">ADD TO CART</a>
														</div>
														<div class="shop-list-wishlist default-btn btn-hover">
															<a href="#"><i class="la la-heart-o"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="pro-pagination-style text-center mt-20">
								<ul>
									<li><a class="prev" href="#"><i
											class="la la-angle-left"></i></a></li>
									<li><a class="active" href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a class="next" href="#"><i
											class="la la-angle-right"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="sidebar-style mr-30">
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">Search</h4>
								<div class="pro-sidebar-search mb-50 mt-25">
									<form class="pro-sidebar-search-form" action="#">
										<input type="text" placeholder="Search here...">
										<button>
											<i class="la la-search"></i>
										</button>
									</form>
								</div>
							</div>
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">Refine By</h4>
								<div class="sidebar-widget-list mt-30">
									<ul>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox"><a href="#">On Sale <span>4</span></a><span
													class="checkmark"></span>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">New
													<span>5</span>
												</a><span class="checkmark"></span>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">In
													Stock <span>6</span>
												</a><span class="checkmark"></span>
											</div></li>
									</ul>
								</div>
							</div>
							<div class="sidebar-widget mt-45">
								<h4 class="pro-sidebar-title">Filter By Price</h4>
								<div class="price-filter mt-10">
									<div class="price-slider-amount">
										<input type="text" id="amount" name="price"
											placeholder="Add Your Price" />
									</div>
									<div id="slider-range"></div>
								</div>
							</div>
							<div class="sidebar-widget mt-50">
								<h4 class="pro-sidebar-title">Colour</h4>
								<div class="sidebar-widget-list mt-20">
									<ul>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">Green
													<span>7</span>
												</a><span class="checkmark"></span>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">Cream
													<span>8</span>
												</a><span class="checkmark"></span>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">Blue
													<span>9</span>
												</a><span class="checkmark"></span>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">Black
													<span>3</span>
												</a><span class="checkmark"></span>
											</div></li>
									</ul>
								</div>
							</div>
							<div class="sidebar-widget mt-40">
								<h4 class="pro-sidebar-title">Size</h4>
								<div class="sidebar-widget-list mt-20">
									<ul>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">XL <span>4</span></a><span
													class="checkmark"></span>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">L <span>5</span></a><span
													class="checkmark"></span>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">SM <span>6</span></a><span
													class="checkmark"></span>
											</div></li>
										<li><div class="sidebar-widget-list-left">
												<input type="checkbox" value=""><a href="#">XXL
													<span>7</span>
												</a><span class="checkmark"></span>
											</div></li>
									</ul>
								</div>
							</div>
							<div class="sidebar-widget mt-50">
								<h4 class="pro-sidebar-title">Tag</h4>
								<div class="sidebar-widget-tag mt-25">
									<ul>
										<li><a href="#">Clothing</a></li>
										<li><a href="#">Accessories</a></li>
										<li><a href="#">For Men</a></li>
										<li><a href="#">Women</a></li>
										<li><a href="#">Fashion</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
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
		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/frontFooter.jsp"%>
		<!--**********************************Footer end****************************************-->
		<!-- Modal end -->
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