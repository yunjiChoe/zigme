/* eslint-disable */
function init() {
 
  setSchedules();
  
}

function setSchedules() {  
  
  cal.clear();
  generateSchedule(cal.getViewName(), cal.getDateRangeStart(), cal.getDateRangeEnd());  
  cal.createSchedules(ScheduleList);  
}


