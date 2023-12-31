<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <style>
        .style-form {
            margin: 0 auto 50px;
        }
    </style>
</head>

<body>
<h1>Edit </h1>
<form class="style-form" action="<%=request.getContextPath()%>/CustomerServlet" method="post">
    <input type="hidden" name="action" value="UPDATE">
    <input type="hidden" name="id" value="${customer.id}">
    <div class="mb-2 row">
        <label class="col-sm-1  col-form-label" for="name">Name</label>
        <div class="col-sm-3">
            <input class="form-control" minlength="0" type="text" id="name" name="updateName" value="${customer.name}">
        </div>
    </div>
    <div class="mb-2 row">
        <label class="col-sm-1 col-form-label" for="email">Email</label>
        <div class="col-sm-3">
            <input class="form-control" minlength="0" type="text" min="0" id="email" name="updateEmail"
                   value="${customer.email}">
        </div>
    </div>
    <div class="mb-2 row">
        <label class="col-sm-1 col-form-label" for="address">Address</label>
        <div class="col-sm-3">
            <input class="form-control" minlength="0" type="text" min="0" id="address" name="updateAddress"
                   value="${customer.address}">
        </div>
    </div>
    <input class="btn btn-primary " type="submit" value="Update">
    <a class="btn btn-secondary" href="/CustomerServlet">Cancel</a>
</form>
</body>
</html>
