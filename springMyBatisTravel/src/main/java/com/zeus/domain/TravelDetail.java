package com.zeus.domain;

import lombok.Data;

@Data
public class TravelDetail {
	private int tno;            // 여행 번호 (FK)
    private String transport;    // 이동 수단 (비행기, 기차, 자동차 등)
    private String description;  // 상세 계획,메모

}
