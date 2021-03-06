<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <%--            Content here--%>
            <div class="col-sm-12">
                <div class="card-box table-responsive">
                    <div class="row justify-content-between mb-2 mr-2 ml-2">
                        <a href="${pageContext.request.contextPath}/product?action=create" class="btn btn-sm btn-outline-primary my-2 my-sm-0"><i class="fas fa-plus"></i> Thêm mới</a>
                        <form class="form-inline my-2 my-lg-0" method="post" action="${pageContext.request.contextPath}/product?action=search">
                            <input class="form-control form-control-sm mr-sm-2" name="string-search" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-sm btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>

                    <table id="myTable" class="table table-colored-bordered table-bordered table-bordered-teal dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                        <thead>
                        <tr class="text-center">
                            <th scope="col" >Id</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Color</th>
                            <th scope="col">Category</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope['productList']}" var="product">

                            <tr class="text-center" >
                                <td scope="row">${product.getId()}</td>
                                <td>${product.getProductName()}</td>
                                <td>${product.getPrice()}</td>
                                <td>${product.getQuantity()}</td>
                                <td>${product.getColor()}</td>
                                <c:if test="${product.getCategory() == 1}">
                                    <td>
                                        <span class="badge badge-primary">Phone</span>
                                    </td>
                                </c:if>
                                <c:if test="${product.getCategory() == 0}">
                                    <td>
                                        <span class="badge badge-danger">Television</span>
                                    </td>
                                </c:if>

                                <td>
                                    <a href="${pageContext.request.contextPath}/product?action=edit&id=${product.getId()}"
                                       title="Edit" class="btn-me" id="btn-edit">
                                        edit
                                    </a>
                                    <a href="${pageContext.request.contextPath}/product?action=delete&id=${product.getId()}" title="Delete"
                                       class="btn-me delete" id="btn-trash">
                                        delete
                                    </a>
                                    <a href="${pageContext.request.contextPath}/product?action=info&id=${product.getId()}"
                                       title="Information" class="btn-me">
                                        information
                                    </a>
                                </td>

                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>

                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-end">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>