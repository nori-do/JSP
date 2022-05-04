package kr.co.ict.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;

public class BoardUpdateService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDAO dao = BoardDAO.getInstance();
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");

		// dao에서 update호출
		dao.boardUpdate(boardNum, title, content, writer);
	}

}
