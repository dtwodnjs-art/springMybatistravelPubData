package com.zeus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zeus.domain.Travel;
import com.zeus.domain.TravelDetail;
import com.zeus.mapper.TravelMapper;

@Service
public class TravelServiceImpl implements TravelService {
	
	@Autowired
    private TravelMapper mapper;

	@Override
	@Transactional
	public void register(Travel travel, TravelDetail detail) throws Exception {
		// 1. 부모 테이블 저장 
	    mapper.create(travel);
	    
	    //2.부모의 tno를 자식 객체에 전달
	    detail.setTno(travel.getTno());
	    
	    //3. 자식 테이블 저장
	    mapper.createDetail(detail);

	}

	@Override
	public List<Travel> list() throws Exception {
		return mapper.list();
	}

	@Override
	public Travel read(int tno) throws Exception {
		
		return mapper.read(tno);
	}

	@Override
	public TravelDetail readDetail(int tno) throws Exception {
		
		return mapper.readDetail(tno);
	}

	@Override
	@Transactional
	public void modify(Travel travel, TravelDetail detail) throws Exception {
		mapper.update(travel);
		mapper.updateDetail(detail);

	}

	@Override
	public void remove(int tno) throws Exception {
		mapper.deleteDetail(tno);
		mapper.delete(tno);

	}

	@Override
	public List<Travel> search(String searchType, String keyword) throws Exception {
		return mapper.search(searchType, keyword);
	}

}
