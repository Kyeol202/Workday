 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String contextPath = request.getContextPath(); %>
 
 
 <style>
 .userList {
	text-align: center;
	
}
</style>
 
 
 
 
 
 
 
<section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            
          <div class="box-body">
          	<div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
          		<div class="row"><div class="col-sm-6"></div>
          			<div class="col-sm-6"></div>
          		</div>
          		<div class="row">
          		<div class="col-sm-12">
          <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
			<thead>
				<c:choose>
					<c:when test="${fn:length(userAllList)>0 }">
						<tr role="row"> 
							<th class="userList" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">부서</th>
							<th class="userList" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">사번</th>
							<th class="userList" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">직급</th>
							<th class="userList" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">이름</th>
							<th class="userList" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">이메일</th>
							<th class="userList" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">핸드폰번호</th>
						</tr>
					</c:when>
				</c:choose>
			</thead>
		
			<tbody>
				<c:forEach var="userAllList" items="${userAllList}">
					<tr role="row" class="odd">
						<td>${userAllList.dp_name }</td>
						<td onclick="javascript:location.href='<c:url value ="/"/>admin/userInfoSelectOne?u_id=${userAllList.u_id }'">
                  ${userAllList.u_id }</td>
						<td>${userAllList.u_position }</td>
						<td>${userAllList.u_name }</td>
						<td>${userAllList.u_email }</td>
						<td>${userAllList.u_phone }</td>
					</tr>
			
				</c:forEach>
			</tbody>
		</table>
              </div>
              </div>
<div class="row">
	<div class="col-sm-5">
		<div class="dataTables_info" id="example1_info" role="status" aria-live="polite"></div>
	</div>
	<div class="col-sm-7">
		<div class="dataTables_paginate paging_simple_numbers">
			<ul class="pagination">
				<c:if test="${boardPager.curBlock > 1 }">
					<li class="paginate_button previous disabled"><a
							href="javascript:myDepartmentInfojax(${boardPager.prevPage})">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${boardPager.blockBegin }" end="${boardPager.blockEnd }">
					<c:choose>
						<c:when test="${num == boardPager.curPage }">
							<li class="paginate_button active"><a href="#">${num }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button"><a href="javascript:myDepartmentInfojax(${num})">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${boardPager.curBlock <= boardPager.totBlock }">
					<li class="paginate_button next" id="example1_next">
						<a href="javascript:myDepartmentInfojax(${boardPager.nextPage})">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>