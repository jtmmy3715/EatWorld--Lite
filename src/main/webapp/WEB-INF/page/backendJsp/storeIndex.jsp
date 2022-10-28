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
<style></style>

</head>
<body>


	<!--**********************************Main wrapper start***********************************-->
	<div id="main-wrapper">



		<!--**********************************Nav header start**********************************-->
		<%@include file="/resources/includes/store-navheader.jsp"%>
		<!--**********************************Nav header end************************************-->
		<!--**********************************Header start**************************************-->
		<%@include file="/resources/includes/store-header.jsp"%>
		<!--**********************************Header end ti-comment-alt*************************-->
		<!--**********************************Sidebar start*************************************-->
		<%@include file="/resources/includes/store-sidebar.jsp"%>
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
                        <input type="hidden" id="store_id" value="${user.id}"/>
                            <div class="card-body">
                                <h3 class="card-title text-white"><b>總營業額</b></h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white" id="id_h2_total_amount">0</h2>
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
                                    <h2 class="text-white" id="id_h2_order">0</h2>
                                    <p class="text-white mb-0">Jan - October 2022</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-3">
                            <div class="card-body">
                                <h3 class="card-title text-white"><b>總訂位數</b></h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white" id="booking">4565</h2>
                                    <p class="text-white mb-0">Jan - October 2022</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-clipboard"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-4">
                            <div class="card-body">
                                <h3 class="card-title text-white"><b>會員收藏數</b></h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white" id="collection">6</h2>
                                    <p class="text-white mb-0">Jan - October 2022</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
                            </div>
                        </div>
                    </div>
                </div>

               <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body pb-0 d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-1"><b>商品銷售額</b></h4>
                                            <p>每季銷售統計</p>
                                            <!-- 
                                            <h3 class="m-0">$ 12,555</h3> -->
                                        </div>
                                        <!--  
                                        <div>
                                            <ul>
                                                <li class="d-inline-block mr-3"><a class="text-dark" href="#">Day</a></li>
                                                <li class="d-inline-block mr-3"><a class="text-dark" href="#">Week</a></li>
                                                <li class="d-inline-block"><a class="text-dark" href="#">Month</a></li>
                                            </ul>
                                        </div>
                                        -->
                                    </div>
                                    <div class="chart-wrapper">
                                        <canvas id="id_chart_order"></canvas>
                                    </div>
                                    <!--  
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <div class="w-100 mr-2">
                                                <h6>好吃漢堡</h6>
                                                <div class="progress" style="height: 6px">
                                                    <div class="progress-bar bg-danger" style="width: 40%"></div>
                                                </div>
                                            </div>
                                            <div class="ml-2 w-100">
                                                <h6>麥味登早餐</h6>
                                                <div class="progress" style="height: 6px">
                                                    <div class="progress-bar bg-primary" style="width: 80%"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    -->
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
	<
	 <div class="content-body" style="visibility: hidden">

            <div class="container-fluid mt-3">

                <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Order Summary</h4>
                                    <div id="morris-bar-chart"></div>
                                </div>
                            </div>
                            
                        </div>    
                        <div class="col-lg-3 col-md-6">
                            <div class="card card-widget">
                                <div class="card-body">
                                    <h5 class="text-muted">Order Overview </h5>
                                    <h2 class="mt-4">5680</h2>
                                    <span>Total Revenue</span>
                                    <div class="mt-4">
                                        <h4>30</h4>
                                        <h6>Online Order <span class="pull-right">30%</span></h6>
                                        <div class="progress mb-3" style="height: 7px">
                                            <div class="progress-bar bg-primary" style="width: 30%;" role="progressbar"><span class="sr-only">30% Order</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <h4>50</h4>
                                        <h6 class="m-t-10 text-muted">Offline Order <span class="pull-right">50%</span></h6>
                                        <div class="progress mb-3" style="height: 7px">
                                            <div class="progress-bar bg-success" style="width: 50%;" role="progressbar"><span class="sr-only">50% Order</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <h4>20</h4>
                                        <h6 class="m-t-10 text-muted">Cash On Develery <span class="pull-right">20%</span></h6>
                                        <div class="progress mb-3" style="height: 7px">
                                            <div class="progress-bar bg-warning" style="width: 20%;" role="progressbar"><span class="sr-only">20% Order</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-0">
                                    <h4 class="card-title px-4 mb-3">Todo</h4>
                                    <div class="todo-list">
                                        <div class="tdl-holder">
                                            <div class="tdl-content">
                                                <ul id="todo_list">
                                                    <li><label><input type="checkbox"><i></i><span>Get up</span><a href='#' class="ti-trash"></a></label></li>
                                                    <li><label><input type="checkbox" checked><i></i><span>Stand up</span><a href='#' class="ti-trash"></a></label></li>
                                                    <li><label><input type="checkbox"><i></i><span>Don't give up the fight.</span><a href='#' class="ti-trash"></a></label></li>
                                                    <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
                                                </ul>
                                            </div>
                                            <div class="px-4">
                                                <input type="text" class="tdl-new form-control" placeholder="Write new item and hit 'Enter'...">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                


                <div class="row">
                    <div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6">

                        <div class="card">
                            <div class="chart-wrapper mb-4">
                                <div class="px-4 pt-4 d-flex justify-content-between">
                                    <div>
                                        <h4>Sales Activities</h4>
                                        <p>Last 6 Month</p>
                                    </div>
                                    <div>
                                        <span><i class="fa fa-caret-up text-success"></i></span>
                                        <h4 class="d-inline-block text-success">720</h4>
                                        <p class=" text-danger">+120.5(5.0%)</p>
                                    </div>
                                </div>
                                <div>
                                        <canvas id="chart_widget_3"></canvas>
                                </div>
                            </div>
                            <div class="card-body border-top pt-4">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <ul>
                                            <li>5% Negative Feedback</li>
                                            <li>95% Positive Feedback</li>
                                        </ul>
                                        <div>
                                            <h5>Customer Feedback</h5>
                                            <h3>385749</h3>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div id="chart_widget_3_1"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Activity</h4>
                                <div id="activity">
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="./images/avatar/1.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>Received New Order</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="./images/avatar/2.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>iPhone develered</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="./images/avatar/2.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>3 Order Pending</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="./images/avatar/2.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>Join new Manager</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="./images/avatar/2.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>Branch open 5 min Late</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="./images/avatar/2.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>New support ticket received</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media pt-3 pb-3">
                                        <img width="35" src="./images/avatar/3.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>Facebook Post 30 Comments</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-12 col-sm-12 col-xxl-12">
                        <div class="card">
                            <div class="card-body">
                                    <h4 class="card-title mb-0">Store Location</h4>
                                <div id="world-map" style="height: 470px;"></div>
                            </div>        
                        </div>
                    </div>
                </div>

                
            </div>
            <!-- #/ container -->
        </div>
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
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11">
	</script>
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

	<!-- jQuery JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/jquery-3.3.1.min.js"></script>

    <script src="<%=request.getContextPath()%>/js/dashboard/dashboard-1.js"></script>
	<!--**********************************Scripts***********************************************-->

