package com.zeus.service;

import java.util.List;

import com.zeus.domain.Travel;
import com.zeus.domain.TravelDetail;

public interface TravelService {
	// 여행 계획 등록
    public void register(Travel travel, TravelDetail detail) throws Exception;
    
    // 전체 여행 목록 조회
    public List<Travel> list() throws Exception;
    
    // 특정 여행 상세 조회
    public Travel read(int tno) throws Exception;
    
    //특정 여행 상세 계획 조회 
    public TravelDetail readDetail(int tno) throws Exception;
    
    // 여행 정보 수정
    public void modify(Travel travel, TravelDetail detail) throws Exception;
    
    // 여행 계획 삭제
    public void remove(int tno) throws Exception;
    
    // 여행지 검색
    public List<Travel> search(String searchType, String keyword) throws Exception;

}
