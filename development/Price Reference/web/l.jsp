<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020-4-29
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Price Reference</title>

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
                location.href = "${pageContext.request.contextPath}/deleteServlet?id=" + id;
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
<div class="container-fluid">
    <h1 style="text-align: center">Price Reference</h1>

    <div style="float:right;margin: 5px;">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/create.jsp">Create</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">Delete the selected</a>
    </div>

    <form>
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox"></th>
                <th>ID</th>
                <th>classify</th>
                <th>brand</th>
                <th>version</th>
                <th>description</th>
                <th>lowest<br>price</th>
                <th>price</th>
                <th>discount<br>price</th>
                <th>deduction</th>
                <th>actual<br>payment</th>
                <th>updatedDate</th>
                <th>purchasingDate</th>
                <th>Operation</th>
            </tr>
            <c:forEach items="${commodities}" var="commodity" varStatus="s">
                <tr>
                    <td><input type="checkbox"></td>
                    <td>${commodity.id}</td>
                    <td>${commodity.classify}</td>
                    <td>${commodity.brand}</td>
                    <td>${commodity.version}</td>
                    <td>${commodity.description}</td>
                    <td style="color: green"><b>${commodity.lowestPrice}</b></td>
                    <td style="color: #CC0000">${commodity.price}</td>
                    <td>${commodity.discountPrice}</td>
                    <td>${commodity.deduction}</td>
                    <td style="color: #1E9FFF"><b>${commodity.actualPayment}</b></td>
                    <td>${commodity.updatedDate}</td>
                    <td>${commodity.purchasingDate}</td>
                    <td>
                        <a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/readByIdServlet?id=${commodity.id}">Update</a>
                        <a class="btn btn-danger btn-sm" href="javascript:deleteUser(${commodity.id});">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>

</body>
</html>