<script type="text/javascript">
var order_ctx=$('#id_chart_order');


$(function(){
	chart_order();
	chart_order_Inf()
	var sid = $('#store_id').val();
	console.log('sid: ' +sid);
	//訂位數量
	$.ajax(
		{
		type: 'get',
		url: './booking/storecount/' + sid,
		dataType: 'json',
		content: 'application/json',
		success: function(data){
			console.log('訂位數量: ' + data);
			$('#booking').text(data);
			},
		error: function(e){
			console.log('error: ' + e);
			console.log(e);
			$('#booking').text('0');
			}
		}	
	);
	
	countCollection();
	function countCollection(){
		
		$.ajax({
			url : "${pageContext.request.contextPath}/clientMember/countCollection",
			type : 'POST',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			data: { 
				storeId: ${user.id}
			},
			success : function(data) {
				console.log("collection:"+data);
				$("#collection").text(data);
			}	
		});
	}
	
});

function chart_order_Inf(){
	/* orderInfList
	 * 陣列0是商品總銷售額
	 * 陣列1是商品訂單數
	 */
	$.getJSON({
		type:"POST",
		url:"/EatWorld/OrderController/findAllOrderInf",
		async:"true",
		success:function(data){
			console.log("JQUERY讀取訂單資訊連線成功");
			$('#id_h2_total_amount').text(data[0])
			$('#id_h2_order').text(data[1]);

		},error:function(data){
			console.log("讀取訂單資訊失敗");
		}
	});

}

function chart_order(){
	//更新購物車內商品顯示
		
		$.getJSON({
			type:"POST",
			url:"/EatWorld/OrderController/findThisYearOrderAllQuarterly",
			async:"true",
			success:function(thisData){
				console.log("JQUERY讀取訂單總金額連線成功");
				$.getJSON({
					type:"POST",
					url:"/EatWorld/OrderController/findLastYearOrderAllQuarterly",
					async:"false",
					success:function(lastData){
						console.log("JQUERY讀取去年訂單總金額連線成功");
						console.log(lastData);
						orderChartJS(thisData,lastData);
						
			
					},error:function(data){
						console.log("讀取去年訂單總金額失敗");
					}
				});
				
	
			},error:function(data){
				console.log("讀取訂單總金額失敗");
			}
		});
	
}

function orderChartJS(thisData,lastData){
	 console.log(lastData[0]);       
	 console.log(lastData[1]);       
	 console.log(lastData[2]);       
	 console.log(lastData[3]) ;
	
	var myChart = new Chart(order_ctx, {
		  type: 'bar', //圖表類型
		  data: {
		    //標題
		    labels: ['Q1', 'Q2', 'Q3', 'Q4'],
		    datasets: [{
		      label: '去年營業額', //標籤
		      data: [lastData[0],lastData[1],lastData[2],lastData[3]], //資料
		      //圖表背景色
		      backgroundColor: [
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(54, 162, 235, 0.2)'
		      ],
		      //圖表外框線色
		      borderColor: [
		        'rgba(54, 162, 235, 1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(54, 162, 235, 1)'
		      ],
		      //外框線寬度
		      borderWidth: 1
		    },{
			      label: '今年營業額', //標籤
			      data: [thisData[0],thisData[1] ,thisData[2], thisData[3]], //資料
			      //圖表背景色
			      backgroundColor: [
			        'rgba(255, 99, 132, 0.2)',
			        'rgba(255, 99, 132, 0.2)',
			        'rgba(255, 99, 132, 0.2)',
			        'rgba(255, 99, 132, 0.2)',
			      ],
			      //圖表外框線色
			      borderColor: [
			        'rgba(255, 99, 132, 1)',
			        'rgba(255, 99, 132, 1)',
			        'rgba(255, 99, 132, 1)',
			        'rgba(255, 99, 132, 1)'
			      ],
			      //外框線寬度
			      borderWidth: 1
			    }]
		  },
		  options: {
			 
		    scales: {
		      yAxes: [{
		        ticks: {
		          beginAtZero: true,
		          responsive: true //符合響應式
		        }
		      }],
		      x:{
	        	title:{
	            	display:true,
	                text:"月"
	                }
		      }

		    }
		  }
		});
	
}
	



</script>


</body>


</html>