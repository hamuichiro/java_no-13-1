<%@ page contentType="text/html; charset=UTF-8" import="java.util.HashMap, java.util.Map, java.util.Date, java.text.SimpleDateFormat, java.net.URLEncoder, java.net.URLDecoder "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setLocale value="ja_JP"/>
<%
request.setCharacterEncoding("UTF-8");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");


String dateNow = "";
if (year == null || month == null || day == null) { 
	Date now = new Date();
	SimpleDateFormat dateForm = new SimpleDateFormat("yyyy/MM/dd");
	dateNow = dateForm.format(now);
	String[] dates = dateNow.split("/");
	request.setAttribute("dates", dates);
}
else {
	year = year.format("%4s", year).replace(" ", "0");
	month = month.format("%2s", month).replace(" ", "0");
	day = day.format("%2s", day).replace(" ", "0");	
	dateNow = year + "/" + month + "/" + day;
	String[] dates = {year, month, day};
	request.setAttribute("dates", dates);
}
request.setAttribute("dateNow", dateNow);
%>
<%
Map<String, String> eventDay = new HashMap<>();
eventDay.put("01/01", "元日");
eventDay.put("02/11", "建国記念の日");
eventDay.put("02/14", "バレンタインデー");
eventDay.put("02/23", "天皇誕生日");
eventDay.put("03/03", "ひな祭り");
eventDay.put("03/14", "ホワイトデー");
eventDay.put("04/01", "エイプリルフール");
eventDay.put("04/29", "昭和の日");
eventDay.put("05/03", "憲法記念日");
eventDay.put("05/04", "みどりの日");
eventDay.put("05/05", "こどもの日");
eventDay.put("07/07", "七夕");
eventDay.put("08/15", "終戦記念日");
eventDay.put("09/23", "秋分の日");
eventDay.put("10/31", "ハロウィン");
eventDay.put("11/03", "文化の日");
eventDay.put("11/15", "七五三");
eventDay.put("11/23", "勤労感謝の日");
eventDay.put("12/25", "クリスマス");
eventDay.put("12/31", "大晦日");
String event = eventDay.get(dateNow.substring(5, 10));
if (event == null) {
	event = "行事なし";
}
request.setAttribute("event", event);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <div>
	<!--<fmt:parseDate value="${dateNow}" var="date" type="DATE"/>-->
   	<fmt:formatDate value="${date}" var="today" type="DATE" pattern="（E）"/>
   	<c:out value="${fn:join(dates, '/')}"/>
   	<c:out value="${today}"/>
	<c:out value="${event}"/>
  </div>  
  <form Method="POST" action="calendar.jsp">
        <input type="text" name="year" size=3>年
        <input type="text" name="month" size=3>月
        <input type="text" name="day" size=3>日
        <input type="submit" value="送信">
   </form>  
</body>  
</html>    