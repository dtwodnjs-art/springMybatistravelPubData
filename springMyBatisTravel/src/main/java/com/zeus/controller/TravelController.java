package com.zeus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeus.domain.Travel;
import com.zeus.domain.TravelDetail;
import com.zeus.service.TravelService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;




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
	
	@GetMapping("insertForm")
	public String insertForm() {
		return "travel/insertForm";
	}
	
	@PostMapping("/insert")
	public String insert(Travel travel, TravelDetail detail, Model model) {
		//TODO: process POST request
		try {
			travelService.register(travel, detail);
	        model.addAttribute("message", "새로운 여행 계획이 등록되었습니다!");
	        return "travel/success";
		} catch (Exception e) {
			e.printStackTrace();
	        model.addAttribute("message", "등록 중 오류가 발생했습니다.");
	        return "travel/failed";
		}
		
	}
	
	

}
