<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>
    

 

    

<script>
$(document).ready(function() {
	jqgridTable.init();
	jqgridTable.search();
	jqgridTable.navGrid();
})

var jqgridTable =
{
		init : function () {
			  var cnames = ['사번','이름','부서','이메일','직급','핸드폰번호', '재직상태'];
				$jqGrid = $("#jqGrid");

			$jqGrid.jqGrid({
				url: "<c:url value="/"/>user/userGridTest",
				mtype: "post",
				datatype	:	"json",
				colNames	:	cnames,
				colModel	:	[
					{name	: 	"u_id" , index : "user_id", width : 50 },
					{name	: 	"u_name" , index : "u_name", width : 150 },
					{name	: 	"d_id" , index : "d_id", width : 150 },
					{name	: 	"u_email" , index : "u_email", width : 150},
					{name	: 	"u_position" , index : "u_position", width : 150 },
					{name	: 	"u_phone" , index : "u_phone", width : 150 },
					{name	:	"u_status"	, index : "u_status"	, width : 150},
				],
				height		: 480,
				rowNum		: 10,
				rowList		: [10,20,30],
				pager		: "#jqGridPager",
				rownumbers	: true,
				viewrecords : true,
				cellEdit	: true,
				cellsubmit	: "clientArray",
				caption		: "사용자 목록",
				jsonReader: {
					repeatitems:false
				}
			})
		},

		search : function () {
			$("#jqGrid").setGridParam({
				datatype		: "json",
			}).trigger("reloadGrid");
		},

		navGrid : function() {
			$("#jqGrid").jqGrid('navGrid', '#jqGridPager',

				{
					edit:false ,add:false ,del:true ,search:true ,refresh:true
				},
				{
					// 삭제 옵셥
				},			
				{
					// 찾기 옵션 
				});
		}

}

</script>








<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../user/common/user_main_header.jsp" %>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../user/common/user_left_column.jsp" %>
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<div class="row">
									<div class="col flexBox" style="justify-content: flex-start; padding: 0 16px;">
										<h3 class="box-title">근태관리</h3>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										
									</div>
								</div>
							</div>

			

<div class="form-group">
<select id="selectId" class="col-sm-1">
<option value="">All</option>
<option value="A">A</option>
<option value="B">B</option>
<option value="C">C</option>
<option value="D">D</option>
</select>
<span><a href="#" onclick="javascript:search();">검색</a></span>
</div>
			
<div class="row"> 
    <div>
        <table id="jqGrid"></table>
        <div id="jqGridPager"></div>
    </div>
</div>




								

			</section>
			<!-- /.content -->



		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="../user/common/user_main_footer.jsp" %>
	</div>
	<!-- ./wrapper -->

</body>

</html>