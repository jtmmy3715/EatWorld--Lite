<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
String path = request.getContextPath();
%>
<!doctype html>
<html>
<head>
<%@include file="/resources/includes/head.jsp"%>
<title>管理</title>
<script>window.onload = function () {document.title = '會員管理';};</script>
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
		<div class="content-body" style="min-height: 884px;">

			<div class="row page-titles mx-0">

				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">會員管理</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">新增會員</a></li>
					</ol>
				</div>
			</div>


			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="form-validation">

									<!-- action -->
									<form:form class="form-valide" action="saveClientForm"
										method="post" id="ClientForm" enctype="multipart/form-data"
										modelAttribute="client">
										<div class="form-group row">
											<form:label path="clientUsername"
												class="col-lg-4 col-form-label" for="clientUsername">會員帳號
											<span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="clientUsername" type="text"
													class="form-control" id="clientUsername"
													name="clientUsername" />
											</div>
										</div>
										<div class="form-group row">
											<form:label path="clientPassword"
												class="col-lg-4 col-form-label" for="clientPassword">會員密碼
											<span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="clientPassword" type="text"
													class="form-control" id="clientPassword"
													name="clientPassword" />
											</div>
										</div>
										<div class="form-group row">
											<form:label path="clientName" class="col-lg-4 col-form-label"
												for="clientName">會員名稱
											<span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="clientName" type="text"
													class="form-control" id="clientName" name="clientName" />
											</div>
										</div>

										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-username">會員頭像
											<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<input type="file"
													class="form-control" id="clientLogo" name="clientLogo" />
											</div>
										</div>

										<div class="form-group row">
											<form:label path="clientMemberDetail.clientPhone"
												class="col-lg-4 col-form-label" for="val-username">會員電話
											<span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="clientMemberDetail.clientPhone"
													type="text" class="form-control" id="clientPhone"
													name="clientPhone" />
											</div>
										</div>
										<div class="form-group row">
											<form:label path="clientEmail"
												class="col-lg-4 col-form-label" for="val-username">會員信箱
											<span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="clientEmail" type="text"
													class="form-control" id="clientEmail" name="clientEmail" />
											</div>
										</div>

										<div class="form-group row">
											<form:label path="clientMemberDetail.clientBirthday"
												class="col-lg-4 col-form-label" for="val-username">會員生日
											<span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="clientMemberDetail.clientBirthday"
													type="date" class="form-control" id="clientBirthday"
													name="clientBirthday" />
											</div>
										</div>

										<div class="form-group row">
											<form:label path="clientMemberDetail.clientPoint"
												class="col-lg-4 col-form-label" for="val-username">紅利點數
											<span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="clientMemberDetail.clientPoint"
													type="text" class="form-control" id="clientPoint"
													name="clientPoint" />
											</div>
										</div>

										<div class="form-group row">
											<form:label path="clientMemberDetail.clientVip"
												class="col-lg-4 col-form-label" for="val-username">Vip等級
											<span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:input path="clientMemberDetail.clientVip" type="text"
													class="form-control" id="clientVip" name="clientVip" />
											</div>
										</div>

										<div class="form-group row">
											<form:label path="clientMemberDetail.clientVip"
												class="col-lg-4 col-form-label" for="val-username">會員權限
											<span class="text-danger">*</span>
											</form:label>
											<div class="col-lg-6">
												<form:select path="clientPermission" type="text"
													class="form-control" id="clientPermission" name="clientPermission">
													<option selected>請選擇會員權限</option>
													<form:option value="0">未驗證</form:option>
													<form:option value="1">已驗證</form:option>
													<form:option value="2">管理員</form:option>
												</form:select>
											</div>
										</div>

										<div class="form-group row">
											<div class="col-lg-8 ml-auto">
												<form:button type="submit" class="btn btn-primary"
													name="submit">送出</form:button>

												<button type="button" class="btn btn-primary"
													onclick="back();">返回</button>
												<button type="button" class="btn btn-primary " id="correct">一鍵輸入</button>
											</div>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- #/ container -->
		<!-- 內容結束 -->
		<!--**********************************Content body end**********************************-->
		<!--**********************************Footer start**************************************-->
		<%@include file="/resources/includes/footer.jsp"%>
		<!--**********************************Footer end****************************************-->
	</div>
	<!--**********************************Main wrapper end**************************************-->
	<!--**********************************Scripts***********************************************-->
	<%--<%@include file="/resources/includes/backendClientJS.jsp"%>
	<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/resources/js/clientForm.js"></script>--%>	
	<script src="<%=request.getContextPath()%>/plugins/common/common.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/custom.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/settings.js"></script>
	<script src="<%=request.getContextPath()%>/js/gleek.js"></script>
	<script	src="<%=request.getContextPath()%>/js/styleSwitcher.js"></script>
	<script	src="<%=request.getContextPath()%>/plugins/validation/jquery.validate.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="//cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://kit.fontawesome.com/98dd64d592.js" crossorigin="anonymous"></script>
	<script>
	function back(){
		  window.location.href = "clientList";
		 }
	
	(function($) {
	    'use strict';

	    $(document).ready(function() {
	        $(".bs-submit").click(function() {
	      
	          //Fetch form to apply custom Bootstrap validation
	          var form = $(".needs-validation")
	      
	          if (form[0].checkValidity() === false) {
	            event.preventDefault()
	            event.stopPropagation()
	          }

	          form.addClass('was-validated');
	      
	          //Make ajax call here
	      
	        })
	      });

	      
	    function isNumberKey(evt){
	        var charCode = (evt.which) ? evt.which : event.keyCode
	        if (charCode > 31 && (charCode < 48 || charCode > 57))
	            return false;
	        return true;
	    }




	    //to confirm input takes only number input
	    //use class ".shouldNumber" in your html <input type="text" /> element
	    $('.shouldNumber').on('keypress', function() {
	        return isNumberKey(event)
	    });

	  })(jQuery);
	jQuery("#ClientForm").validate({
        rules: {
      	  clientUsername: {
                required: true,
            },
            clientPassword: {
                required: true,
                minlength: 8
            },
            clientPhone: {
                required: true,
                digits:true, 
                maxlength: 10
            },
            clientEmail: {
                required: true,
                email: true
            },
            clientBirthday: {
                required: true,
            },
            clientPoint: {
                required: true,
                number: true
            },
            clientVip: {
                required: true,
                number: true

            }
        },
        messages: {
      	  clientUsername: {
                required: "帳號為必填",
            },
            clientPassword: {
                required: "密碼為必填",
                minlength:$.validator.format("密碼不得少於8個字")
            },
            clientPhone: {
          	  required: "電話為必填",
          	  digits:"電話格式不正確",
          	  maxlength:$.validator.format("電話格式不正確")
            },
            clientEmail: {
          	  required: "必填",
          	  email: "請輸入正確Email格式"
            },
            clientBirthday: {
          	  required: "必填",
            },
            clientPoint: {
          	  required: "必填",
          	  number: "只能輸入整數"
            },
            clientVip: {
          	  required: "必填",
          	  number: "只能輸入整數"
            }
          },
		
		 ignore: [],
		    errorClass: "invalid-feedback animated fadeInUp",
		    errorElement: "div",
		    errorPlacement: function(e, a) {
		        jQuery(a).parents(".form-group > div").append(e)
		    },
		    highlight: function(e) {
		        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")
		    },
		    success: function(e) {
		        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-valid")
		    }


		});
	</script>
	<script>
    $(function(){
		
		$('#correct').click(function (){
			
			$('#clientUsername').val("gina0810");
			$('#clientPassword').val("gina0810");
			$('#clientPhone').val("0929111222");
			$('#clientEmail').val("gina0810@gmail.com");
			$('#clientBirthday').val("1993-02-15");
			$('#clientPoint').val("222");
			$('#clientVip').val("3");
			
		})
	
		
	})
	</script>
</body>
</html>
