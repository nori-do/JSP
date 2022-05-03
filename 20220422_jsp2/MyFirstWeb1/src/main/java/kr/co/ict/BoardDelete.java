package kr.co.ict;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;

/**
 * Servlet implementation class BoardDelete
 */
@WebServlet("/boardDelete")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strBoardNum = 
				request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		// dao생성
		BoardDAO dao = BoardDAO.getInstance();
		// delete로직 호출
		dao.boardDelete(boardNum);
		// boardList로 리다이렉트
		response.sendRedirect("http://localhost:8181/MyFirstWeb/boardList");
	}

}














