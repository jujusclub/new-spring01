<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="adventour_sp.VO.*"%>
<%@ page import="java.util.*"%>
<%@ page import="adventour_sp.repository.Ad_DAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="uft-8">
<title>비밀번호 맞는지 확인</title>
</head>
<script>
</script>
<body>
<%

String m_pw = request.getParameter("m_pw");
String m_id = request.getParameter("m_id");

System.out.println("ㅎㅎㅎㅎ");
System.out.println(m_id);
System.out.println(m_pw);

ArrayList<Ad_VO> list = (ArrayList) request.getAttribute("logining");


for (int i = 0; i < list.size(); i++) {
	adventour_sp.VO.Ad_VO VO = (adventour_sp.VO.Ad_VO) list.get(i);
    if (m_pw.equals(VO.getM_pw())) {
    
%>
<form action="idsses" method="post">
    <input type="hidden" name="id" value="<%= m_id %>">
    <script>
        document.forms[0].submit(); 
    </script>
</form>
<%
    } else {
%>
        <script>
            alert("아이디와 비밀번호를 다시 확인하세요");
            location.href = "login";
        </script>
<%
    }
}
%>
</body>
</html>