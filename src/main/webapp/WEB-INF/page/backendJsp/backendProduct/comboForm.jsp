<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<title>管理</title>
<script>window.onload = function () {document.title = '新增套餐';};</script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	.btnComboProductAdd{
		display: inline-block;
	    font-weight: 150;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: middle;
	    user-select: none;
	    padding: 0.15rem 0.35rem;
	    font-size: 0.4rem;
	    line-height: 1.5;
	    border-radius: 0.25rem;
		background-color:#FFFFFF;
	  	border:2px #000000 solid;
	}
	
	.btnComboProductAdd:hover{
	  	background-color:#7571F9;
	  	border:2px #7571F9 solid;
	}
	.btnComboProductAdd:active{
	  	background-color:#7571F9;
	  	border:2px #7571F9 solid;
	  	color:#FFFFFF;
	}
	.btnDelete{
		display: inline-block;
	    font-weight: 150;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: middle;
	    user-select: none;
	    padding: 0.15rem 0.35rem;
	    font-size: 0.4rem;
	    line-height: 1.5;
	    border-radius: 0.25rem;
		background-color:#FFFFFF;
	  	border:2px #000000 solid;
	}
	
	.btnDelete:hover{
	  	background-color:#7571F9;
	  	border:2px #7571F9 solid;
	}
	.btnDelete:active{
	  	background-color:#7571F9;
	  	border:2px #7571F9 solid;
	  	color:#FFFFFF;
	}   	
	div{
		font-size:103%;
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
		<!--**********************************Content body start********************************-->


			<!-- 這裡寫內容 -->
			<%@include file="../backendIncludes/combo_content_form.jsp"%>
			<!-- #/ container -->
			<!-- 內容結束 -->


		<!--**********************************Content body end**********************************-->



		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/footer.jsp"%>
		<!--**********************************Footer end****************************************-->
	</div>
	<!--**********************************Main wrapper end**************************************-->
	<!--**********************************Scripts***********************************************-->
	<script src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
	<script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>
	
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/bd205bf38d.js" crossorigin="anonymous"></script>

<script>

</script>

</body>
</html>
