 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String contextPath = request.getContextPath(); %>
 
 
 
 
 
 
 
 
 
  <!-- /.box-header -->
            <div class="box-body">
              <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
              <div class="row">
              <div class="col-sm-6">
              </div><div class="col-sm-6">
              </div></div>
              <div class="row">
              <div class="col-sm-12">
              <table id="example2" class="table table-bordered table-hover dataTable" role="grid" >
                <thead>
                <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example2" 
                rowspan="1" colspan="1" aria-sort="ascending" 
                aria-label="Rendering engine: activate to sort column descending" style="width:185px;">
                 	부서명	
                </th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="Engine version: activate to sort column ascending" style="width:228px;">
                	사번</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="Engine version: activate to sort column ascending" style="width:202px;">
                	사원이름</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="CSS grade: activate to sort column ascending" style="width:158px;">
             		직급</th>
                </tr>

                </tr>
                </thead>
                <c:forEach var="gtoAllList" items="${gtoAllList }">
                <tbody>
                <tr role="row" class="odd">
                  <td class="sorting_1">${gtoAllList.dp_name }</td>
                  <td onclick="javascript:location.href='<c:url value ="/"/>admin/adminGtoOwSelectOne?ta_id=${gtoAllList.ta_id}'">
                  ${gtoAllList.u_id }</td>
                  <td>${gtoAllList.u_name }</td>
                  <td>${gtoAllList.u_position }</td>
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
							href="javascript:adminGtoOwAjaxfn(${boardPager.prevPage})">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${boardPager.blockBegin }" end="${boardPager.blockEnd }">
					<c:choose>
						<c:when test="${num == boardPager.curPage }">
							<li class="paginate_button active"><a href="#">${num }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button"><a href="javascript:adminGtoOwAjaxfn(${num})">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${boardPager.curBlock <= boardPager.totBlock }">
					<li class="paginate_button next" id="example1_next">
						<a href="javascript:adminGtoOwAjaxfn(${boardPager.nextPage})">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>