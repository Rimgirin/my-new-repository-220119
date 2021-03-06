package com.turtle.spring.member.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.order.model.vo.Order;

public interface MemberService {
	
	Member login(Map param);
	
	Member myInfo(String userId);
	
	int myInfoUpdate(Map param);
	
	int enrollEnd(Map param);
	
	int userIdChk(String userId);
	
	int deleteMember(String userId);

	String findingId(Map param);

	int findingPw(Map<String, String> param);

	int pwUpdate(Map<String, Object> param);
	
	
	
	
	
	
	
}
