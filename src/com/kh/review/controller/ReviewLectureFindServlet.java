package com.kh.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewLectureService;
import com.kh.review.model.vo.ReviewLecture;



/**
 * Servlet implementation class ReviewLectureFindServlet
 */
@WebServlet("/review/reviewLectureFinder")
public class ReviewLectureFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewLectureFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type=request.getParameter("searchType");
		String key=request.getParameter("searchKeyword");
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e){
			cPage=1;
		}
		int numPerPage=3;
		
		List<ReviewLecture> list=new ReviewLectureService().searchReviewLecturePage(cPage,numPerPage,type,key);
		
		
		int totalReviewLecture = new ReviewLectureService().reviewLectureCount(type,key);
		
		int totalPage=(int)Math.ceil((double)totalReviewLecture/numPerPage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		
		if(pageNo==1) {
			pageBar+="<li class='page-item'><a class='page-link'>이전</a></li>";
		}else {
			pageBar+="<a class='page-link' href='"+request.getContextPath()+"/review/reviewLectureFinder?cPage="+(pageNo-1)+"&searchType="+type+""+"&searchKeyword="+key+"'>이전</a>";
		}
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo ==cPage) {
				pageBar+="<li class='page-item'><a class='page-link'<span class = 'cPage'>"+pageNo+"</a></li>";
			}else {
				pageBar+="<a class='page-link' href='"+request.getContextPath()+"/review/reviewLectureFinder?cPage="+pageNo+"&searchType="+type+""+"&searchKeyword="+key+"'>"+pageNo+"</a>";
			}		
			pageNo++;
		}
		//다음
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item'><a class='page-link'>다음</a></li>";
		}else {
			pageBar+="<a class='page-link' href='"+request.getContextPath()+"/review/reviewLectureFinder?cPage="+pageNo+"&searchType="+type+""+"&searchKeyword="+key+"'>다음</a>";
		}
		request.setAttribute("list",list);
		request.setAttribute("pageBar",pageBar);
		request.getRequestDispatcher("/views/review/reviewLecture/reviewLectureList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
