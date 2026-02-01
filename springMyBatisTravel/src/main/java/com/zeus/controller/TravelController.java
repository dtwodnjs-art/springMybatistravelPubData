package com.zeus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeus.domain.Travel;
import com.zeus.service.TravelService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;



@Slf4j
@Controller
@RequestMapping("/travel")

public class TravelController {
	
	@Autowired
	private TravelService travelService;
	
	@GetMapping("/list")
	public String list(Model model) throws Exception {
		log.info("여행 목록 페이지 접속");
		
		List<Travel> travelList = travelService.list();
        model.addAttribute("travelList", travelList);
        
        return "travel/list";
		
	}
	

}
