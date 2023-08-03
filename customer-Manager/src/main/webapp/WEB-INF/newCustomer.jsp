<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <style>
        .style-form {
            margin: 0 auto 50px;
        }

        .btn {
            margin-left: 17%;
        }

        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 4px;
            display: none;
        }
    </style>
</head>
<body>
<h1>Add new Customer</h1>
<form class="style-form" action="<%=request.getContextPath()%>/CustomerServlet" method="post"
      onsubmit="return validateForm()">
    <div class="mb-2 row">
        <label class="col-sm-1 col-form-label" for="name">Nhập tên</label>
        <div class="col-sm-3">
            <input class="form-control" type="text" id="name" name="name">
            <div class="error-message" id="nameError">Vui lòng nhập tên sản phẩm</div>
        </div>
    </div>
    <div class="mb-2 row">
        <label class="col-sm-1 col-form-label" for="email">Email</label>
        <div class="col-sm-3">
            <input class="form-control" type="text" min="0" id="email" name="email">
            <div class="error-message" id="priceError">Vui lòng nhập Email</div>
        </div>
    </div>
    <div class="mb-2 row">
        <label class="col-sm-1 col-form-label" for="address">Address</label>
        <div class="col-sm-3">
            <input class="form-control" type="text" min="0" id="address" name="address">
            <div class="error-message" id="stockError">Vui lòng nhập địa</div>
        </div>
    </div>

    <input class="btn btn-primary" type="submit" value="ADD" name="action"/>
</form>

<script>
    function validateForm() {
        // Get the input values
        let nameInput = document.getElementById("name");
        let priceInput = document.getElementById("price");
        let stockInput = document.getElementById("stock");
        let statusInput = document.getElementById("status");

        // Get the error message elements
        let nameError = document.getElementById("nameError");
        let priceError = document.getElementById("priceError");
        let stockError = document.getElementById("stockError");
        let statusError = document.getElementById("statusError");

        // Check if the input values are empty
        if (nameInput.value.trim() === "") {
            nameError.style.display = "block";
            return false; // Prevent form submission
        } else {
            nameError.style.display = "none";
        }

        if (priceInput.value.trim() === "") {
            priceError.style.display = "block";
            return false; // Prevent form submission
        } else {
            priceError.style.display = "none";
        }
        if (stockInput.value.trim() === "") {
            stockError.style.display = "block";
            return false; // Prevent form submission
        } else {
            stockError.style.display = "none";
        }
        if (statusInput.value.trim() === "") {
            statusError.style.display = "block";
            return false; // Prevent form submission
        } else {
            statusError.style.display = "none";
        }
        // Form is valid, allow form submission
        return true;
    }
</script>
</body>
</html>
