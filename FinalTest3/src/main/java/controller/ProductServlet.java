package controller;
import DAO.ProductDAO;
import model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="controller.TestServlet",urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding(StandardCharsets.UTF_8.toString());
        response.setCharacterEncoding(StandardCharsets.UTF_8.toString());
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("acc");
        String password = (String) session.getAttribute("pass");

//        Account account = accountDAO.selectAccount(username, password);
//        if (account == null) {
//            response.sendRedirect("/admin");
//        } else {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            try {
                switch (action) {
                    case "create":
                        showCreateProduct(request, response);
                        break;
                    case "edit":
                        showEditProduct(request, response);
                        break;
                    case "delete":
                        deleteProduct(request, response);
                        break;
                    case "info":
                        showInfoProduct(request, response);
                        break;
                    default:
                        listProduct(request, response);
                        break;
                }
            } catch (SQLException ex) {
                throw new ServletException(ex);
            }
        }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding(StandardCharsets.UTF_8.toString());
        response.setCharacterEncoding(StandardCharsets.UTF_8.toString());
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createProduct(request, response);
                    break;
                case "edit":
                    updateProduct(request, response);
                    break;
                case "search":
                    searchProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                default:
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }


    private void listProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Product> productList = productDAO.selectAllProducts();
        System.out.println(productList.size());
        String check= request.getParameter("check");
        if (check!= null)
            request.setAttribute("check",check);
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/product.jsp");
        dispatcher.forward(request, response);
    }
    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);
    }
    private void createProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String namePro = request.getParameter("productname");
        Float price = Float.valueOf(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int category = Integer.parseInt(request.getParameter("category"));

//        if (nameStu.equals("") || gender.equals("") || dob.equals("") || mail.equals("") || address.equals("") || phoneNum.equals("")) {
//            request.setAttribute("message", "Bad or missing input information!");
//            showCreateProduct(request,response);
//        } else if (!checkInput.validateName(nameStu)) {
//            request.setAttribute("message", "Invalid name value");
//            showCreateProduct(request, response);
//        } else if (checkInput.validateDob(dob)) {
//            request.setAttribute("success", null);
//            request.setAttribute("error", null);
//            request.setAttribute("warning", "Invalid date of birth value");
//            showCreateProduct(request, response);
//        } else if (!checkInput.validateMail(mail)) {
//            request.setAttribute("message", "Invalid email value!");
//            showCreateProduct(request, response);
//        } else if (!checkInput.validatePhone(phoneNum)) {
//            request.setAttribute("message", "Invalid phone number value");
//            showCreateProduct(request, response);
//        } else {
            Product newproduct = new Product(namePro, price, quantity, color, description,category);
            productDAO.insertProduct(newproduct);
            showCreateProduct(request, response);
        }

    private void showEditProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product existProduct = productDAO.selectProduct(id);

        if (existProduct == null) {
            response.sendRedirect("/error-404.jsp");
        } else {
            request.setAttribute("product", existProduct);
            RequestDispatcher dispatcher = request.getRequestDispatcher("product/edit.jsp");
            dispatcher.forward(request, response);
        }
    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        String id = request.getParameter("id");
        String namePro = request.getParameter("productname");
        Float price = Float.valueOf(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int category = Integer.parseInt(request.getParameter("category"));
        boolean check = false;

//        if (nameStu.equals("") || gender.equals("") || dob.equals("") || mail.equals("") || address.equals("") || phoneNum.equals("")) {
//            request.setAttribute("message", "Bad or missing input information!");
//            showEditProduct(request, response);
//        } else if (!checkInput.validateName(nameStu)) {
//            request.setAttribute("message", "Invalid name value");
//            showEditProduct(request, response);
//        } else if (checkInput.validateDob(dob)) {
//            request.setAttribute("success", null);
//            request.setAttribute("error", null);
//            request.setAttribute("warning", "Invalid date of birth value");
//            showEditProduct(request, response);
//        } else if (!checkInput.validateMail(mail)) {
//            request.setAttribute("message", "Invalid email value!");
//            showCreateProduct(request, response);
//        } else if (!checkInput.validatePhone(phoneNum)) {
//            request.setAttribute("message", "Invalid phone number value");
//            showEditProduct(request, response);
//        } else {
            Product newProduct = new Product(Integer.parseInt(id),namePro, price, quantity, color, description,category);
            check= productDAO.updateProduct(newProduct);
            response.sendRedirect(request.getContextPath()+"/product?check="+check);
        }



    private void showInfoProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product existProduct = productDAO.selectProduct(id);

        if (existProduct == null) {
            response.sendRedirect("/error-404.jsp");
        } else {
            request.setAttribute("student", existProduct);
            RequestDispatcher dispatcher = request.getRequestDispatcher("student/information.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        String str = request.getParameter("string-search");
        List<Product> productList = productDAO.searchProduct(str);
        System.out.println(productList);
        if (productList == null) {
            request.setAttribute("success", null);
            request.setAttribute("error", "This student is not on the list");
            request.setAttribute("warning", null);

            request.setAttribute("productList", productList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("product/product.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("productList", productList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("product/product.jsp");
            dispatcher.forward(request, response);

        }
    }


    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        if (productDAO.selectProduct(id) == null) {
            listProduct(request, response);
        } else {
            boolean check= productDAO.deleteProduct(id);
            listProduct(request, response);
        }
    }
}
