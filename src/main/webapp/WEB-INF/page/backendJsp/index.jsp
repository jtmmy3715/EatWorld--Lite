<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
%>
<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<title>管理</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>


	<!--**********************************Main wrapper start***********************************-->
	<div id="main-wrapper">



		<!--**********************************Nav header start**********************************-->
		<%@include file="/resources/includes/nav-header.jsp"%>
		<!--**********************************Nav header end************************************-->
		<!--**********************************Header start**************************************-->
		<%@include file="/resources/includes/header.jsp"%>
		<!--**********************************Header end ti-comment-alt*************************-->
		<!--**********************************Sidebar start*************************************-->
		<%@include file="/resources/includes/nk-sidebar.jsp"%>
		<!--**********************************Sidebar end***************************************-->
		<!--**********************************Content body start********************************-->


			<!-- 這裡寫內容 -->
			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">EatWorld</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">首頁</a></li>
					</ol>
				</div>
			</div>
			
		
<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container-fluid mt-3">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-1">
                            <div class="card-body">
                                <h3 class="card-title text-white"><b>總營業額</b></h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">456500</h2>
                                    <p class="text-white mb-0">Jan - October 2022</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-money"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-2">
                            <div class="card-body">
                                <h3 class="card-title text-white"><b>總訂單數</b></h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">131</h2>
                                    <p class="text-white mb-0">Jan - October 2022</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-3">
                            <div class="card-body">
                                <h3 class="card-title text-white"><b>總會員數</b></h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white" id="member"></h2>
                                    <p class="text-white mb-0">Jan - October 2022</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-4">
                            <div class="card-body">
                                <h3 class="card-title text-white"><b>總商家數</b></h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white" id="store"></h2>
                                    <p class="text-white mb-0">Jan - October 2022</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa-solid fa-store"></i></span>
                            </div>
                        </div>
                    </div>
                </div>

               <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-6">
                                <div class="card">
                                    <div class="card-body pb-0 d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-1"><b>會員及商家統計圖</b></h4>
                                        </div>
                                    </div>
                                    <div class="chart-wrapper card-body ">
                                         <canvas id="barChart"></canvas>
                                    </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                <div class="card">
                                    <div class="card-body pb-0 d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-1"><b>會員分級統計圖</b></h4>
                                        </div>
                                    </div>
                                    <div class="chart-wrapper card-body ">
                                         <canvas id="Chart"></canvas>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
			<!-- #/ container -->
			<!-- 內容結束 -->

		</div>
		<!--**********************************Content body end**********************************-->
	</div>
            <!-- #/ container -->
        <!--**********************************
            Content body end
        ***********************************-->
	<!--**********************************Main wrapper end**************************************-->
	<!--**********************************Footer start******************************************-->
	<%@include file="/resources/includes/footer.jsp"%>
	<!--**********************************Footer end********************************************-->
	<!--**********************************Scripts***********************************************-->
	<script src="<%=request.getContextPath()%>/plugins/common/common.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/custom.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/settings.js"></script>
	<script src="<%=request.getContextPath()%>/js/gleek.js"></script>
	<script src="<%=request.getContextPath()%>/js/styleSwitcher.js">
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- Chartjs -->
    <script src="<%=request.getContextPath()%>/plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="<%=request.getContextPath()%>/plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="<%=request.getContextPath()%>/plugins/d3v3/index.js"></script>
    <script src="<%=request.getContextPath()%>/plugins/topojson/topojson.min.js"></script>
    <script src="<%=request.getContextPath()%>/plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="<%=request.getContextPath()%>/plugins/raphael/raphael.min.js"></script>
    <script src="<%=request.getContextPath()%>/plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="<%=request.getContextPath()%>/plugins/moment/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="<%=request.getContextPath()%>/plugins/chartist/js/chartist.min.js"></script>
    <script src="<%=request.getContextPath()%>/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/dashboard/dashboard-1.js"></script>
    <script src="https://kit.fontawesome.com/98dd64d592.js" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!--**********************************Scripts***********************************************-->
	<script>
	$(function(){
	countVip();
	countReg();
	countMember();
	countStore();
	});
	
	function countVip(){	
		$.ajax({
			url : "${pageContext.request.contextPath}/clientMember/countVip",
			type : 'POST',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				count1(data);
				}	
			});
	}
	
	function count1(data){

		const data1 = {
		  labels: ['VIP1','VIP2','VIP3','VIP4','VIP5'],
		  datasets: [{
			    label: '會員分級',
			    data: [data[0],data[1],data[2],data[3],data[4]],
			    backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)'
			    ],
			    hoverOffset: 4
			  }]
		};
		  
		const config1 = {
				  type: 'doughnut',
				  data: data1,
				};
		  
		const myChart1 = new Chart(
			      document.getElementById('Chart'),
			      config1
			    );
	} 
	
	function countReg(){	
		$.ajax({
			url : "${pageContext.request.contextPath}/clientMember/countReg",
			type : 'POST',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				console.log(data);
				count2(data);
				}	
			});
	}
	
	function count2(data2){
	const data = {
			  labels: ['Q1','Q2','Q3','Q4'],
			  datasets: [
			    {
			      label: '會員註冊',
			      data: [data2[0],data2[1],data2[2],data2[3]],
			      borderColor: 'rgba(255, 26, 104, 1)',
			      backgroundColor: 'rgba(255, 26, 104, 0.2)',
			    },
			    {
			      label: '商家註冊',
			      data: [data2[4],data2[5],data2[6],data2[7]],
			      borderColor: 'rgba(54, 162, 235, 1)',
			      backgroundColor: 'rgba(54, 162, 235, 0.2)',
			    }
			  ]
			};
			  
			  
			  const config = {
					  type: 'bar',
					  data,
					  options: {
					    scales: {
					    	 yAxes: [{
					                ticks: {
					                	min:0,
					                	max:8
					                }
					            }]
					    }
					  },
					};
			  
			  const myChart = new Chart(
				      document.getElementById('barChart'),
				      config
				    );
	}
	
	function countMember(){
		$.ajax({
			url : "${pageContext.request.contextPath}/clientMember/countMember",
			type : 'POST',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				var a = data;
				$("#member").text(data);
			}	
		});
	}
	
	function countStore(){
		$.ajax({
			url : "${pageContext.request.contextPath}/clientMember/countStore",
			type : 'POST',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				var a = data;
				$("#store").text(data);
			}	
		});
	}
</script>
</body>
</html>