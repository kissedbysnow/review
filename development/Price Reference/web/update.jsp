<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update</title>

    <%-- 由于 Bootstrap 基于 JQuery 完成，所以需要先导入 JQuery 的开发包 --%>
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <script type="text/javascript">
        window.onload = function () {
            autoDate();
        }

        function autoDate() {
            var date = new Date();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDate();
            document.getElementById("date").value = year + "-" + month + "-" + day;
        }

        function delayTrigger() {//延时触发
            setTimeout(autoDate, 1);
        }
    </script>

</head>
<body>
<div class="container">

    <h1 style="text-align: center;">Update a Commodity Record</h1>

    <form class="form-horizontal" action="${pageContext.request.contextPath}/updateServlet" method="post">

        <div class="form-group">
            <label for="id" class="col-sm-2 control-label">ID</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="id" name="id" value="${commodity.id}" readonly="readonly">
            </div>
        </div>

        <div class="form-group">
            <label for="classify" class="col-sm-2 control-label">Classify</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="classify" name="classify" value="${commodity.classify}"
                       placeholder="classify">
            </div>
        </div>

        <div class="form-group">
            <label for="brand" class="col-sm-2 control-label">Brand</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="brand" name="brand" value="${commodity.brand}"
                       placeholder="brand">
            </div>
        </div>

        <div class="form-group">
            <label for="version" class="col-sm-2 control-label">Version</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="version" name="version" value="${commodity.version}"
                       placeholder="version">
            </div>
        </div>

        <div class="form-group">
            <label for="description" class="col-sm-2 control-label">Description</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="description" name="description"
                       value="${commodity.description}" placeholder="description">
            </div>
        </div>

        <div class="form-group">
            <label for="weightCapacity" class="col-sm-2 control-label">Weight or Capacity</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="weightCapacity" name="weightCapacity"
                       value="${commodity.weightCapacity}" placeholder="weight or capacity">
            </div>
        </div>

        <div class="form-group">
            <label for="quantity" class="col-sm-2 control-label">Quantity</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="quantity" name="quantity"
                       value="${commodity.quantity}" placeholder="quantity">
            </div>
        </div>

        <div class="form-group">
            <label for="price" class="col-sm-2 control-label" style="color: #CC0000">Price</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="price" name="price" value="${commodity.price}"
                       placeholder="price">
            </div>
        </div>

        <div class="form-group">
            <label for="lowestPrice" class="col-sm-2 control-label" style="color: green">Lowest Price</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="lowestPrice" name="lowestPrice"
                       value="${commodity.lowestPrice}" placeholder="lowest price">
            </div>
        </div>

        <div class="form-group">
            <label for="actualPayment" class="col-sm-2 control-label" style="color: #1E9FFF">Actual Payment</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="actualPayment" name="actualPayment"
                       value="${commodity.actualPayment}" placeholder="actual payment">
            </div>
        </div>

        <div class="form-group">
            <label for="date" class="col-sm-2 control-label">Date</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="date" name="date"
                       value="${commodity.date}" placeholder="date">
            </div>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="Submit"/>
            <input class="btn btn-default" type="reset" value="Reset" onclick="javascript:delayTrigger()"/>
            <input class="btn btn-default" type="button" value="Back"
                   onclick="javascript:window.location.href='${pageContext.request.contextPath}/readServlet'"/>
        </div>
    </form>
</div>
</body>
</html>