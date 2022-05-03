package kr.co.ict;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;
import kr.co.ict.domain.BoardVO;

/**
 * Servlet implementation class BoardInsert
 */
@WebServlet("/boardInsert")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post방식인 경우 제일먼저 한글 인코딩 설정부터
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		System.out.println(title + ", " + writer + ", " + content);
		// dao생성
		BoardDAO dao = BoardDAO.getInstance();
		// dao의 insert기능 호출 및 파라미터 매칭
		dao.boardInsert(title, content, writer);
		
		// /boardList로 리다이렉트(서블릿 주소로 리다이렉트시 파일이름 노출 안됨.)
		response.sendRedirect("http://localhost:8181/MyFirstWeb/boardList");

	}
}






