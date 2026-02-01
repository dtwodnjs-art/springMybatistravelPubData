package com.zeus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zeus.domain.Travel;
import com.zeus.domain.TravelDetail;

@Mapper
public interface TravelMapper {
	
	//등록 (Create)
    public void create(Travel travel) throws Exception;
    public void createDetail(TravelDetail detail) throws Exception;
    
    //조회 (Read)
    public List<Travel> list() throws Exception;
    public Travel read(int tno) throws Exception;
    public TravelDetail readDetail(int tno) throws Exception;
    
    //수정 (Update)
    public void update(Travel travel) throws Exception;
    public void updateDetail(TravelDetail detail) throws Exception;
    
    //삭제 (Delete)
    public void delete(int tno) throws Exception;
    public void deleteDetail(int tno) throws Exception;
    
    //검색 (Search)
    public List<Travel> search(@Param("searchType") String searchType, 
                               @Param("keyword") String keyword) throws Exception;
	

}
