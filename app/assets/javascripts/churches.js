$(document).ready(function() {
	/* initialize the external events
	 -----------------------------------------------------------------*/
	$('#external-events div.external-event').each(function() {

		// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
		// it doesn't need to have a start or end
		var eventObject = {
			title : $.trim($(this).text()) // use the element's text as the event title
		};

		// store the Event Object in the DOM element so we can get to it later
		$(this).data('eventObject', eventObject);

		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex : 999,
			revert : true, // will cause the event to go back to its
			revertDuration : 0 //  original position after the drag
		});
	});
	/* initialize the calendar
	 -----------------------------------------------------------------*/
	var calendar = $('#church_calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			//right : 'basicWeek, basicDay',
			right : 'agendaWeek,agendaDay'
		},
		defaultView : 'agendaWeek',
		minTime : '8:00',
		slotMinutes : 60,
		events : '/weekly_calendar/meetings.json',
		editable : true,
	});

});
