<%@ page contentType="text/html; charset=UTF-8" import="java.util.HashMap, java.util.Map, java.util.Date, java.text.SimpleDateFormat, java.net.URLEncoder, java.net.URLDecoder "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String dateNow = "";
SimpleDateFormat dateForm = new SimpleDateFormat("yyyy年MM月dd日E曜日");
Date now = new Date();
String day = request.getParameter("day");
String month = request.getParameter("month");
String year = request.getParameter("year");
String d = year + "/" + month + "/" + day;

if (day == null || month == null || year == null) { 
	dateNow = dateForm.format(now);
}
else {
	SimpleDateFormat dateForm2 = new SimpleDateFormat("yyyy/MM/dd");
	now = dateForm2.parse(d);
	dateNow = dateForm.format(now);
}
request.setAttribute("dateNow", dateNow);
%>
<%
Map<String, String> eventDay = new HashMap<>();
eventDay.put("01月01日", "元日");
eventDay.put("02月11日", "建国記念の日");
eventDay.put("02月14日", "バレンタインデー");
eventDay.put("02月23日", "天皇誕生日");
eventDay.put("03月03日", "ひな祭り");
eventDay.put("03月14日", "ホワイトデー");
eventDay.put("04月01日", "エイプリルフール");
eventDay.put("04月29日", "昭和の日");
eventDay.put("05月03日", "憲法記念日");
eventDay.put("05月04日", "みどりの日");
eventDay.put("05月05日", "こどもの日");
eventDay.put("07月07日", "七夕");
eventDay.put("08月15日", "終戦記念日");
eventDay.put("09月23日", "秋分の日");
eventDay.put("10月31日", "ハロウィン");
eventDay.put("11月03日", "文化の日");
eventDay.put("11月15日", "七五三");
eventDay.put("11月23日", "勤労感謝の日");
eventDay.put("12月25日", "クリスマス");
eventDay.put("12月31日", "大晦日");
String event = eventDay.get(dateNow.substring(5, 11));
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
        <c:out value="${dateNow}" /><br>
		<c:out value="${event}" />
    </div>
    <form Method="POST" action="calendar.jsp">
        <input type="text" name="year" size="3">年
        <input type="text" name="month" size="3">月
        <input type="text" name="day" size="3">日
        <input type="submit" value="送信">
    </form>
        
</body>  
</html>    