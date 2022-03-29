<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 클라이언트에 저장된 쿠키를 전체 가져오는 방법
	Cookie[] cookies = request.getCookies();// 여러개가 들어있을 경우에 대비해 배열로 받음.

	String str = null;
	
	// 특정 쿠키 유무를 추론할 수 있도록 단서로 남긴 bool자료형
	boolean flag = false;
	
	for(int i = 0; i < cookies.length; i++){
		str = cookies[i].getName();//쿠키 이름을 얻어오는 메서드
		System.out.println(str);
		// 쿠키 값을 얻어와서 콘솔에 찍어보세요.
		//str = cookies[i].getValue();
		//System.out.println(str);
		
		// 땅콩 쿠키가 존재하는지 체크해서 있으면 땅콩쿠키가 존재합니다
		// 없으면 땅콩 쿠키가 존재하지 않습니다. 라고 출력해주는 코드.
		if(str.equals("peanut_cookie")){
			out.println("땅콩 쿠키가 존재합니다.<br/>");
			flag = true;// 땅콩쿠키 존재
			break; // 땅콩 검출된 즉시 반복문 종료로 메모리 절약
		}
	}
	
	// flag가 true로 바뀌었다는건 땅콩쿠기가 존재한다는것.
	// 바꿔 말하면 바뀌지 않았다는것은 땅콩쿠키가 없다는것
	if(!flag){
		out.println("땅콩쿠키가 없어졌습니다.<br/>");
	}
	
	
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>