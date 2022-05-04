package kr.co.ict;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/boardUpdate")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		// dao생성
		BoardDAO dao = BoardDAO.getInstance();
		// dao에서 update호출
		dao.boardUpdate(boardNum, title, content, writer);
		// 리다이렉트(boardNum번 detail페이지로 이동.)
		response.sendRedirect("http://localhost:8181/MyFirstWeb/boardDetail?board_num=" + boardNum);
		
	}

}
