<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="nk-sidebar">
	<div class="nk-nav-scroll">
		<ul class="metismenu" id="menu">
			
			 <li class="nav-label">管理員後台系統</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">會員管理</span>
                        </a>
                        <ul aria-expanded="false">
                             <li><a href="${pageContext.request.contextPath}/clientMember/clientList" aria-expanded="false">所有會員</a></li>
                             <li><a href="${pageContext.request.contextPath}/store/storeList" aria-expanded="false">所有餐廳</a></li>
                        </ul>
                    </li>
					
					<!--  
					<li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">菜單管理</span>
                        </a>
                        <ul aria-expanded="false">
                        	<form action = "${pageContext.request.contextPath}/ProductController/initData" method="GET" enctype="text" id="initMenu">
								<!--  <input type = "hidden" value="initData" name = "action" >--><!--  
                            	<li><a href="javascript:document:initMenu.submit();" aria-expanded="false">菜單</a> </li>
                        	</form>
                        	<form action = "${pageContext.request.contextPath}/ProductController/comboInit" method="get" enctype="text" id="initCombo">
								<!--<input type = "hidden" value="initComboData" name = "action" >--><!--  
								<li><a href="javascript:document:initCombo.submit();" aria-expanded="false">套餐管理</a></li> 
                        	</form>
     
                             
                        </ul>
                    </li>
                    

                    <li>

                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">訂單管理</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="#" aria-expanded="false">所有訂單</a></li>
                            
                        </ul>
                    </li>
                    -->
					<li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">預訂管理</span>
                        </a>
                        <ul aria-expanded="false">
                           <li><a href="${pageContext.request.contextPath}/booking/list" aria-expanded="false">訂位管理</a></li>
                        </ul>
                    </li>

					<li>
                       <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">部落格管理</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${pageContext.request.contextPath}/backendBlog/listpost" aria-expanded="false">文章管理</a></li>
                        </ul>
                    </li>
                    
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">優惠管理</span>
                        </a>
                        <ul aria-expanded="false">
                           <li><a href="${pageContext.request.contextPath}/Event/EventsStart" aria-expanded="false">優惠專案</a></li>
                            <li><a href="${pageContext.request.contextPath}/Event/DiscountStart" aria-expanded="false"></a></li>
                         
                        </ul>
                    </li>
			
			
			
			
			
			
		</ul>
	</div>
</div>