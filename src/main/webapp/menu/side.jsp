<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                	<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		                <div class="input-group">
		                    <input class="form-control" type="text" placeholder="검색" aria-label="Search for..." aria-describedby="btnNavbarSearch" />
		                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
		                </div>
		            </form>
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">여기다가 검색 결과를???</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                 전자결재 <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
	                            <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" >
	                            	<div class="sb-sidenav-menu-heading">결재</div>
	                                <nav class="sb-sidenav-menu-nested nav">
	                                    <a class="nav-link" href="/HTA_Project_semi/approval/approvalForm.jsp">일반결재</a>
	                                </nav>
	                                <nav class="sb-sidenav-menu-nested nav">
	                                    <a class="nav-link" href="/HTA_Project_semi/approval/approvalListTemporary.jsp">임시저장함</a>
	                                </nav>
	                                <div class="sb-sidenav-menu-heading">결재함</div>
	                                <nav class="sb-sidenav-menu-nested nav">
	                                    <a class="nav-link" href="/HTA_Project_semi/approval/approvalList.jsp">내 문서함</a>
	                                </nav>
	                                <nav class="sb-sidenav-menu-nested nav">
	                                    <a class="nav-link" href="/HTA_Project_semi/approval/approvalListWait.jsp">결재 대기함</a>
	                                </nav>
	                                <nav class="sb-sidenav-menu-nested nav">
	                                    <a class="nav-link" href="/HTA_Project_semi/approval/approvalListComplete.jsp">결재완료문서</a>
	                                </nav>
	                            </div>
	                            
	                            

	                        <a class="nav-link" href="/HTA_Project_semi/mail/mail_layOut.jsp">사내메일함</a>
	                        <a class="nav-link" href="/HTA_Project_semi/attendance/test6.jsp">근태관리</a>
	                        <a class="nav-link" href="../schedule/schedule_list.jsp">일정관리</a>

   							<a class="nav-link" href="/HTA_Project_semi/board/boardList.jsp">게시판</a>
   							<a class="nav-link" href="/HTA_Project_semi/login.jsp">로그인</a>
	                            
	                            
	                 <!--  <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError_1" aria-expanded="false" aria-controls="pagesCollapseError_1">
                                 전자결재 <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
	                             <div class="collapse" id="pagesCollapseError_1" aria-labelledby="headingOne" >
	                            	<div class="sb-sidenav-menu-heading">결재</div>
	                                <nav class="sb-sidenav-menu-nested nav">
	                                    <a class="nav-link" href="../approval/center.jsp">테스트</a>
	                                </nav>
	                             </div> -->
	                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        호의가 계속되면 둘리인줄 알아
                    </div>
                </nav>