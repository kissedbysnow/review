<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020-4-8
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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

  <style>
    html,body{
      width: 100%;
      height: 100%;
      margin: 0;              /* 边缘 边界 */
      padding: 0;             /* 内边距 */
    }
    body{
      display: flex;
      align-items: center;
      justify-content: center;
    }
  </style>

</head>
<body>
  <div class="container">
    <%-- 由于本次的编写需要基于表单，同时还需要考虑到数据验证的问题，那么就可以不写 row 样式 --%>
    <form id="loginForm" action="check.jsp" method="post" class="form-horizontal">
      <fieldset>
        <legend><label><span class="glyphicon glyphicon-user"></span>&nbsp;用户登录：</label></legend>
        <%-- 描述 mid 输入信息的内容 --%>

        <div class="form-group" id="midDiv">
          <label class="col-md-3 control-label" for="mid">用户名：</label>
          <div class="col-md-5">
            <%-- id 是为了 JavaScript 服务的，而 name 是为了 JSP 的接收数据服务的--%>
            <input type="text" id="mid" name="mid" class="form-control" placeholder="请输入登录名">
          </div>
          <div class="col-md-4" id="midSpan"></div>
        </div>

        <div class="form-group" id="passwordDiv">
          <label class="col-md-3 control-label" for="password">密码：</label>
          <div class="col-md-5">
            <input type="password" id="password" name="password" class="form-control" placeholder="请输入登录密码">
          </div>
          <div class="col-md-4" id="passwordSpan"></div>
        </div>

        <div class="form-group" id="buttonDiv">
          <div class="col-md-5 col-md-offset-3">
            <button type="submit" id="submit" class="btn btn-xs btn-primary">登录</button>
            <button type="reset" id="reset" class="btn btn-xs btn-warning">重置</button>
          </div>
        </div>
      </fieldset>
    </form>
  </div>
</body>
</html>
