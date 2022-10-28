<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<title>管理</title>
<script>window.onload = function () {document.title = '套餐管理';};</script>
<style type="text/css">
	.btnCombo{
	  	background-color:#F3F3F9;
	  	border:2px #000000 solid;
	  	
	}

	.btnCombo:active{
	  	background-color:#484891;
	  	border:2px #484891 solid;
	}
	div{
		font-size:104%;
	}

</style>


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


			<!-- 這裡寫內容 -->
			<%@include file="../backendIncludes/product_combo_content_body.jsp"%>
			<!-- #/ container -->
			<!-- 內容結束 -->


		<!--**********************************Content body end**********************************-->



		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/footer.jsp"%>
		<!--**********************************Footer end****************************************-->
	</div>
	<!--**********************************Main wrapper end**************************************-->
	<!--**********************************Scripts***********************************************-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>


</body>
</html>
