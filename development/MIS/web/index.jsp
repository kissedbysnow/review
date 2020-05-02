<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>首页</title>

  <%-- 由于 Bootstrap 基于 JQuery 完成，所以需要先导入 JQuery 的开发包 --%>
  <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script type="text/javascript">
  </script>
</head>
<body>

  <div >${user.name},欢迎您</div>
  <div align="center">
    <a href="${pageContext.request.contextPath}/findUserByPageServlet" style="text-decoration:none;font-size:33px">分页查询 用户信息</a>
  </div>

  <div align="center">
    <a href="${pageContext.request.contextPath}/userListServlet" style="text-decoration:none;font-size:33px">全部查询 用户信息</a>
  </div>

</body>
</html>