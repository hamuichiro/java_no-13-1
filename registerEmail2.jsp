<%@ page contentType="text/html; charset=UTF-8" import="java.net.URLEncoder" %>
<%
request.setCharacterEncoding("UTF-8");
String address = URLEncoder.encode(request.getParameter("address"), "UTF-8");
session.setAttribute("address", address);
session.setMaxInactiveInterval(60 * 3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerEmail.jsp</title>
</head>
<body>
<p>送信しました</p>
<a href="registerEmail.jsp">戻る</a>
</body>
</html>