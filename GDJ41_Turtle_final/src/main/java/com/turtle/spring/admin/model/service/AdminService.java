package com.turtle.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.product.model.vo.Product;

public interface AdminService {

	List<Member> selectMemberList(Map<String, Object> param);

	List<Product> selectProductList(Map<String, Object> param);

	int selectProductCount(Map<String, Object> param);

}
