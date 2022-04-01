<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String song = request.getParameter("song");

	if(song.equals("회전목마")){
		response.sendRedirect("https://www.youtube.com/watch?v=tnAxZipkuWw");
	} else if(song.equals("금만나")){
		response.sendRedirect("https://www.youtube.com/watch?v=EiVmQZwJhsA");
	} else if(song.equals("silver")){
		response.sendRedirect("https://www.youtube.com/watch?v=Thjagcdo4Bw");
	}
%>
