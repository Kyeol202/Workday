<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String contextPath = request.getContextPath(); %>


<div class="row">
	<div class="col-sm-12">
		<table id="gpxBoard" class="table table-bordered table-hover dataTable" role="grid">
								<thead>※관리자 화면입니다※
													<tr role="row">
														<th class="sorting_asc" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1" aria-sort="ascending"
															aria-label="Rendering engine: activate to sort column descending"
															style="width: 185px;">사번</th>
														<th class="sorting" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1"
															aria-label="Browser: activate to sort column ascending"
															style="width: 228px;">이름</th>
														<th class="sorting" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1"
															aria-label="Platform(s): activate to sort column ascending"
															style="width: 202px;">부서</th>
														<th class="sorting" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1"
															aria-label="Engine version: activate to sort column ascending"
															style="width: 158px;">이메일</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending"
															style="width: 115px;">직급</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending"
															style="width: 115px;">핸드폰번호</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending"
															style="width: 115px;">재직</th>
													</tr>
												</thead>
			<tbody>
				<c:forEach var="adminRunUserAllList" items="${adminRunUserAllList }">
				<c:choose>
					<c:when test="${adminRunUserAllList.u_status eq 'N' }">
					<tr role="row">
						<td>${adminRunUserAllList.u_id }</td>
						<td onclick="javascript:location.href='<c:url value="/"/>admin/adminUserSelectOne?u_id=${adminRunUserAllList.u_id }'">${adminRunUserAllList.u_name }</td>
						<td>${adminRunUserAllList.d_id }</td>
						<td>${adminRunUserAllList.u_email }</td>
						<td>${adminRunUserAllList.u_position }</td>
						<td>${adminRunUserAllList.u_phone }</td>
						<td>${adminRunUserAllList.u_status }</td>
					</tr>
					</c:when>
					<c:otherwise>
					<td hidden>${adminRunUserAllList.u_id }</td>
						<td hidden>${adminRunUserAllList.u_name }</td>
						<td hidden>${adminRunUserAllList.d_id }</td>
						<td hidden>${adminRunUserAllList.u_email }</td>
						<td hidden>${adminRunUserAllList.u_position }</td>
						<td hidden>${adminRunUserAllList.u_phone }</td>
						<td hidden>${adminRunUserAllList.u_status }</td>
					</c:otherwise>
					</c:choose>
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
							href="javascript:adminRunUserListAjaxfn(${boardPager.prevPage})">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${boardPager.blockBegin }" end="${boardPager.blockEnd }">
					<c:choose>
						<c:when test="${num == boardPager.curPage }">
							<li class="paginate_button active"><a href="#">${num }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button"><a href="javascript:adminRunUserListAjaxfn(${num})">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${boardPager.curBlock <= boardPager.totBlock }">
					<li class="paginate_button next" id="example1_next">
						<a href="javascript:adminRunUserListAjaxfn(${boardPager.nextPage})">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>