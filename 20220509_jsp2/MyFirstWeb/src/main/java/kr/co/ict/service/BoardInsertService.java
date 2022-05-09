package kr.co.ict.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;

public class BoardInsertService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDAO dao = BoardDAO.getInstance();
		// 글쓰기 로직을 완성시켜주세요(04.28 숙제)
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		// dao의 insert기능 호출 및 파라미터 매칭
		dao.boardInsert(title, content, writer);
	}

}
