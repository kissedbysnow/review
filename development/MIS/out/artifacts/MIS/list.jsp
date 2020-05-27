<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- 指定字符集 -->
    <meta charset="UTF-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户信息管理系统</title>


    <%-- 由于 Bootstrap 基于 JQuery 完成，所以需要先导入 JQuery 的开发包 --%>
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script>
        function deleteUser(id) {
            //用户安全提示
            if (confirm("确认删除")) {
                location.href = "${pageContext.request.contextPath}/delUserServlet?id=" + id;
            }
        }

        window.onload = function () {
            //删除选中按钮 添加单机事件
            document.getElementById("delSelected").onclick = function () {
                //判断是否有选中条目
                var boolean = false;
                var checkBox = document.getElementsByName("uid")
                for (var i = 0; i < checkBox.length; i++) {
                    if (checkBox[i].checked) {
                        boolean = true;
                        break;
                    }
                }
                //boolean 放 confirm() 前面，没有复选框被选中的话，将不会弹窗
                if (boolean && confirm("确认删除选中")) {
                    document.getElementById("form").submit();
                }
            }

            //复选框功能优化
            document.getElementById("firstCb").onclick = function () {
                var checkBoxS = document.getElementsByName("uid");
                for (var i = 0; i < checkBoxS.length; i++) {
                    checkBoxS[i].checked = this.checked;
                }
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1 style="text-align: center">用户信息列表</h1>

    <div style="float:left;">
        <form class="form-inline" action="${pageContext.request.contextPath}/findUserByPageServlet" method="post">
            <div class="form-group">
                <label for="exampleInputName">姓名</label>
                <input type="text" name="name" value="${condition.name[0]}" class="form-control" id="exampleInputName">
            </div>
            <div class="form-group">
                <label for="exampleInputAddress">籍贯</label>
                <input type="text" name="address" value="${condition.address[0]}" class="form-control" id="exampleInputAddress">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail">邮箱</label>
                <input type="text" name="email" value="${condition.email[0]}" class="form-control" id="exampleInputEmail">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>

    <div style="float:right;margin: 5px;">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">ADD</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">Delete the selected</a>
    </div>

    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" id="firstCb"></th>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>籍贯</th>
                <th>QQ</th>
                <th>邮箱</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pb.list}" var="user" varStatus="s">
                <%-- 分行显示薰衣草色或白色--%>
                <%-- <tr style='background-color: ${s.count %2==0 ?"lavender":"white"};'>--%>
                <tr>
                    <td><input type="checkbox" name="uid" value="${user.id}"></td>
                    <td>${s.count}</td>
                    <td>${user.name}</td>
                    <td>${user.gender}</td>
                    <td>${user.age}</td>
                    <td>${user.address}</td>
                    <td>${user.qq}</td>
                    <td>${user.email}</td>
                    <td><a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}">Update</a> &nbsp;
                        <a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.id});">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
    <div>
        <div style="float:left;">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pb.currentPage == 1}">
                    <li class="disabled">
                        </c:if>
                        <c:if test="${pb.currentPage != 1}">
                    <li>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage - 1}&rows=${pb.rows}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                    <c:forEach begin="1" end="${pb.totalPage}" var="i">
                        <c:if test="${pb.currentPage == i}">
                            <li class="active"><a
                                    href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=${pb.rows}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a>
                            </li>
                        </c:if>
                        <c:if test="${pb.currentPage != i}">
                            <li>
                                <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=${pb.rows}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pb.currentPage != pb.totalPage}">
                    <li>
                        </c:if>
                        <c:if test="${pb.currentPage == pb.totalPage}">
                    <li class="disabled">
                        </c:if>
                        <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage+1}&rows=${pb.rows}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <span style="font-size: 25px;margin-left: 5px;">
                    共 ${pb.totalCount} 条记录，共 ${pb.totalPage} 页
                </span>

                </ul>
            </nav>
        </div>
        <div style="float:right;">
            <select onchange="javascript:location.href=this.value;">
                <c:forEach begin="10" end="50" step="5" var="i">
                    <c:if test="${pb.rows == i}">
                        <option selected
                                value="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage}&rows=${i}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}
                            条/页
                        </option>
                    </c:if>
                    <c:if test="${pb.rows != i}">
                        <option value="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage}&rows=${i}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}
                            条/页
                        </option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
    </div>
</div>
</body>
</html>
