<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>管理员登录</title>

  <%-- 由于 Bootstrap 基于 JQuery 完成，所以需要先导入 JQuery 的开发包 --%>
  <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script type="text/javascript">
  </script>
</head>
<body>

<div class="container" style="width: 400px">
  <h3 style="text-align: center">管理员登录</h3>
  <form action="${pageContext.request.contextPath}/loginServlet" method="post">

    <div class="form-group">
      <label for="user">用户名：</label>
      <input type="text" name="username" class="form-control" id="user" placeholder="请输入用户名"/>
    </div>

    <div class="form-group">
      <label for="password">密码：</label>
      <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码">
    </div>

    <div class="form-group" style="text-align: center">
      <input class="btn btn-primary" type="submit" value="Submit">
    </div>
  </form>

  <div class="alert alert-warning alert-dismissable" role="alert">
    <button type="button" class="close" data-dismiss="alert">
      <span>x</span>
    </button>
    <strong>${login_msg}</strong>
  </div>
</div>

</body>
</html>