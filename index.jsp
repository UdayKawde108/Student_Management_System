
<%@ page import="java.sql.*" %>
<html>
<head><title>Sms App by Kamal Sir</title>

<link rel="stylesheet" href="mystyle.css" ></link>

<script src="myjs.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<br/>

<h1>Home Page</h1>

<table border="5">
<tr>
<th>Rno</th>
<th>Name</th>
<th>Marks</th>
<th>Delete</th>
<th>Update</th>
</tr>

<%

try{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/sms_app";
Connection con=DriverManager.getConnection(url,"root","Password");

String sql="select * from student";
PreparedStatement pst=con.prepareStatement(sql);
ResultSet rs=pst.executeQuery();
while(rs.next())
{
int rno=rs.getInt(1);
String name=rs.getString(2);
int marks=rs.getInt(3);


%>

<tr>
<td><%=rno %></td>
<td><%=name %></td>

<td> <%=marks %></td>
<td><a href="delete.jsp? rno=<%=rno%>"><button onclick="return confirm('r u sure ??')">Delete</button></a></td>
<td><a href="update.jsp? rno=<%=rno%>"><button onclick="return confirm('r u sure ??')">Update</button></a></td>


</tr>

<%
}
con.close();
}
catch(SQLException e)
{
out.println("issue"+e);
}
%>
</table>
</body>





</html>