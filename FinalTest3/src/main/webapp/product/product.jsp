<%--
  Created by IntelliJ IDEA.
  User: macbookprom1
  Date: 10/01/2022
  Time: 09:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                            <th scope="col" >ID</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Color</th>
                            <th scope="col">Category</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${requestScope['list']}">

                            <tr class="text-center" >
                                <td scope="row">${product.id}</td>
                                <td>${product.getProductName()}</td>

<%--                                <c:if test="${product.getGender() == 1}">--%>
<%--                                    <td>Nam</td>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${instructor.getGender() == 0}">--%>
<%--                                    <td>Nữ</td>--%>
<%--                                </c:if>--%>


                                <td>${instructor.getPrice()}</td>
                                <td>${instructor.getQuantity()}</td>
                                <td>${instructor.getColor()}</td>
                                <td>${instructor.getDescription()}</td>
                                <c:if test="${student.getCategory() == 1}">
                                    <td>
                                        <span class="badge badge-primary">Phone</span>
                                    </td>
                                </c:if>
                                <c:if test="${student.getCategory() == 0}">
                                    <td>
                                        <span class="badge badge-danger">Television</span>
                                    </td>
                                </c:if>

                                <td>
                                    <a href="${pageContext.request.contextPath}/product?action=edit&id=${product.getId()}"
                                       title="Edit" class="btn-me" id="btn-edit">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/product?action=delete&id=${product.getId()}" title="Delete"
                                       class="btn-me delete" id="btn-trash">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/product?action=info&id=${product.getId()}"
                                       title="Information" class="btn-me">
                                        <i class="fas fa-info-circle"></i>
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
