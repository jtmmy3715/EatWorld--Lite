<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>

<%@include file="/resources/includes/head.jsp"%>
<title>管理</title>
<script>window.onload = function () {document.title = '商品管理';};</script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
-->


<style type="text/css">
	.btnProduct{
	  	background-color:#FFFFFF;
	  	border:2px #000000 solid;
	  	
	}

	.btnProduct:hover{
	  	background-color:#7571F9;
	  	border:2px #7571F9 solid;
	  	
	}
	.btnProduct:focus{
	  	background-color:#7571F9;
	  	border:2px #7571F9 solid;
	  	color:#FFFFFF;
	}
	.btnProduct:active{
	  	background-color:#484891;
	  	border:2px #484891 solid;
	}
	.btnAdd{
	  	background-color:#FFFFFF;
	  	border:2px #000000 solid;
	}
	.btnAdd1{
	    display: inline-block;
	    font-weight: 400;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: middle;
	    user-select: none;
	    border: 2px solid ;
	    padding: 0.375rem 0.75rem;
	    font-size: 0.875rem;
	    line-height: 1.5;
	    border-radius: 0.25rem;
	    transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;

	}
	.btnAdd:hover{
	  	background-color:#7571F9;
	  	border:2px #7571F9 solid;
	  	
	}
	.btnAdd:active{
	  	background-color:#484891;
	  	border:2px #484891 solid;
	}
	.btnEdit{
	  	background-color:#FFFFFF;
	  	border:2px #000000 solid;
	  	border-radius:5px;
	}
	.btnEdit:hover{
	  	background-color:#7571F9;
	  	border:2px #7571F9 solid;
	}
	.btnEdit:active{
	  	background-color:#484891;
	  	border:2px #484891 solid;
	}
	.btnEdit:focus{
	  	background-color:#7571F9;
	  	border:2px #7571F9 solid;
	  	color:#FFFFFF;
	}
	.btn_start_sold{
		background-color:#7571F9;
		border:2px #7571F9 solid;
	}
	.btn_cancel_sold{
		background-color:#FF5151;
		border:2px #FF5151 solid;
	}
	
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
			<%@include file="../backendIncludes/product_content_body.jsp"%>
			<!-- #/ container -->
			<!-- 內容結束 -->


		<!--**********************************Content body end**********************************-->



	</div>
	<!--**********************************Main wrapper end**************************************-->
	<!--**********************************Footer start******************************************-->
	<%@include file="/resources/includes/footer.jsp"%>
	<!--**********************************Footer end********************************************-->
	<!--**********************************Scripts***********************************************-->
	<script src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
	<script src="${pageContext.request.contextPath}/js/styleSwitcher.js">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="//cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/bd205bf38d.js" crossorigin="anonymous"></script>


	
	<!--**********************************Scripts***********************************************-->
</body>
<script type="text/javascript">


</script>

</html>