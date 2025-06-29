



<%@ page import="java.sql.*" %>
<% 
String rnoStr = request.getParameter("rno");
%>
<html>
<head>
<title>SMS App by Kamal Sir</title>
<link rel="stylesheet" href="mystyle.css" ></link>
<script src="myjs.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<br/>
<h1>Delete page</h1>
<form>
<input type="number" name="rno" placeholder="enter rno" id="id_rno" value="<%=(rnoStr==null ? "" : rnoStr)%>"/>
<br/><br/>

<input type="submit" name="btn" />

</form>

<h2 is="id_msg"></h2>



<% 
if(request.getParameter("btn") != null)
{
int rno=Integer.parseInt(request.getParameter("rno"));

try{

DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

String url="jdbc:mysql://localhost:3306/sms_app";
Connection con = DriverManager.getConnection(url,"root","Password");

String sql="delete from student where rno = ?";
PreparedStatement pst=con.prepareStatement(sql);
pst.setInt(1,rno);
int r=pst.executeUpdate();
String msg=r+"record's Deleted";


%>
<h2 id="id_msg"><%=msg%></h2>
<%
con.close();
}
catch(SQLException e)
{
out.println("issue"+e);
}
}

%>

</body>
</html>