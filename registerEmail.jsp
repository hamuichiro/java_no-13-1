<%@ page contentType="text/html; charset=UTF-8" import="java.net.URLDecoder" %>
<%
String logout = request.getParameter("key");
if (logout != null && logout.equals("logout")) {
   	session.removeAttribute("address");
}
String address = (String)session.getAttribute("address");
if (address == null) {
    address = "";
}
else {
    address = URLDecoder.decode(address);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<form method="POST" action="<%= response.encodeURL("registerEmail2.jsp") %>">
Email:<input type="text" name="address" size="40" value="<%= address %>">
<input type="submit" value="送信">
</form>
<a href="registerEmail.jsp?key=logout">ログアウト</a>
</body>
</html>