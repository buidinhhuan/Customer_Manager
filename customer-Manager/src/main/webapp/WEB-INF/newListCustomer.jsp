<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <style>
        h1, table {
            width: 60%;
            text-align: center;
            margin: 0 auto 50px;
        }

        .input-group {
            width: 50%;
            margin-left: 25%;
        }
    </style>
</head>
<body>
<h1>Danh sách sản phẩm</h1>
<form action="/CustomerServlet" method="get">
    <div class="input-group mb-3">
        <input type="text" class="form-control" name="searchText" placeholder="enter search text"
               aria-label="Recipient's username" aria-describedby="button-addon2">
        <button class="btn btn-primary" name="action" value="SEARCH" type="submit" id="button-addon2">Tìm Kiếm</button>
    </div>
</form>

<a href="<%=request.getContextPath()%>/CustomerServlet?action=CREATE">
    <button type="button" class="btn btn-info">ADD</button>
</a>
<table class="table-primary" border="10" cellspacing="10" cellpadding="10" style="text-align: center">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th colspan="2">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers}" var="c" varStatus="item">
        <tr>
            <td>${c.getId()}</td>
            <td>${c.name}</td>
            <td>${c.email}</td>
            <td>${c.address}</td>
            <td><a href="<%=request.getContextPath()%>/CustomerServlet?action=EDIT&id=${c.id}">
                <button type="button" class="btn btn-warning">Edit</button>
            </a></td>
            <td><a onclick="return confirm('Do you want to delete this customer ?')"
                   href="<%=request.getContextPath()%>/CustomerServlet?action=DELETE&id=${c.id}">
                <button type="button" class="btn btn-danger">Delete</button>
            </a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
