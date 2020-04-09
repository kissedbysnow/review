<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020-4-9
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.management.remote.JMXConnectionNotification" %>
<html>
<head>
    <title>《Bootstrap + JSP 开发案例》</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,inital-scale=1">
    <%-- 由于 Bootstrap 基于 JQuery 完成，所以需要先导入 JQuery 的开发包 --%>
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<%
    String mid = request.getParameter("mid");
    String password = request.getParameter("password");
%>
<%!
    public static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/loginform";
    public static final String DBUSER = "root";
    public static final String PASSWORD = "123456";
%>
<%
    boolean flag = false;
    Class.forName(DBDRIVER);                                        //加载数据库的驱动程序
    Connection conn = DriverManager.getConnection(DBURL, DBUSER, PASSWORD);
    String sql = "SELECT COUNT(*) FROM member WHERE mid=? AND password=?";
    PreparedStatement preS = conn.prepareStatement(sql);             //本次使用就是为了进行问题分析
    preS.setString(1,mid);
    preS.setString(2,password);
    ResultSet rs = preS.executeQuery();
    if (rs.next()) {
        if (rs.getInt(1) > 0) {
            flag = true;
        }
    }
    conn.close();
%>
<%
    if (flag){
%>
    <h1>用户登录成功!!</h1>
<%
    }else{
%>
    <h1>用户登录失败，重新<a href="index.jsp">登录</a> </h1>
<%
    }
%>
</body>
</html>
