'use strict';

/*eslint-disable*/

var ScheduleList = [];

var SCHEDULE_CATEGORY = [
    'milestone',
    'task'
];

function ScheduleInfo() {
    this.id = null;
    this.calendarId = null;

    this.title = null;
    this.body = null;
    this.isAllday = false;
    this.start = null;
    this.end = null;
    this.category = '';
    this.dueDateClass = '';

    this.color = null;
    this.bgColor = null;
    this.dragBgColor = null;
    this.borderColor = null;
    this.customStyle = '';

    this.isFocused = false;
    this.isPending = false;
    this.isVisible = true;
    this.isReadOnly = false;
    this.goingDuration = 0;
    this.comingDuration = 0;
    this.recurrenceRule = '';
    this.state = '';

    this.raw = {
        memo: '',
        hasToOrCc: false,
        hasRecurrenceRule: false,
        location: null,
        class: 'public', // or 'private'
        creator: {
            name: '',
            avatar: '',
            company: '',
            email: '',
            phone: ''
        }
    };
}

function generateTime(schedule, renderStart, renderEnd) {
    var startDate = moment(renderStart.getTime())
    var endDate = moment(renderEnd.getTime());
    var diffDate = endDate.diff(startDate, 'days');
    
    console.log("diffDate : " + diffDate);
    
    schedule.isAllday = chance.bool({likelihood: 30});
    if (schedule.isAllday) {
        schedule.category = 'allday';
    } else if (chance.bool({likelihood: 30})) {
        schedule.category = SCHEDULE_CATEGORY[chance.integer({min: 0, max: 1})];
        if (schedule.category === SCHEDULE_CATEGORY[1]) {
            schedule.dueDateClass = 'morning';
        }
    } else {
        schedule.category = 'time';
    }

    startDate.add(chance.integer({min: 0, max: diffDate}), 'days');
    startDate.hours(chance.integer({min: 0, max: 23}))
    startDate.minutes(chance.bool() ? 0 : 30);
    schedule.start = startDate.toDate();

    endDate = moment(startDate);
    if (schedule.isAllday) {
        endDate.add(chance.integer({min: 0, max: 3}), 'days');
    }

    schedule.end = endDate
        .add(chance.integer({min: 1, max: 4}), 'hour')
        .toDate();

    if (!schedule.isAllday && chance.bool({likelihood: 20})) {
        schedule.goingDuration = chance.integer({min: 30, max: 120});
        schedule.comingDuration = chance.integer({min: 30, max: 120});;

        if (chance.bool({likelihood: 50})) {
            schedule.end = schedule.start;
        }
    }
}

function generateZigmeSchedule(calendar, renderStart, renderEnd, zigme_schedule) {
		
	var schedule = new ScheduleInfo();
	
	var startDate = moment(renderStart.getTime())
    var endDate = moment(renderEnd.getTime());
      
      
	schedule.start = startDate.toDate();	
	zigme_schedule.ajaxstart = schedule.start.getFullYear() + "-" + (schedule.start.getMonth()+1) + "-" + schedule.start.getDate();
  	zigme_schedule.start = schedule.start;    
    
    schedule.end = endDate.toDate();        
    zigme_schedule.ajaxend = schedule.end.getFullYear() + "-" + (schedule.end.getMonth()+1) + "-" + schedule.end.getDate();
  	zigme_schedule.end = schedule.end;    
        
}

function drawZigmeSchedule(renderStart, renderEnd, zigme_schedulList, zigme_schedulList_count) {
	
	for(var i=0; i < zigme_schedulList_count; i++) {
	var schedule = new ScheduleInfo();
	
	var startDate = moment(renderStart.getTime())
    var endDate = moment(renderEnd.getTime());
    
    startDate.format('YYYYMMDD');
    startDate.hours()
    startDate.minutes();
    
	schedule.start = startDate.toDate();	
	
	endDate.format('YYYYMMDD');
	endDate.hours()
    endDate.minutes();   
    
    schedule.end = endDate.toDate();
	
    schedule.id = zigme_schedulList[i].scheNo; 
    schedule.title = zigme_schedulList[i].scheContent;    
	schedule.location = zigme_schedulList[i].scheLoc;
	schedule.start = zigme_schedulList[i].scheStartdate;
	schedule.end = zigme_schedulList[i].scheEnddate;
	
	var start_time = "00:00:00";
	var end_time = "23:59:59";
	
	if((zigme_schedulList[i].scheStartdate.indexOf(start_time) != -1) && (zigme_schedulList[i].scheEnddate.indexOf(end_time) != -1))
	{
		schedule.category = 'allday';
		console.log("allday in");
	}
	else 
	{			
		schedule.category = 'time';
		console.log("time in");
	}	
		
	
	var calendar = findCalendar(zigme_schedulList[i].scheCate);
	// console.log("calendar.id ==> " + calendar.id);
	
	schedule.calendarId = calendar.id;             
    schedule.color = calendar.color;
    schedule.bgColor = calendar.bgColor;
    schedule.dragBgColor = calendar.dragBgColor;
    schedule.borderColor = calendar.borderColor;
    
        
   	ScheduleList.push(schedule);
   	
   	}

}

function generateSchedule(viewName, renderStart, renderEnd, zigme_schedule) {
    
    ScheduleList = [];    
    generateZigmeSchedule(calendar, renderStart, renderEnd, zigme_schedule);    
    
}
