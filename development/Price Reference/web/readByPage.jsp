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
            document.getElementById("deleteSelected").onclick = function () {
                //判断是否有选中条目
                var boolean = false;
                var checkBoxS = document.getElementsByName("checkBoxChild");
                for (var i = 0; i < checkBoxS.length; i++) {
                    if (checkBoxS[i].checked) {
                        boolean = true;
                        break;
                    }
                }
                //boolean 放 confirm() 前面，没有复选框被选中的话，将不会弹窗
                if (boolean && confirm("确认删除选中")) {
                    document.getElementById("form").submit();
                }
            };

            //复选框功能优化
            document.getElementById("checkBoxParent").onclick = function () {
                var checkBoxS = document.getElementsByName("checkBoxChild");
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

    <div>
        <form class="form-inline" action="${pageContext.request.contextPath}/readByCriteriaServlet" method="post">
            <div class="form-group">
                <label for="criteria">🔍</label>
                <input type="text" name="criteria" value="${criteria}" class="form-control" id="criteria">
            </div>

            <button type="submit" class="btn btn-primary">Query</button>
            <button type="button" class="btn btn-default" onclick="javascript:window.location.href='${pageContext.request.contextPath}/readServlet'">Reset</button>
        </form>
    </div>

    <div style="float:left;">
        <form class="form-inline" action="${pageContext.request.contextPath}/readByPageServlet" method="post">
            <div class="form-group">
                <label for="classify">Classify</label>
                <input type="text" name="classify" value="${condition.classify[0]}" class="form-control" id="classify">
            </div>
            <div class="form-group">
                <label for="brand">&nbsp;Brand</label>
                <input type="text" name="brand" value="${condition.brand[0]}" class="form-control" id="brand">
            </div>
            <div class="form-group">
                <label for="version">&nbsp;Version</label>
                <input type="text" name="version" value="${condition.version[0]}" class="form-control" id="version">
            </div>
            <div class="form-group">
                <label for="description">&nbsp;Description</label>
                <input type="text" name="description" value="${condition.description[0]}" class="form-control" id="description">
            </div>
            <button type="submit" class="btn btn-primary">Query</button>
            <button type="button" class="btn btn-default" onclick="javascript:window.location.href='${pageContext.request.contextPath}/readByPageServlet'">Reset</button>
        </form>
    </div>

    <div style="float:right;margin: 5px;">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/create.jsp">Create</a>
        <a class="btn btn-danger" href="javascript:void(0);" id="deleteSelected">Delete the Selected</a>
    </div>

    <form id="form" action="${pageContext.request.contextPath}/deleteSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" id="checkBoxParent"></th>
                <th>ID</th>
                <th>Classify</th>
                <th>Brand</th>
                <th>Version</th>
                <th>Description</th>

                <th>Weight<br>
                    Capacity</th>
                <th>Quantity</th>

                <th>Price</th>
                <th>CP</th>
                <th>UP</th>

                <th>Lowest<br>
                    Price</th>
                <th>CP</th>
                <th>UP</th>

                <th>Actual<br>
                    Payment</th>
                <th>CP</th>
                <th>UP</th>

                <th>Date</th>
                <th>Operation</th>
            </tr>
            <c:forEach items="${page.list}" var="commodity" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="checkBoxChild" value="${commodity.id}"></td>
                    <td>${s.count}</td>
                    <td>${commodity.classify}</td>
                    <td>${commodity.brand}</td>
                    <td>${commodity.version}</td>
                    <td>${commodity.description}</td>
                    <td>${commodity.weightCapacity}</td>
                    <td>${commodity.quantity}</td>

                    <td style="color: #CC0000">${commodity.price}</td>
                    <td>${commodity.costPerformance1}</td>
                    <td>${commodity.unitPrice1}</td>

                    <td style="color: green"><b>${commodity.lowestPrice}</b></td>
                    <td>${commodity.costPerformance2}</td>
                    <td>${commodity.unitPrice2}</td>

                    <td style="color: #1E9FFF"><b>${commodity.actualPayment}</b></td>
                    <td>${commodity.costPerformance3}</td>
                    <td>${commodity.unitPrice3}</td>

                    <td>${commodity.date}</td>
                    <td>
                        <a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/readByIdServlet?id=${commodity.id}">Update</a>
                        <a class="btn btn-danger btn-sm" href="javascript:deleteUser(${commodity.id});">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <div>
        <div style="float:left;">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                    <c:if test="${page.currentPage == 1}">
                        <li class="disabled">
                            </c:if>
                    <c:if test="${page.currentPage != 1}">
                        <li>
                            </c:if>

                        <a href="${pageContext.request.contextPath}/readByPageServlet?currentPage=${page.currentPage - 1}&rows=${page.rows}&classify=${condition.classify[0]}&brand=${condition.brand[0]}&version=${condition.version[0]}&description=${condition.description[0]}"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                    <c:forEach begin="1" end="${page.totalPage}" var="i">
                        <c:if test="${page.currentPage == i}">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/readByPageServlet?currentPage=${i}&rows=${page.rows}&classify=${condition.classify[0]}&brand=${condition.brand[0]}&version=${condition.version[0]}&description=${condition.description[0]}">${i}</a>
                            </li>
                        </c:if>
                        <c:if test="${page.currentPage != i}">
                            <li>
                                <a href="${pageContext.request.contextPath}/readByPageServlet?currentPage=${i}&rows=${page.rows}&classify=${condition.classify[0]}&brand=${condition.brand[0]}&version=${condition.version[0]}&description=${condition.description[0]}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${page.currentPage != page.totalPage}">
                        <li>
                            </c:if>
                    <c:if test="${page.currentPage == page.totalPage}">
                        <li class="disabled">
                            </c:if>

                        <a href="${pageContext.request.contextPath}/readByPageServlet?currentPage=${page.currentPage+1}&rows=${page.rows}&classify=${condition.classify[0]}&brand=${condition.brand[0]}&version=${condition.version[0]}&description=${condition.description[0]}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <span style="font-size: 25px;margin-left: 5px;">
                    共 ${page.totalRows} 条记录，共 ${page.totalPage} 页
                </span>

                </ul>
            </nav>
        </div>

        <div style="float:right;">
            <select onchange="javascript:location.href=this.value;">
                <c:forEach begin="10" end="25" step="3" var="i">
                    <c:if test="${page.rows == i}">
                        <option selected
                                value="${pageContext.request.contextPath}/readByPageServlet?currentPage=${page.currentPage}&rows=${i}&classify=${condition.classify[0]}&brand=${condition.brand[0]}&version=${condition.version[0]}&description=${condition.description[0]}">${i}
                            条/页
                        </option>
                    </c:if>
                    <c:if test="${page.rows != i}">
                        <option value="${pageContext.request.contextPath}/readByPageServlet?currentPage=${page.currentPage}&rows=${i}&classify=${condition.classify[0]}&brand=${condition.brand[0]}&version=${condition.version[0]}&description=${condition.description[0]}">${i}
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
