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
        .content {
            width: 450px;
            height: 120px;
            background: pink;
        }
    </style>
</head>
<body>
<div class="content">
    <div align="center">
        <a href="${pageContext.request.contextPath}/readServlet" style="text-decoration:none;font-size:42px">读取
            commodity</a>
    </div>
    <div align="center">
        <a href="${pageContext.request.contextPath}/readByPageServlet" style="text-decoration:none;font-size:42px">分页读取
            commodity</a>
    </div>
</div>
</body>
</html>