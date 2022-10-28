<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->
<title>EatWorld 吃窩</title>

<!-- ===============================================-->
<!--    Favicons-->
<!-- ===============================================-->
<!-- Favicon -->

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/vendor/bootstrap.min.css">
<link rel="manifest" href="<%=request.getContextPath()%>/resources/assets/img/favicons/manifest.json">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/vendor/bootstrap.min.css">
<meta name="msapplication-TileImage"
	content="assets/img/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">
<link href="<%=request.getContextPath()%>/resources/assets/css/theme.css" rel="stylesheet" />
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.png">
<!-- CSS	============================================ -->
<!-- Icon Font CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/vendor/line-awesome.css">
<!-- othres CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/plugins/animate.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/plugins/owl-carousel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/plugins/magnific-popup.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/plugins/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/plugins/slick.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/style.css">


<!-- ===============================================-->
<!--    Stylesheets-->
<!-- ===============================================-->


</head>

<body>

	<div class="main-wrapper wrapper-2">
		<!--**********************************Header start**************************************-->
		<%@include file="/resources/includes/frontHeader.jsp"%>
		<!--**********************************Header end****************************************-->

		<!-- æ¥è©¢å°å ============================-->
		<section class="py-5 overflow-hidden bg-primary" id="home">
			<div class="container">
				<div class="row flex-center">
					<div class="col-md-5 col-lg-6 order-0 order-md-1 mt-8 mt-md-0">
						<a class="img-landing-banner" href="#!"><img class="img-fluid"
							src="<%=request.getContextPath()%>/resources/assets/img/gallery/hero-header.png" alt="hero-header" /></a>
					</div>
					<div class="col-md-7 col-lg-6 py-8 text-md-start text-center">
						<h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-light">找美食</h1>
						<h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-light">就是現在</h1>
						<h1 class="text-800 mb-5 fs-4">Enjoy Food EveryWhere</h1>
						<div class="card w-xxl-75">
							<div class="card-body">
										<form class="row gx-4 gy-2 align-items-center">
											<div class="col">
												<div class="input-group-icon">
													<i class="fas fa-map-marker-alt text-danger input-box-icon"></i>
													<input
														class="form-control input-box form-foodwagon-control"
														id="inputPickup" type="text"
														placeholder="搜尋餐廳區域或是餐廳名稱" />
												</div>
											</div>
											<div class="d-grid gap-3 col-sm-auto">
												<button class="btn btn-danger" type="submit">Find
													Food</button>
											</div>
										</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		
		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="py-8 overflow-hidden">
			<div class="container">
				<div class="row flex-center mb-6">
				<div class="row h-100">
					<div class="col-lg-7">
						<h5 class="fw-bold fs-3 fs-lg-5 lh-sm text-center text-lg-start">商家分類</h5>
					</div>
					<div class="col-lg-4 text-lg-end text-center">
						<a class="btn btn-lg text-800 me-2" href="#" role="button"></a>
					</div>
					<div class="col-lg-auto position-relative">
						<button class="carousel-control-prev s-icon-prev carousel-icon"
							type="button" data-bs-target="#carouselSearchByFood"
							data-bs-slide="prev">
							<span class="carousel-control-prev-icon hover-top-shadow"
								aria-hidden="true"></span><span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next s-icon-next carousel-icon"
							type="button" data-bs-target="#carouselSearchByFood"
							data-bs-slide="next">
							<span class="carousel-control-next-icon hover-top-shadow"
								aria-hidden="true"></span><span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
				<div class="row flex-center">
					<div class="col-12">
						<div class="carousel slide" id="carouselSearchByFood"
							data-bs-touch="false" data-bs-interval="false">
							<div class="carousel-inner">
							
							
								<div class="carousel-item active" data-bs-interval="10000">
											<div class="row h-100 align-items-center">
												<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
													<div class="card card-span h-100 rounded-circle">
														<a href="<%=request.getContextPath()%>/store/set">
														<img class="img-fluid rounded-circle h-100"
															src="<%=request.getContextPath()%>/resources/assets/img/gallery/burger.png"
															alt="..." /></a>
														<div class="card-body ps-0">
															<a href="<%=request.getContextPath()%>/store/set">
															<h5
																class="text-center fw-bold text-1000 text-truncate mb-2">
																速食</h5> </a>
														</div>
													</div>
												</div>
												<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
													<div class="card card-span h-100 rounded-circle">
														<img class="img-fluid rounded-circle h-100"
															src="<%=request.getContextPath()%>/resources/assets/img/gallery/sweet.jpg"
															alt="..." />
														<div class="card-body ps-0">
															<h5
																class="text-center fw-bold text-1000 text-truncate mb-2">
																下午茶</h5>
														</div>
													</div>
												</div>
												<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
													<div class="card card-span h-100 rounded-circle">
														<img class="img-fluid rounded-circle h-100"
															src="<%=request.getContextPath()%>/resources/assets/img/gallery/drinks.jpg"
															alt="..." />
														<div class="card-body ps-0">
															<h5
																class="text-center fw-bold text-1000 text-truncate mb-2">
																飲料</h5>
														</div>
													</div>
												</div>
												<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
													<div class="card card-span h-100 rounded-circle">
														<img class="img-fluid rounded-circle h-100"
															src="<%=request.getContextPath()%>/resources/assets/img/gallery/search-pizza.png"
															alt="..." />
														<div class="card-body ps-0">
															<h5
																class="text-center fw-bold text-1000 text-truncate mb-2">
																美式</h5>
														</div>
													</div>
												</div>
												<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
													<div class="card card-span h-100 rounded-circle">
														<img class="img-fluid rounded-circle h-100"
															src="<%=request.getContextPath()%>/resources/assets/img/gallery/DSC0736.jpg"
															alt="..." />
														<div class="card-body ps-0">
															<h5
																class="text-center fw-bold text-1000 text-truncate mb-2">
																中式</h5>
														</div>
													</div>
												</div>

											</div>
										</div>
										<div class="carousel-item" data-bs-interval="5000">
											<div class="row h-100 align-items-center">
												<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
													<div class="card card-span h-100 rounded-circle">
														<img class="img-fluid rounded-circle h-100"
															src="<%=request.getContextPath()%>/resources/assets/img/gallery/search-pizza.png"
															alt="..." />
														<div class="card-body ps-0">
															<h5
																class="text-center fw-bold text-1000 text-truncate mb-2">
																泰式</h5>
														</div>
													</div>
												</div>
												<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
													<div class="card card-span h-100 rounded-circle">
														<img class="img-fluid rounded-circle h-100"
															src="<%=request.getContextPath()%>/resources/assets/img/gallery/burger.png"
															alt="..." />
														<div class="card-body ps-0">
															<h5
																class="text-center fw-bold text-1000 text-truncate mb-2">
																義式</h5>
														</div>
													</div>
												</div>
												<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
													<div class="card card-span h-100 rounded-circle">
														<img class="img-fluid rounded-circle h-100"
															src="<%=request.getContextPath()%>/resources/assets/img/gallery/noodles.png"
															alt="..." />
														<div class="card-body ps-0">
															<h5
																class="text-center fw-bold text-1000 text-truncate mb-2">
																日式</h5>
														</div>
													</div>
												</div>
												<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
													<div class="card card-span h-100 rounded-circle">
														<img class="img-fluid rounded-circle h-100"
															src="<%=request.getContextPath()%>/resources/assets/img/gallery/sub-sandwich.png"
															alt="..." />
														<div class="card-body ps-0">
															<h5
																class="text-center fw-bold text-1000 text-truncate mb-2">
																早午餐</h5>
														</div>
													</div>
												</div>
												<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
													<div class="card card-span h-100 rounded-circle">
														<img class="img-fluid rounded-circle h-100"
															src="<%=request.getContextPath()%>/resources/assets/img/gallery/chowmein.png"
															alt="..." />
														<div class="card-body ps-0">
															<h5
																class="text-center fw-bold text-1000 text-truncate mb-2">
																小吃</h5>
														</div>
													</div>
												</div>

											</div>
										</div>
								</div>
							</div>
								
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end of .container-->

		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->
		


		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="py-0">

			<div class="container">
				<div class="row h-100 gx-2 mt-7">
					<div class="col-sm-6 col-lg-3 mb-3 mb-md-0 h-100 pb-4">
						<div class="card card-span h-100">
							<div class="position-relative">
								<img class="img-fluid rounded-3 w-100"
									src="<%=request.getContextPath()%>/resources/assets/img/gallery/discount-item-1.png" alt="..." />
								<div class="card-actions">
									<div class="badge badge-foodwagon bg-primary p-4">
										<div class="d-flex flex-between-center">
											<div class="text-white fs-7">15</div>
											<div class="d-block text-white fs-2">
												% <br />
												<div class="fw-normal fs-1 mt-2">Off</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body px-0">
								<h5 class="fw-bold text-1000 text-truncate">Flat Hill
									Slingback</h5>
								<span class="badge bg-soft-danger py-2 px-3"><span
									class="fs-1 text-danger">6 days Remaining</span></span>
							</div>
							<a class="stretched-link" href="#"></a>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3 mb-3 mb-md-0 h-100 pb-4">
						<div class="card card-span h-100">
							<div class="position-relative">
								<img class="img-fluid rounded-3 w-100"
									src="<%=request.getContextPath()%>/resources/assets/img/gallery/discount-item-2.png" alt="..." />
								<div class="card-actions">
									<div class="badge badge-foodwagon bg-primary p-4">
										<div class="d-flex flex-between-center">
											<div class="text-white fs-7">10</div>
											<div class="d-block text-white fs-2">
												% <br />
												<div class="fw-normal fs-1 mt-2">Off</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body px-0">
								<h5 class="fw-bold text-1000 text-truncate">Ocean Blue Ring</h5>
								<span class="badge bg-soft-danger py-2 px-3"><span
									class="fs-1 text-danger">6 days Remaining</span></span>
							</div>
							<a class="stretched-link" href="#"></a>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3 mb-3 mb-md-0 h-100 pb-4">
						<div class="card card-span h-100">
							<div class="position-relative">
								<img class="img-fluid rounded-3 w-100"
									src="<%=request.getContextPath()%>/resources/assets/img/gallery/discount-item-3.png" alt="..." />
								<div class="card-actions">
									<div class="badge badge-foodwagon bg-primary p-4">
										<div class="d-flex flex-between-center">
											<div class="text-white fs-7">25</div>
											<div class="d-block text-white fs-2">
												% <br />
												<div class="fw-normal fs-1 mt-2">Off</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body px-0">
								<h5 class="fw-bold text-1000 text-truncate">Brown Leathered
									Wallet</h5>
								<span class="badge bg-soft-danger py-2 px-3"><span
									class="fs-1 text-danger">6 days Remaining</span></span>
							</div>
							<a class="stretched-link" href="#"></a>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3 mb-3 mb-md-0 h-100 pb-4">
						<div class="card card-span h-100">
							<div class="position-relative">
								<img class="img-fluid rounded-3 w-100"
									src="<%=request.getContextPath()%>/resources/assets/img/gallery/discount-item-4.png" alt="..." />
								<div class="card-actions">
									<div class="badge badge-foodwagon bg-primary p-4">
										<div class="d-flex flex-between-center">
											<div class="text-white fs-7">20</div>
											<div class="d-block text-white fs-2">
												% <br />
												<div class="fw-normal fs-1 mt-2">Off</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body px-0">
								<h5 class="fw-bold text-1000 text-truncate">Silverside
									Wristwatch</h5>
								<span class="badge bg-soft-danger py-2 px-3"><span
									class="fs-1 text-danger">6 days Remaining</span></span>
							</div>
							<a class="stretched-link" href="#"></a>
						</div>
					</div>
				</div>
			</div>
			<!-- end of .container-->

		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->




		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="py-0 bg-primary-gradient">

			<div class="container">
				<div class="row justify-content-center g-0">
					<div class="col-xl-9">
						<div class="col-lg-6 text-center mx-auto mb-3 mb-md-5 mt-4">
							<h5 class="fw-bold text-danger fs-3 fs-lg-5 lh-sm my-6">立即享用美食</h5>
						</div>
						<div class="row">
							<div class="col-sm-6 col-md-3 mb-6">
								<div class="text-center">
									<img class="shadow-icon" src="<%=request.getContextPath()%>/resources/assets/img/gallery/location.png"
										height="112" alt="..." />
									<h5 class="mt-4 fw-bold">選擇餐廳</h5>
									<p class="mt-4 fw-bold">確認餐廳位置，挑選喜愛的店</p>
								</div>
							</div>
							<div class="col-sm-6 col-md-3 mb-6">
								<div class="text-center">
									<img class="shadow-icon" src="<%=request.getContextPath()%>/resources/assets/img/gallery/order.png"
										height="112" alt="..." />
									<h5 class="mt-4 fw-bold">選擇餐點</h5>
									<p class="mt-4 fw-bold">把想吃的餐點加入購物車</p>
								</div>
							</div>
							<div class="col-sm-6 col-md-3 mb-6">
								<div class="text-center">
									<img class="shadow-icon" src="<%=request.getContextPath()%>/resources/assets/img/gallery/pay.png"
										height="112" alt="..." />
									<h5 class="mt-4 fw-bold">多元支付</h5>
									<p class="mt-4 fw-bold">快速且安全地進行線上付款</p>
								</div>
							</div>
							<div class="col-sm-6 col-md-3 mb-6">
								<div class="text-center">
									<img class="shadow-icon" src="<%=request.getContextPath()%>/resources/assets/img/gallery/meals.png"
										height="112" alt="..." />
									<h5 class="mt-4 fw-bold">享用美食</h5>
									<p class="mt-4 fw-bold">前往取餐並享受味蕾饗宴</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end of .container-->

		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->




		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="py-4 overflow-hidden">

			<div class="container">
				<div class="row h-100">
					<div class="col-lg-7 mx-auto text-center mt-7 mb-5">
						<h5 class="fw-bold fs-3 fs-lg-5 lh-sm">熱門餐點</h5>
					</div>
					<div class="col-12">
						<div class="carousel slide" id="carouselPopularItems"
							data-bs-touch="false" data-bs-interval="false">
							<div class="carousel-inner">
								<div class="carousel-item active" data-bs-interval="10000">

									<div class="row gx-3 h-100 align-items-center">

										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/cheese-burger.png" alt="..." />
												<div class="card-body ps-0">

													<h5 class="fw-bold text-1000 text-truncate mb-1">Cheese
														Burger</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Burger Arena</span>
													</div>
													<span class="text-1000 fw-bold">$3.88</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/toffes-cake.png" alt="..." />
												<div class="card-body ps-0">

													<h5 class="fw-bold text-1000 text-truncate mb-1">Toffe's
														Cake</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Top Sticks</span>
													</div>
													<span class="text-1000 fw-bold">$4.00</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/dancake.png" alt="..." />
												<div class="card-body ps-0">

													<h5 class="fw-bold text-1000 text-truncate mb-1">Dancake</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Cake World</span>
													</div>
													<span class="text-1000 fw-bold">$1.99</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/crispy-sandwitch.png" alt="..." />
												<div class="card-body ps-0">

													<h5 class="fw-bold text-1000 text-truncate mb-1">Crispy
														Sandwitch</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Fastfood Dine</span>
													</div>
													<span class="text-1000 fw-bold">$3.00</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>

										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/thai-soup.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Thai
														Soup</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Foody Man</span>
													</div>
													<span class="text-1000 fw-bold">$2.79</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>

									</div>
								</div>
								<div class="carousel-item" data-bs-interval="5000">
									<div class="row gx-3 h-100 align-items-center">
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/cheese-burger.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Cheese
														Burger</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Burger Arena</span>
													</div>
													<span class="text-1000 fw-bold">$3.88</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/toffes-cake.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Toffe's
														Cake</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Top Sticks</span>
													</div>
													<span class="text-1000 fw-bold">$4.00</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/dancake.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Dancake</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Cake World</span>
													</div>
													<span class="text-1000 fw-bold">$1.99</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/crispy-sandwitch.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Crispy
														Sandwitch</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Fastfood Dine</span>
													</div>
													<span class="text-1000 fw-bold">$3.00</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/thai-soup.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Thai
														Soup</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Foody Man</span>
													</div>
													<span class="text-1000 fw-bold">$2.79</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item" data-bs-interval="3000">
									<div class="row gx-3 h-100 align-items-center">
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/cheese-burger.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Cheese
														Burger</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Burger Arena</span>
													</div>
													<span class="text-1000 fw-bold">$3.88</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/toffes-cake.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Toffe's
														Cake</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Top Sticks</span>
													</div>
													<span class="text-1000 fw-bold">$4.00</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/dancake.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Dancake</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Cake World</span>
													</div>
													<span class="text-1000 fw-bold">$1.99</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/crispy-sandwitch.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Crispy
														Sandwitch</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Fastfood Dine</span>
													</div>
													<span class="text-1000 fw-bold">$3.00</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/thai-soup.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Thai
														Soup</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Foody Man</span>
													</div>
													<span class="text-1000 fw-bold">$2.79</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="row gx-3 h-100 align-items-center">
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/cheese-burger.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Cheese
														Burger</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Burger Arena</span>
													</div>
													<span class="text-1000 fw-bold">$3.88</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/toffes-cake.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Toffe's
														Cake</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Top Sticks</span>
													</div>
													<span class="text-1000 fw-bold">$4.00</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/dancake.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Dancake</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Cake World</span>
													</div>
													<span class="text-1000 fw-bold">$1.99</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/crispy-sandwitch.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Crispy
														Sandwitch</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Fastfood Dine</span>
													</div>
													<span class="text-1000 fw-bold">$3.00</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
										<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
											<div class="card card-span h-100 rounded-3">
												<img class="img-fluid rounded-3 h-100"
													src="<%=request.getContextPath()%>/resources/assets/img/gallery/thai-soup.png" alt="..." />
												<div class="card-body ps-0">
													<h5 class="fw-bold text-1000 text-truncate mb-1">Thai
														Soup</h5>
													<div>
														<span class="text-warning me-2"><i
															class="fas fa-map-marker-alt"></i></span><span
															class="text-primary">Foody Man</span>
													</div>
													<span class="text-1000 fw-bold">$2.79</span>
												</div>
											</div>
											<div class="d-grid gap-2">
												<a class="btn btn-lg btn-danger" href="#!" role="button">Order
													now</a>
											</div>
										</div>
									</div>
								</div> -->
							</div>
							<button class="carousel-control-prev carousel-icon" type="button"
								data-bs-target="#carouselPopularItems" data-bs-slide="prev">
								<span class="carousel-control-prev-icon hover-top-shadow"
									aria-hidden="true"></span><span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next carousel-icon" type="button"
								data-bs-target="#carouselPopularItems" data-bs-slide="next">
								<span class="carousel-control-next-icon hover-top-shadow"
									aria-hidden="true"></span><span class="visually-hidden">Next
								</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end of .container-->

		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->


		<section id="testimonial">
			<div class="container">
				<div class="row h-100">
					<div class="col-lg-7 mx-auto text-center mb-6">
						<h5 class="fw-bold fs-3 fs-lg-5 lh-sm mb-3">精選商家</h5>
					</div>
				</div>
				<div class="row gx-2">
					<div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
						<div class="card card-span h-100 text-white rounded-3">
							<img class="img-fluid rounded-3 h-100"
								src="<%=request.getContextPath()%>/resources/assets/img/gallery/food-world.png" alt="..." />
							<div class="card-img-overlay ps-0">
								<span class="badge bg-danger p-2 ms-3"><i
									class="fas fa-tag me-2 fs-0"></i><span class="fs-0">20%
										off</span></span><span class="badge bg-primary ms-2 me-1 p-2"><i
									class="fas fa-clock me-1 fs-0"></i><span class="fs-0">Fast</span></span>
							</div>
							<div class="card-body ps-0">
								<div class="d-flex align-items-center mb-3">
									<div class="flex-1 ms-3">
										<h5 class="mb-0 fw-bold text-1000">Food world</h5>
									</div>
								</div>
								<span class="badge bg-soft-danger p-2"><span
									class="fw-bold fs-1 text-danger">今日休息</span></span>
							</div>
						</div>
					</div>
					
					<div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
						<div class="card card-span h-100 text-white rounded-3">
							<img class="img-fluid rounded-3 h-100"
								src="<%=request.getContextPath()%>/resources/assets/img/gallery/donuts-hut.png" alt="..." />
							<div class="card-img-overlay ps-0">
								<span class="badge bg-danger p-2 ms-3"><i
									class="fas fa-tag me-2 fs-0"></i><span class="fs-0">15%
										off</span></span><span class="badge bg-primary ms-2 me-1 p-2"><i
									class="fas fa-clock me-1 fs-0"></i><span class="fs-0">Fast</span></span>
							</div>
							<div class="card-body ps-0">
								<div class="d-flex align-items-center mb-3">
									<div class="flex-1 ms-3">
										<h5 class="mb-0 fw-bold text-1000">Donuts hut</h5>
									</div>
								</div>
								<span class="badge bg-soft-success p-2"><span
									class="fw-bold fs-1 text-success">營業中</span></span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
						<div class="card card-span h-100 text-white rounded-3">
							<img class="img-fluid rounded-3 h-100"
								src="<%=request.getContextPath()%>/resources/assets/img/gallery/ruby-tuesday.png" alt="..." />
							<div class="card-img-overlay ps-0">
								<span class="badge bg-danger p-2 ms-3"><i
									class="fas fa-tag me-2 fs-0"></i><span class="fs-0">10%
										off</span></span><span class="badge bg-primary ms-2 me-1 p-2"><i
									class="fas fa-clock me-1 fs-0"></i><span class="fs-0">Fast</span></span>
							</div>
							<div class="card-body ps-0">
								<div class="d-flex align-items-center mb-3">
									<div class="flex-1 ms-3">
										<h5 class="mb-0 fw-bold text-1000">Ruby tuesday</h5>
									</div>
								</div>
								<span class="badge bg-soft-success p-2"><span
									class="fw-bold fs-1 text-success">營業中</span></span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
						<div class="card card-span h-100 text-white rounded-3">
							<img class="img-fluid rounded-3 h-100"
								src="<%=request.getContextPath()%>/resources/assets/img/gallery/red-square.png" alt="..." />
							<div class="card-img-overlay ps-0">
								<span class="badge bg-danger p-2 ms-3"><i
									class="fas fa-tag me-2 fs-0"></i><span class="fs-0">10%
										off</span></span><span class="badge bg-primary ms-2 me-1 p-2"><i
									class="fas fa-clock me-1 fs-0"></i><span class="fs-0">Fast</span></span>
							</div>
							<div class="card-body ps-0">
								<div class="d-flex align-items-center mb-3">
									<div class="flex-1 ms-3">
										<h5 class="mb-0 fw-bold text-1000">Kuakata Fried Chicken</h5>
									</div>
								</div>
								<span class="badge bg-soft-success p-2"><span
									class="fw-bold fs-1 text-success">營業中</span></span>
							</div>
						</div>
					</div>
					<div class="col-12 d-flex justify-content-center mt-5">
						<a class="btn btn-lg btn-primary" href="#!">查看所有商家<i
							class="fas fa-chevron-right ms-2"> </i></a>
					</div>
				</div>
			</div>
		</section>

		<section class="py-0">
			<div class="bg-holder"
				style="background-image: url(<%=request.getContextPath()%>/resources/assets/img/gallery/cta-two-bg.png); background-position: center; background-size: cover;">
			</div>
			<!--/.bg-holder-->

			<div class="container">
				<div class="row flex-center">
					<div class="col-xxl-9 py-7 text-center">
						<h1 class="fw-bold mb-4 text-white fs-6">
							想要內用聚餐嗎?
						</h1>
						<a class="btn btn-danger" href="#">現在去訂位<i
							class="fas fa-chevron-right ms-2"></i></a>
					</div>
				</div>
			</div>
		</section>


		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/frontFooter.jsp"%>
		<!--**********************************Footer end****************************************-->
		<!-- ===============================================-->
		<!--    JavaScripts-->
		<!-- ===============================================-->
		<script src="<%=request.getContextPath()%>/resources/vendors/@popperjs/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/vendors/bootstrap/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/vendors/is/is.min.js"></script>
		<script
			src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
		<script src="<%=request.getContextPath()%>/resources/vendors/fontawesome/all.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/assets/js/theme.js"></script>

		<link
			href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap"
			rel="stylesheet">
		<!-- JS============================================ -->
		<!-- Modernizer JS -->
		<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
		<!-- jQuery JS -->
		<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/jquery-3.3.1.min.js"></script>
		<!-- Popper JS -->
		<script src="<%=request.getContextPath()%>/resources/assets/js/popper.min.js"></script>
		<!-- Bootstrap JS -->
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
</body>

</html>