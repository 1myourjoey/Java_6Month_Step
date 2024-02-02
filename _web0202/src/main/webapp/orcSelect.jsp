<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table { width: 400px; text-align: center; }
        th    { background-color: cyan; }
    </style>    
</head>
<body>
<button onclick="location.href='index.jsp'"> HOME </button>
<button onclick="location.href='orcInsertForm.jsp'"> ADD STUDENT </button>
<table>
    <tr>
        <th>번호</th><th>이름</th>
        <th>국어</th><th>영어</th><th>수학</th>
        <th>총점</th><th>평균</th>
    </tr>
<%
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Class.forName("oracle.jdbc.driver.OracleDriver");
    try ( 
    		Connection conn = DriverManager.getConnection(
            		url, "scott", "tiger");
    	PreparedStatement pstmt = conn.prepareStatement("select * from score");
        ResultSet rs = pstmt.executeQuery();
    ) {
        while (rs.next()) {
            int sum = rs.getInt("kor") + rs.getInt("eng") + 
                      rs.getInt("math");
%>         
            <tr>
            	
                <td><%=rs.getInt   ("num" )%></td>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getInt   ("kor" )%></td>
                <td><%=rs.getInt   ("eng" )%></td>
                <td><%=rs.getInt   ("math")%></td>
                <td><%=sum%></td>
                <td><%=String.format("%.2f", (float)sum / 3)%></td>
                 
         <td><a href ="orcDelete.jsp?num=<%=rs.getInt("num")%>">삭제</a> </td>
            </tr>
<%          
        }
        
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
</table>

</body>
</html>