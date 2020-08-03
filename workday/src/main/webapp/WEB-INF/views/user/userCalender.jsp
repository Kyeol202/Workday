
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>
<style>
html, body {
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
}

#external-events {
  z-index: 2;
  top: 20px;
  left: 20px;
  width: 150px;
  padding: 0 10px;
  border: 1px solid #ccc;
  background: #eee;
}
.demo-topbar + #external-events { /* will get stripped out */
  top: 60px;
}
#external-events .fc-event {
  margin: 1em 0;
  cursor: move;
}
#calendar-container {
  position: relative;
  z-index: 1;
  margin-left: 200px;
}
#calendar {
  max-width: 900px;
  margin: 20px auto;
}


</style>


<script>
document.addEventListener('DOMContentLoaded', function() {

	var calendarEl = document.getElementById('calendar');
	var Draggable = FullCalendarInteraction.Draggable;
	
	var containerEl = document.getElementById('external-events');
	var calendarEl = document.getElementById('calendar');
	var checkbox = document.getElementById('drop-remove');
	
//--------------------------------------------------------------------------		
	
	new Draggable(containerEl, {
		itemSelector : '.fc-event',
		eventData : function(eventEl) {
			return {
				title : eventEl.innerText
			};
		}
		
	});
	
    

	
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	    defaultView: 'dayGridMonth',
	    defaultDate: new Date(),
	    header: {
	      left: 'prev,next today',
	      center: 'title',
	      right: ''
	    },
	    editable: true,
	    droppable: true, // this allows things to be dropped onto the calendar
	    drop: function(info) {
	      // is the "remove after drop" checkbox checked?
	      if (checkbox.checked) {
	        // if so, remove the element from the "Draggable Events" list
	        info.draggedEl.parentNode.removeChild(info.draggedEl);
	      }
	    },
	    locale: 'ko'
	  });
	  calendar.render();
	});
    

    
 </script>  

<!-- Page specific script -->





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
	
			<div id="external-events">
			<p>
			<strong>Draggable Events</strong>
			</p>
    <div class="fc-event">My Event 1</div>
    <div class="fc-event">My Event 2</div>
    <div class="fc-event">My Event 3</div>
    <div class="fc-event">My Event 4</div>
    <div class="fc-event">My Event 5</div>
    <p>
      <input type="checkbox" id="drop-remove">
      <label for="drop-remove">remove after drop</label>
    </p>
  </div>
	
	
	
	
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-body no-padding">
              <!-- THE CALENDAR -->
              <div id="calendar"></div>
				
				<div>
				<button class="add-button" type="button" onclick="click_add();">일정추가</button>
				</div>
				
				
				
				
    </section>

  <!-- /.content-wrapper -->



  
<!-- ./wrapper -->




		<!-- /.content-wrapper -->


		<!-- Main Footer -->
		<%@ include file="../user/common/user_main_footer.jsp" %>
	</div>
	<!-- ./wrapper -->

</body>

</html>
