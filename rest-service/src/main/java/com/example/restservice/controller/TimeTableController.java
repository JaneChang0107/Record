package com.example.restservice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.restservice.entity.TimeTable;
import com.example.restservice.service.TimeTableService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class TimeTableController {
	
	@Autowired
	TimeTableService timeTableService;
	
	@GetMapping("/Index")
	public ModelAndView showIndex() {
		ModelAndView mav = new ModelAndView("TimeTable");
		List<TimeTable> TimeTable= timeTableService.showAll();
		mav.addObject("TimeTable",TimeTable);
		return mav;
	}
	
	@PostMapping("/AddRecord")
	public ModelAndView addRecord(@RequestBody TimeTable timetable) {
		ModelAndView mav = new ModelAndView("TimeTable");
		timeTableService.addRecord(timetable);
		return mav;
	}

	@PostMapping("/DeleteRecord")
	public ModelAndView deleteRecord(@RequestBody String pk) {
		ModelAndView mav = new ModelAndView("TimeTable");
		Gson gson = new Gson();
		Map<String,Integer> map = gson.fromJson(pk, new TypeToken<Map<String, Integer>>(){}.getType());		
		TimeTable queryData = timeTableService.getUpdateRecord(map.get("id"));
		timeTableService.deleteRecord(queryData.getPk().toString());
		return mav;
		
	}
	
	@PostMapping("/GetUpdateRecord")
	@ResponseBody
	public TimeTable getUpdateRecord(@RequestBody String pk) {
		Gson gson = new Gson();
		Map<String,Integer> map = gson.fromJson(pk, new TypeToken<Map<String, Integer>>(){}.getType());		
		TimeTable queryData = timeTableService.getUpdateRecord(map.get("id"));
        return queryData;
	}
	
	
	@PostMapping("/UpdateRecord")
	public ModelAndView updateRecord(@RequestBody TimeTable timetable) {
		ModelAndView mav = new ModelAndView("TimeTable");
		timeTableService.updateRecord(timetable);
		return mav;
	}
	
}
