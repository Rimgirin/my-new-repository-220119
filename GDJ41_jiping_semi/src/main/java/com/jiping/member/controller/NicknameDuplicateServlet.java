package com.jiping.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.member.model.service.MemberService;
import com.jiping.member.model.vo.Member;

/**
 * Servlet implementation class NicknameDuplicateServlet
 */
@WebServlet(name="nicknameDuplicate", urlPatterns={"/member/nicknameDuplicate.do"})
public class NicknameDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NicknameDuplicateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newNick = request.getParameter("newNick");
		System.out.println("newNick : " + newNick);		
		Member m=new MemberService().nicknameDuplicateCheck(newNick);
		System.out.println(m);
		request.setAttribute("newNick", newNick);
		request.setAttribute("nickCheckMember", m);
		request.getRequestDispatcher("/views/member/nickDipulicate.jsp").forward(request, response);							
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
