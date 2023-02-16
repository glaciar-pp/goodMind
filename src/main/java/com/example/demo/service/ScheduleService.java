package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.SchDay;
import com.example.demo.entity.Schedule;

public interface ScheduleService {

	List<Schedule> getDaySchedList(String uid, String sdate);
	
	List<Schedule> getMonthSchedList(String uid, String month, int lastDay);
	
	List<Schedule> getCalendarSchedList(String uid, String startDate, String endDate);
	
	SchDay generateSchDay(String uid, String sdate, int date, int isOtherMonth);
	
	void insert(Schedule schedule);
	
	Schedule getSchedule(int sid);
	
	void update(Schedule schedule);
	
	void delete(int sid);
	
}
