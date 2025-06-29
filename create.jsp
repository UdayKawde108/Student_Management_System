
<%@ page import="java.sql.*" %>
<html>

<head><title>Sms App by Kamal Sir</title>

<link rel="stylesheet" href="mystyle.css" ></link>

<script src="myjs.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<br/>

<h1>Create Page</h1>
<form>
<input type="number" placeholder="enter rno" name="rno" id="id_rno"/><br/><br/>
<input type="text" placeholder="enter name" id="id_name" name="name"/><br/><br/>
<input type="number" placeholder="enter marks" id="id_marks" name="marks"/>
<input type="submit" value="Submit" name="btn"/>

</form> 
<h2 id="id_msg"></h2>

<% 
if(request.getParameter("btn") !=null){

int rno=Integer.parseInt(request.getParameter("rno"));

String name=request.getParameter("name");

int marks=Integer.parseInt(request.getParameter("marks"));

try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/sms_app";
Connection con= DriverManager.getConnection(url,"root","Password");

String sql = "insert into student values(?, ?, ?)";

PreparedStatement pst=con.prepareStatement(sql);
pst.setInt(1,rno);
pst.setString(2,name);
pst.setInt(3,marks);
pst.executeUpdate();

String msg="record create";

%>

<h2 id="id_msg"><%=msg%></h2>
<%

con.close();
}
catch(SQLIntegrityConstraintViolationException e)
{
out.println(rno+ "already exists");
}
catch(SQLException e)
{
out.println("issue"+e);
}
}

%>
</body>
</html>



