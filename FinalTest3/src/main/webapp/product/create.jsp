<%--
  Created by IntelliJ IDEA.
  User: macbookprom1
  Date: 10/01/2022
  Time: 09:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
                <input type="text" name="name" class="form-control" id="name" placeholder="Select the name">


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
                <select name="gender" class="form-control">
                    <option value="1">Phone</option>
                    <option value="0">Television</option>
                </select>


                <%--                            <div class="form-group col-12 col-sm-12 col-md-2">--%>
                <%--                                <button type="submit" class="btn btn-primary" id="submit">Thêm mới</button>--%>
                <%--                                <button type="submit" class="btn btn-primary" href="student">Quay lại</button>--%>
                <%--                                <a href="#" class="btn btn-success" id="submit">Thêm mới</a>--%>
                <%--                                <a href="#" class="btn btn-warning" href="student">Quay lại </a>--%>
                <input type="submit" value="Thêm mới" class="btn btn-success" id="submit">
                <a class="btn btn-warning" href="student">Quay lại </a>
                <%--                            </div>--%>
            </form>
        </div>
    </div>
</section>
</body>
</html>
