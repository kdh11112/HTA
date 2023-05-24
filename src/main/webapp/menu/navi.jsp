<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/HTA_Project_semi/index2.jsp"><img src="/HTA_Project_semi/images/logo.png" alt="" /></a>
            <!-- Sidebar Toggle 없앨까?-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search 사이드바에 넣기-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            
            <!-- Navbar  상단바-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                       
                        
                        <li><hr class="dropdown-divider" /></li>
		      <%--      <%
		    Object objSession = session.getAttribute("vo");
		    if (objSession == null) {
		        // 로그인 안된 상태
		%> --%>
		    <li><a class="dropdown-item" href="/HTA_Project_semi/login2.jsp">Login</a></li>
		    <li><a class="dropdown-item" href="/HTA_Project_semi/register/newRegi.jsp">Register</a></li>
		     <li><a class="dropdown-item" href="/HTA_Project_semi/login2.jsp">Logout</a></li>

		<%-- <%
		    } else {
		        // 로그인 된 상태
		        session.removeAttribute("vo"); // 세션 뺏기
		%>
		    <li><a class="dropdown-item" href="/HTA_Project_semi/index.jsp">Logout</a></li>
		<%
		    }
		%> --%>
        <!-- <li><a class="dropdown-item" href="/HTA_Project_semi/login.jsp">Logout</a></li> -->
                    </ul>
                </li>
            </ul>