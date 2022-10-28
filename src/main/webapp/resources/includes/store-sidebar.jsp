<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="nk-sidebar">
	<div class="nk-nav-scroll">
		<ul class="metismenu" id="menu">
			 <li class="nav-label">廠商後台系統</li>
					<li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">菜單管理</span>
                        </a>
                        <ul aria-expanded="false">
                        	<form action = "${pageContext.request.contextPath}/ProductController/initData" method="GET" enctype="text" id="initMenu">
								<!--  <input type = "hidden" value="initData" name = "action" >-->
                            	<li><a href="javascript:document:initMenu.submit();" aria-expanded="false">菜單</a> </li>
                        	</form>
                        	<form action = "${pageContext.request.contextPath}/ProductController/comboInit" method="get" enctype="text" id="initCombo">
								<!--<input type = "hidden" value="initComboData" name = "action" >-->
								<li><a href="javascript:document:initCombo.submit();" aria-expanded="false">套餐管理</a></li> 
                        	</form>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">訂單管理</span>
                        </a>
                        <ul aria-expanded="false">
                        
                            <li><a href="${pageContext.request.contextPath}/OrderController/backend/orders" aria-expanded="false">訂單</a></li>
                            
                        </ul>
                    </li>
                    
					<li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">預訂管理</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${pageContext.request.contextPath}/booking/storelist/${user.id}" aria-expanded="false">訂位管理</a></li>
                      
                        </ul>
                    </li>

					<li>
                       <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">部落格管理</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${pageContext.request.contextPath}/backendBlog/storelistpost/${user.id}" aria-expanded="false">文章管理</a></li>
                        </ul>
                    </li>
                    
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">優惠管理</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${pageContext.request.contextPath}/Event/storeStart" aria-expanded="false">廠商優惠管理</a></li>
                         
                        </ul>
                    </li>
		</ul>
	</div>
</div>