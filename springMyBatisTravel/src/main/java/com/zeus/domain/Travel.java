package com.zeus.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Travel {
	private int tno;            // 여행 번호 (PK)
	private String title;       // 여행 제목
    private String destination; // 목적지
    private Date tripDate;      // 여행 예정일
    private Date regDate;       // 등록일
    private Date modDate;       // 수정일

}
