package com.zeus.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Travel {
	private int tno;            // 여행 번호 (PK)
	private String title;       // 여행 제목
    private String destination; // 목적지
    //"yyyy-MM-dd" 형식을 Date로 변환
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date tripDate;      // 여행 예정일
    private Date regDate;       // 등록일
    private Date modDate;       // 수정일

}
