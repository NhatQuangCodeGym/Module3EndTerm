<%--
  Created by IntelliJ IDEA.
  User: macbookprom1
  Date: 10/01/2022
  Time: 09:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<p>--%>
<%--    <c:if test='${requestScope["message"] != null}'>--%>
<%--        <span style="color:red; margin-left: 15px" class="message">${requestScope["message"]}</span>--%>
<%--    </c:if>--%>
<%--</p>--%>
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <%--            Content here--%>
            <form method="post" class="row">
                <c:if test="${product != null}">
                    <input type="hidden" name="id" value="${product.getId()}"/>
                </c:if>
                <div class="form-group col-12 col-sm-12 col-md-4">
                    <label>Name: </label>
                    <input type="text" name="productname" class="form-control" id="productname" value="${product.getProductName()}" placeholder="Select the name">
                </div>
                <div class="form-group col-12 col-sm-12 col-md-4">
                    <label>Price: </label>
                    <input type="text" name="price" class="form-control" id="price" value="${product.getPrice()}">
                </div>
                <div class="form-group col-12 col-sm-12 col-md-4">
                    <label>Quantity: </label>
                    <input type="text" name="quantity" class="form-control" id="quantity" value="${product.getQuantity()}">
                </div>
                <div class="form-group col-12 col-sm-12 col-md-4">
                    <label>Color: </label>
                    <input type="text" name="color" class="form-control" id="color" value="${product.getColor()}" >
                </div>
                <div class="form-group col-12 col-sm-12 col-md-4">
                    <label>Description: </label>
                    <input type="text" name="description" class="form-control" id="description" value="${product.getDescription()}">
                </div>
                <div class="form-group col-12 col-sm-12 col-md-4">
                    <label>Category: </label>
                    <select name="category" class="form-control">
                        <c:choose>
                            <c:when test="${product.getCategory() == 1}">
                                <option value="1" selected>Television</option>
                                <option value="0">Phone</option>
                            </c:when>
                            <c:when test="${product.getCategory() == 0}">
                                <option value="1" >Television</option>
                                <option value="0 selected">Phone</option>
                            </c:when>
                        </c:choose>
                    </select>
                </div>
                <div class="form-group col-12 col-sm-12 col-md-4">
                    &nbsp;
                </div>

                <div class="form-group col-12 col-sm-12 col-md-2">
                    <button type="submit" class="btn btn-primary" id="submit">Cập nhật</button>
                </div>
            </form>
        </div>
    </div>
</section>
</body>
</html>
