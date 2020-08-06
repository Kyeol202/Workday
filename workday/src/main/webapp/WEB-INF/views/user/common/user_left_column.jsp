<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<aside class="main-sidebar">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">

	<!-- Sidebar Menu -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">Main Menu</li>
			<!-- Optionally, you can add icons to the links -->
			<li class="home">
				<a href="javascript:location.href='<c:url value="/"/>userHome'"><i class="fa fa-home"></i><span>HOME</span></a>
			</li>
			
			<c:choose>
				<c:when test="${loginUser != null}">
					<c:if test="${loginUser.u_position eq '대표이사'}">
					<li class="myPage treeview">
						<a href="#">
							<i class="fa fa-user"></i> <span>부서 페이지</span>
							<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
						</a>
						<ul class="myGpx treeview-menu">
							<li><a href="javascript:location.href='<c:url value="/"/>myPage/myDepartment'">부서 정보</a></li>
							<li class="myGpx treeview">
								<a href="#">
									<i class="fa fa-circle-o"></i> 부서 출근관리
									<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
								</a>
								<ul class="treeview-menu" style="display: none;">
									<li><a href="javascript:location.href='<c:url value="/"/>user/userWorkList'">부서원 출퇴근관리</a></li>
								</ul>
							</li>

						</ul>
					</li>
					</c:if>
					</c:when>
			</c:choose>
			<li class="gpx treeview">
				<a href="#">
					<i class="fa fa-map"></i>
					<span>출퇴근</span>
					<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li><a href="javascript:location.href='<c:url value="/"/>user/userWorkList'">출퇴근 입력</a></li>
				</ul>
			</li>
			<li class="community treeview">
				<a href="#">
					<i class="fa fa-commenting"></i>
					<span>상태관리</span>
					<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li><a href="javascript:location.href='<c:url value="/"/>user/userStatus'">조퇴/반차/휴가</a></li>
				</ul>
			</li>

		</ul>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>