package com.example.restservice.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.restservice.entity.TimeTable;
import com.example.restservice.repository.TimeTableRepository;
import com.example.restservice.service.TimeTableService;

@Service
public class TimeTableServiceImpl implements TimeTableService{
	
	@Autowired
	TimeTableRepository timeTableRepository;
	
	@Override
	public List<TimeTable> showAll() {
		
		List<TimeTable> list = new ArrayList<>();
		list = timeTableRepository.findAll();
		return list;
		
	}

	@Override
	public void addRecord(TimeTable timetable) {
		TimeTable timeTable = new TimeTable();
		timeTable.setComment(timetable.getComment());
		timeTable.setHour(timetable.getHour());
		timeTable.setTime(timetable.getTime());
		timeTable.setType(timetable.getType());
		timeTableRepository.save(timeTable);
		
	}
	
	@Override
	public void deleteRecord(String pk) {
		Integer id = Integer.parseInt(pk);
		timeTableRepository.deleteById(id);
	}
	
	@Override
	public TimeTable getUpdateRecord(Integer pk) {
		TimeTable updateData = timeTableRepository.findById(pk).get();
		return updateData;
	}

	@Override
	public void updateRecord(TimeTable timetable) {
		TimeTable target = timeTableRepository.findById(timetable.getPk()).get();
		if(target != null) {
			target.setComment(timetable.getComment());
			target.setHour(timetable.getHour());
			target.setTime(timetable.getTime());
			target.setType(timetable.getType());
			timeTableRepository.save(target);
		}
		
	}

}
