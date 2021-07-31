/* eslint-disable */
function init(zigme_schedule) {
 
  setSchedules(zigme_schedule); 
  
}

function setRenderRangeText() {
  var renderRange = document.getElementById('renderRange');
  var options = cal.getOptions();
  var viewName = cal.getViewName();
  var html = [];
  if (viewName === 'day') {
    html.push(moment(cal.getDate().getTime()).format('YYYY.MM.DD'));
  } else if (viewName === 'month' &&
    (!options.month.visibleWeeksCount || options.month.visibleWeeksCount > 4)) {
    html.push(moment(cal.getDate().getTime()).format('YYYY.MM'));
  } else {
    html.push(moment(cal.getDateRangeStart().getTime()).format('YYYY.MM.DD'));
    html.push(' ~ ');
    html.push(moment(cal.getDateRangeEnd().getTime()).format(' MM.DD'));
  }
  //renderRange.innerHTML = html.join('');
}

function refreshScheduleVisibility() {
  var calendarElements = Array.prototype.slice.call(document.querySelectorAll('#calendarList input'));

  CalendarList.forEach(function(calendar) {
    cal.toggleSchedules(calendar.id, !calendar.checked, false);
  });

  cal.render(true);

  calendarElements.forEach(function(input) {
    var span = input.nextElementSibling;
    span.style.backgroundColor = input.checked ? span.style.borderColor : 'transparent';
  });
}

function setSchedules(zigme_schedule) {  
  
  generateSchedule(cal.getViewName(), cal.getDateRangeStart(), cal.getDateRangeEnd(), zigme_schedule);
  
}

function drawZigmeSchedules_func(zigme_schedule, zigme_schedulList, zigme_schedulList_count) {  
  
  cal.clear();
  drawZigmeSchedule(zigme_schedule.start, zigme_schedule.end, zigme_schedulList, zigme_schedulList_count);    
  cal.createSchedules(ScheduleList);  
  refreshScheduleVisibility();
    
}



