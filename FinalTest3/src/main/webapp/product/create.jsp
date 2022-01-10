<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Phần mềm quản lý điểm</title>
<%--    <%@ include file="../layout/head.jsp"%>--%>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
<%--    <%@ include file="../layout/header.jsp"%>--%>
<%--    <%@ include file="../layout/sidebarleft.jsp"%>--%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Tạo sản phẩm</h1>
                    </div><!-- /.col -->
                    <div class="col">

                    </div>
                    <div class="col">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard v1</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- Main content -->
        <p>
            <c:if test='${requestScope["message"] != null}'>
                <span style="color:red; margin-left: 15px" class="message">${requestScope["message"]}</span>
            </c:if>
        </p>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <%--            Content here--%>

                        <form method="post" >

                            <label>Name: </label>
                            <input type="text" name="productname" class="form-control" id="productnname" placeholder="Select the name">


                            <label>Price: </label>
                            <input type="text" name="price" class="form-control" id="price" >
                            <%--                <select name="gender" class="form-control">--%>
                            <%--                    <option value="1">Nam</option>--%>
                            <%--                    <option value="0">Nữ</option>--%>
                            <%--                </select>--%>


                            <label>Quantity: </label>
                            <input type="text" name="quantity" class="form-control" id="quantity" >


                            <label>Color: </label>
                            <input type="text" name="color" class="form-control" id="color" >


                            <label>Description: </label>
                            <input type="text" name="description" class="form-control" id="description" >


                            <label>Category: </label>
                            <select name="category" class="form-control">
                                <option value="1">Phone</option>
                                <option value="0">Television</option>
                            </select>

                            <input type="submit" value="Thêm mới" class="btn btn-success" id="submit">
                            <a class="btn btn-warning" href="product">Quay lại </a>
                            <%--                            </div>--%>
                        </form>
                </div>
            </div>
        </section>
        <!-- /.content-header -->
    </div>
<%--    <%@ include file="../layout/footer.jsp"%>--%>
</div>

</body>
<%--<%@ include file="../layout/script.jsp"%>--%>
</html>