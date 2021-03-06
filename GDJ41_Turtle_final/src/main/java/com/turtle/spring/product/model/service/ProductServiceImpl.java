package com.turtle.spring.product.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.order.model.vo.Cart;
import com.turtle.spring.product.model.dao.ProductDao;
import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Product> productList(int cPage, int numPerpage,Map param){
		List<Product> list=dao.productList(session ,cPage, numPerpage,param);
		return list;
	}
	
	@Override
	public List<Product> productCategoryList(Map param,int cPage, int numPerpage){
		List<Product> list=dao.productCategoryList(session,param,cPage, numPerpage);
		return list;
	}
	
	@Override
	public int productListCount() {
		return dao.productListCount(session);
	}
	
	@Override
	public int productCategoryListCount(Map param) {
		return dao.productCategoryListCount(session,param);
	}
	
	@Override
	public Option productDetail(String pdCode) {
		return dao.productDetail(session, pdCode);
	}

	@Override
	public List<Option> pdOptionSizeList(String pdCode) {
		return dao.pdOptionSizeList(session,pdCode);
	}

	@Override
	public int pdOptionSizeCount(String pdCode) {
		return dao.pdOptionSizeCount(session,pdCode);
	}

	@Override
	public List<Product> productSaleList(int cPage, int numPerpage) {
		return dao.productSaleList(session, cPage, numPerpage);
	}

	@Override
	public List<Product> productNewList(int cPage, int numPerpage) {
		return dao.productNewList(session, cPage, numPerpage);
	}

	@Override
	public List<Product> productBestList(int cPage, int numPerpage ) {
		return dao.productBestList(session, cPage, numPerpage);
	}
	
	@Override
	public int productSaleListCount() {
		return dao.productSaleListCount(session);
	}
	
	@Override
	public int productNewListCount() {
		return dao.productNewListCount(session);
	}
	
	@Override
	public int productBestListCount() {
		return dao.productBestListCount(session);
	}

	@Override
	public List<Product> productMainSaleList() {
		return dao.productMainSaleList(session);
	}

	@Override
	public List<Reviews> selectReviews(int cPage, int numPerpage, String pdCode) {
		return dao.selectReviews(session,pdCode,cPage, numPerpage);
	}

	@Override
	public int reviewsCount(String pdCode) {
		return dao.reviewsCount(session,pdCode);
	}

	@Override
	public Member orderMember(String userId) {
		return dao.orderMember(session, userId);
	}

	@Override
	public Product productOrderDetail(String pdCode) {
		return dao.productOrderDetail(session, pdCode);
	}

	@Override
	public List<Product> searchProduct(Map<String, Object> param) {
		return dao.searchProduct(session, param);
	}

	@Override
	public int searchProductCount(Map<String, Object> param) {
		return dao.searchProductCount(session, param);
	}

	@Override
	public int insertOrder(Map<String, Object> param) {
		return dao.insertOrder(session, param);
	}

	@Override
	public int insertOrderDetail(Map<String, Object> param2) {
		return dao.insertOrderDetail(session, param2);
	}

	@Override
	public List<Reviews> selectReviews2(String pdCode) {
		return dao.selectReviews2(session, pdCode);
	}

	@Override
	public int reviewsSum(String pdCode) {
		return dao.reviewsSum(session, pdCode);
	}

	@Override
	public double reviewsSum2(String pdCode) {
		return dao.reviewsSum2(session, pdCode);
	}

	@Override
	public int addCart(Map<String, Object> param) {
		return dao.addCart(session,param);
	}

	@Override
	public int insertReviewEnd(Map<String, Object> param) {
		return dao.insertReviewEnd(session,param);
	}

	@Override
	public int rvIs(int rvNo) {
		return dao.rvIs(session,rvNo);
	}

	@Override
	public Cart selectCart(String optNo) {
		return dao.selectCart(session, optNo);
	}

	@Override
	public int updateAmount(Map<String, Object> param2) {
		return dao.updateAmount(session, param2);
	}

	
}
