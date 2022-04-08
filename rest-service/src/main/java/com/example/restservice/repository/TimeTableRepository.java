package com.example.restservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.restservice.entity.TimeTable;

public interface TimeTableRepository extends JpaRepository<TimeTable, Integer>{

}
