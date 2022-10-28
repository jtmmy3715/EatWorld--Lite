<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<title>管理</title>
<script>window.onload = function () {document.title = '新增商品';};</script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
			<%@include file="../backendIncludes/product_content_body_form.jsp"%>
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

<script>

</script>

</body>
</html>
