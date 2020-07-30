<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% String contextPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Workday/근태관리</title>
	
	<!-- favicon.ico -->
	<link rel="shortcut icon" href="<c:url value='/'/>img/favicon.ico" type="image/x-icon">
	
	
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="<%= contextPath %>/bower_components/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="<%= contextPath %>/bower_components/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="<%= contextPath %>/bower_components/Ionicons/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<%= contextPath %>/dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="<%= contextPath %>/dist/css/skins/skin-blue.min.css">
	
	<!-- datatables style -->
	<link rel="stylesheet" href="<%= contextPath %>/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  	<link rel="stylesheet" href="<%=contextPath %>/bower_components/select2/dist/css/select2.min.css">
	
	<%-- <%@ include file="plugin_js.jsp" %> --%>
	
	<link rel="stylesheet" href="<%= contextPath %>/css/mainCss.css">
	
	<!-- REQUIRED JS SCRIPTS -->
	<!-- jQuery 3 -->
	<script src="<%= contextPath %>/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="<%= contextPath %>/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%= contextPath %>/dist/js/adminlte.min.js"></script>
	<!-- CK Editor -->
	<script src="<%= contextPath %>/bower_components/ckeditor/ckeditor.js"></script>
	<!-- CK Editor config -->
	<script src="<%= contextPath %>/js/ckeditor-config.js"></script>
	<!-- ChartJS -->
	<script src="<%= contextPath %>/bower_components/chart.js/Chart.js"></script>
	<!-- FastClick -->
	<script src="<%= contextPath %>/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- date-range-picker -->
<script src="<%=contextPath %>/bower_components/moment/min/moment.min.js"></script>
<script src="<%=contextPath %>/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="<%=contextPath %>/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="../../bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="<%=contextPath %>/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll -->
<script src="<%=contextPath %>/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="<%=contextPath %>/plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="<%=contextPath %>/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=contextPath %>/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=contextPath %>/dist/js/demo.js"></script>
<!-- fullCalendar -->
<script src="<%=contextPath %>/bower_components/moment/moment.js"></script>
<script src="<%=contextPath %>/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
	

</head>

