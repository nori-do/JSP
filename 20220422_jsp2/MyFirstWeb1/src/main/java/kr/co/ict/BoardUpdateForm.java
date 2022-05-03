package kr.co.ict;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;
import kr.co.ict.domain.BoardVO;

/**
 * Servlet implementation class BoardUpdateForm
 */
@WebServlet("/boardUpdateForm")
public class BoardUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		
		// dao생성
		BoardDAO dao = BoardDAO.getInstance();
		// 데이터 얻어오기
		BoardVO board = dao.getBoardDetail(boardNum);
		
		// 바인딩
		request.setAttribute("board", board);
		// 포워딩
		RequestDispatcher dp = request.getRequestDispatcher("/board/boardUpdateForm.jsp");
		dp.forward(request, response);
	}
}










