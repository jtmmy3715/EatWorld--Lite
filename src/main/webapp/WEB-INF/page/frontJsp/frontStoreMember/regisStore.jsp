<%@page import="java.util.List" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
				<!doctype html>
				<html class="no-js" lang="en">

				<head>
					<title>註冊廠商</title>
					<%@include file="/resources/includes/frontHead.jsp" %>
						<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />


</head>

				<body>
					<div class="main-wrapper wrapper-2">
						<!--**********************************Header start**************************************-->
						<%@include file="/resources/includes/frontHeader.jsp" %>
							<!--**********************************Header end****************************************-->
							<div class="breadcrumb-area pt-95 pb-100 bg-img"
								style="background-image: url(<%=request.getContextPath()%>/resources/assets/images/bg/storereg.png);">
								<div class="container">
									<div class="breadcrumb-content text-center">
										<div class="breadcrumb-title">
											<h2>註冊商家</h2>
										</div>
										<ul>
											<li><a href="frontIndex.html">Home</a></li>
											<li class="active">Reg Shop</li>
										</ul>
									</div>
								</div>
							</div>

							<div class="login-register-area pt-100 pb-100">
								<div class="container">
									<div class="row">
										<div class="col-lg-7 col-md-12 ml-auto mr-auto">
											<div class="login-register-wrapper">
												<div class="login-register-tab-list nav"></div>
												<div class="tab-content">
													<div id="lg1" class="tab-pane active">
														<div class="login-form-container"">
															<div style="text-align: center;">
																<h4>註冊商家</h4>
																<div class="ui negative message" >
    																<p style="color: red;">${message}</p>
																</div>
															</div>
															<div class="login-register-form">
																<div class="form-validation">
																
																	
																	<form class="mt-5 mb-5 login-input form-valide needs-validation" id="register" action="saveReg" method="post"
    novalidate>
    <div class="form-group">
		
        <div>
        	<label for="sUsername">商家帳號</label><span class="text-danger">*</span>
            <input type="text" class="form-control sUsername" id="sUsername" name="sUsername"
                placeholder="帳號請設定8至16位，且由字母和數字組成" required />
            <div id="username-valid" class="valid-feedback">此帳號可使用</div>
            <div id="username-validation" class="invalid-feedback">
                帳號6位以上，且不得有特殊符號</div>
        </div>
        

        <div class="form-group">
            <label for="sPwd">密碼</label><span class="text-danger">*</span>
            <div class="input-group">
                <input type="password" class="form-control" id="sPwd" name="sPwd" placeholder="密碼請設定8至16位，且由字母和數字組成"
                    required />
                
                <div id="pwd-validation" class="invalid-feedback">
                    密碼6位以上，且不得有特殊符號</div>
            </div>
        </div>

        <div class="form-group">
            <div>
            	<label for="sName">商家名稱</label><span class="text-danger">*</span>
                <input type="text" class="form-control" id="sName" name="sName" placeholder="請輸入商家名稱" required />
                <div id="name-validation" class="invalid-feedback">必填欄位</div>
            </div>
        </div>

        <div class="form-group">
            <div>
            	<label for="sPhone">商家電話</label><span class="text-danger">*</span>
                <input type="text" class="form-control" id="sPhone" name="sPhone" placeholder="請輸入電話格式:(0x-xxxxxxx)" required />
                <div id="phone-validation" class="invalid-feedback">必填欄位</div>
            </div>
        </div>
        
        <div class="form-group">
            <div>
            	<label for="sAddress">商家地址</label><span class="text-danger">*</span>
                <input type="text" class="form-control" id="sAddress" name="sAddress" placeholder="輸入地址"
                     required/>
                
            </div>
            
        </div>

        <div class="form-group">
            <div>
            	<label for="sEmail">商家信箱</label><span class="text-danger">*</span>
                <input type="text" class="form-control" id="sEmail" name="sEmail" placeholder="輸入Email"
                    required />
                
                <div id="email-valid" class="valid-feedback">此信箱可使用</div>
                <div id="email-validation" class="invalid-feedback">
                    至少要有小老鼠吧</div>
                    <input type="button" id="getcode" class="ui grey label" value="傳送驗證碼">
            </div>
        </div>
		
		<!--  <div class="code field"  style="display:none" > -->
		<div class="code field">
                             <div class="ui left icon input">
                                 <i class="check square outline icon"></i>
                                 <input type="text" name="identify" id="identify" placeholder="驗證碼">
                             </div>
                         </div>
        
        <div class="form-group">
            <div>
            	<label for="sIntroduction">商家簡介</label><span class="text-danger">*</span>
                <input type="text" class="form-control" id="sIntroduction" name="sIntroduction" placeholder="輸入簡介"
                     required/>
                
            </div>
            
        </div>
        <div class="form-group">
            <div>
            <label for="openTime">營業&打烊時間(時:分)</label>
                <input type="time" class="form-control" id="openTime" name="openTime" placeholder="營業時間(時:分)" required/>
            </div>
        </div>
        <div class="form-group">
            <div>
                <input type="time" class="form-control" id="endTime" name="endTime" placeholder="打烊時間(時:分)" required/>
            </div>
        </div>
        
          <div class="form-group row">
            <label  class="col-lg-4 col-form-label" for="sCategory">商家分類
                
            </label>
            <div>
                <select  type="text" class="form-control" id="sCategory"
                    name="sCategory" >
                    <option selected>請選擇您的餐廳類型</option>
                    <option value="4">速食</option>
                    <option value="5">下午茶</option>
                    <option value="6">飲料</option>
                    <option value="7">美式</option>
                    <option value="8">中式</option>
                    <option value="9">泰式</option>
                    <option value="10">義式</option>
                    <option value="11">日式</option>
                    <option value="12">早午餐</option>
                    <option value="14">小吃</option>
                </select>
            </div>
        </div> 
        

        <div class="button-box" style="text-align: center;">
            <button type="submit">註冊</button>
            <button type="button" id="data">一鍵輸入</button>
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
							</div>

							<!--**********************************Footer start**************************************-->
							<%@include file="/resources/includes/frontFooter.jsp" %>
								<!--**********************************Footer end****************************************-->
					</div>
					<!-- JS============================================ -->
					<!-- Modernizer JS -->
					<script
						src="<%=request.getContextPath()%>/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
					<!-- jQuery JS -->
					<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/jquery-3.3.1.min.js"></script>
					<!-- Popper JS -->
					<script src="<%=request.getContextPath()%>/resources/assets/js/popper.min.js"></script>
					<!-- Bootstrap JS -->
					<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/bootstrap.min.js"></script>
					<!-- Slick Slider JS -->
					<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/countdown.js"></script>
					<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/counterup.js"></script>
					<!--<script src="assets/js/plugins/instafeed.js"></script>-->
					<script src="<%=request.getContextPath()%>/resources/assets/js/plugins/jquery-ui.js"></script>
					<script
						src="<%=request.getContextPath()%>/resources/assets/js/plugins/jquery-ui-touch-punch.js"></script>
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
					<script src="<%=request.getContextPath()%>/resources/plugins/common/common.min.js"></script>
					<script src="<%=request.getContextPath()%>/resources/js/custom.min.js"></script>
					<script src="<%=request.getContextPath()%>/resources/js/settings.js"></script>
					<script src="<%=request.getContextPath()%>/resources/js/gleek.js"></script>
					<script src="<%=request.getContextPath()%>/resources/js/styleSwitcher.js"></script>
					
					<script	src="<%=request.getContextPath()%>/resources/plugins/validation/jquery.validate.min.js"></script>

					<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
					<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
					
					
					<script>
						document.querySelector('#sUsername').addEventListener('blur',
							validateUsername);
						document.querySelector('#sPwd').addEventListener('blur',
							validatePwd);
						//document.querySelector('#confirmPwd').addEventListener('blur',
							//validateConfirmPwd);
						document.querySelector('#sName').addEventListener('blur',
							validateName);
						document.querySelector('#sEmail').addEventListener('blur',
							validateEmail);

						const reSpaces = /^\S*$/; //不能為空或者空白鍵

						function validateUsername(e) {
							const uName = document.querySelector('#sUsername');
							const re = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;

							if (reSpaces.test(uName.value) && re.test(uName.value)) {

								checkUsername();

							} else {
								document.querySelector('#username-valid').innerHTML = "";
								document.querySelector('#username-validation').innerHTML = "帳號請設定8至16位，且由字母和數字組成";
								uName.classList.add('is-invalid');
								uName.classList.remove('is-valid');

								return false;
							}
						}

						function validatePwd(e) {
							const pwd = document.querySelector('#sPwd');
							const re = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;

							if (reSpaces.test(pwd.value) && re.test(pwd.value)) {
								pwd.classList.remove('is-invalid');
								pwd.classList.add('is-valid');

								return true;
							} else {
								pwd.classList.add('is-invalid');
								pwd.classList.remove('is-valid');

								return false;
							}
						}

						function validateConfirmPwd(e) {
							const pwd = document.querySelector('#sPwd');
							const cPwd = document.querySelector('#confirmPwd');

							if ((cPwd.value) == (pwd.value)) {
								cPwd.classList.remove('is-invalid');
								cPwd.classList.add('is-valid');

								return true;
							} else {
								cPwd.classList.add('is-invalid');
								cPwd.classList.remove('is-valid');

								return false;
							}
						}

						function validateName(e) {
							const name = document.querySelector('#sName');

							if (reSpaces.test(name.value) && name != '') {
								name.classList.remove('is-invalid');
								name.classList.add('is-valid');

								return true;
							} else {
								name.classList.add('is-invalid');
								name.classList.remove('is-valid');

								return false;
							}
						}

						function validateEmail(e) {
							const email = document.querySelector('#sEmail');
							const re = /^([a-zA-Z0-9_\-?\.?]){3,}@([a-zA-Z]){3,}\.([a-zA-Z]){2,5}$/;

							if (reSpaces.test(email.value) && re.test(email.value)) {
								email.classList.remove('is-invalid');
								email.classList.add('is-valid');

								checkEmail();

							} else {
								document.querySelector('#email-valid').innerHTML = "";
								document.querySelector('#email-validation').innerHTML = "請輸入正確Email格式";
								email.classList.add('is-invalid');
								email.classList.remove('is-valid');

								return false;
							}
						}

						(function () {
							'use strict'

							// Fetch all the forms we want to apply custom Bootstrap validation styles to
							var forms = document.querySelectorAll('.needs-validation')

							// Loop over them and prevent submission
							Array.prototype.slice.call(forms).forEach(
								function (form) {
									form.addEventListener('submit', function (event) {
										if (!form.checkValidity() || !validateUsername()
											|| !validatePwd() || !validateConfirmPwd()
											|| !validateName() || !validateEmail()) {
											event.preventDefault()
											event.stopPropagation()
										}

										form.classList.add('was-validated')
									}, false)
								})
						})()
					</script>
					<script>
					$('#getcode').click(function(){

					    //发送验证码
					    var email = $("#sEmail").val();
					    if(email==""){
					        return;
					    }
					    alert("驗證碼已傳送，請查看信箱");
					    
					    //ajax实现后台邮箱的发送
					    $.ajax({
					        //url路径
					        url: "${pageContext.request.contextPath}/store/sendEmail",
					        //data请求数据
					        data: {"email": email},
					        //dataType json
					        type: "post",
					        //回调函数
					        success: function (data) {
					        	console.log(data);
					            //回调函数 data 返回流
					            if (data == "failure") {
					                alert("傳送失敗");
					            }
					            else if (data=="false"){
					                alert("信箱不存在，請檢查信箱地址是否正確");
					            }
					          //  else{

					           // }
					        }
					    });


					});
					</script>
					
    <script>
        $(function () {

            $('#data').click(function () {

                $('#sUsername').val("liolaoda55");
                $('#sPwd').val("test12345");
                $('#sPhone').val("05-555444");
                $('#sName').val("超有料老大");
                $('#sEmail').val("yunchieh1997@gmail.com");
                $('#openTime').val("10:00");
                $('#endTime').val("20:00");
                $('#sIntroduction').val("真的是太好喝了");
                $('#sAddress').val("桃園市桃園區中正路45號");
                $('#sCategory').val(6);
                
            })

        })
    </script>

				</body>

				</html>