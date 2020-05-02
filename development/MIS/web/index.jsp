<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020-4-24
  Time: 20:35
  To change this template use File | Settings | File Templates.
  基于 《Bootstrap + JSP 开发案例》 的用户信息管理系统
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <title>用户信息管理系统</title>
  <meta charset="UTF-8">

  <%-- 由于 Bootstrap 基于 JQuery 完成，所以需要先导入 JQuery 的开发包 --%>
  <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
  <style type="text/css">
    td,th{
      text-align: center;
    }
  </style>
</head>
<body>
<div class="container">
  <h3 style="...">用户信息列表</h3>

  <h3>${pageContext.request.contextPath}</h3>

  <div style="float:left;">
    <form class="form-inline">
      <div class="form-group">
        <label for="Input1">ID</label>
        <input type="text" class="form-control" id="Input1" placeholder="123">
      </div>
      <div class="form-group">
        <label for="Input2">Password</label>
        <input type="text" class="form-control" id="Input2" placeholder="***">
      </div>
      <button type="submit" class="btn btn-default">Send invitation</button>
    </form>
  </div>

  <div style="float:right;margin: 5px;">
    <a class="btn btn-primary" href="add.html">ADD</a>
    <a class="btn btn-primary" href="delete.html">Delete the selected</a>
  </div>

  <table border="1" class="table table-bordered table-hover">
    <tr class="success">
      <th><input type="checkbox"></th>
      <th>编号</th>
      <th>ID</th>
      <th>Password</th>
      <th>Operation</th>
    </tr>
    <c:forEach items="${users}" var="user" varStatus="s">
      <tr>
        <td><input type="checkbox"></td>
        <td>${s.count}</td>
        <td>${user.mid}</td>
        <td>${user.password}</td>
        <td><a class="btn btn-default btn-sm" href="update.html">Update</a> &nbsp; <a class="btn btn-default btn-sm" href="delete.html">Delete</a></td>
      </tr>
    </c:forEach>

    <tr>
      <td colspan="8" align="center"><a class="btn btn-primary" href="add.html">Add</a> </td>
    </tr>
  </table>

  <div>
    <nav aria-label="Page navigation">
      <ul class="pagination">
        <li>
          <a href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li>
          <a href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
        <span>共 16 条记录，共 4 页</span>
      </ul>
    </nav>
  </div>
</div>
</body>
</html>
