package DAO;

import model.Product;
import utils.MySQLConnUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO {
    @Override
    public  void insertProduct(Product product) throws SQLException {
        String INSERT_PRODUCT_SQL = "INSERT INTO product (productname, price, quantity, color, description, category) " +
                "VALUES (?, ?, ?, ?, ?, ?);";

        Connection connection = MySQLConnUtils.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_PRODUCT_SQL);

            ps.setString(1, product.getProductName());
            ps.setFloat(2, product.getPrice());
            ps.setInt(3, product.getQuantity());
            ps.setString(4, product.getColor());
            ps.setString(5, product.getDescription());
            ps.setInt(6, product.getCategory());

            int d= ps.executeUpdate();
            System.out.println(d);
        } catch (SQLException ex){
            printSQLException(ex);
        }
    }



    @Override
    public  Product selectProduct(int id) {
        String SELECT_PRODUCT_SQL_BY_ID = "SELECT productname, price, quantity, color, description, category " +
                "FROM product WHERE id = ?;";
        Product product = null;

        Connection connection = MySQLConnUtils.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_PRODUCT_SQL_BY_ID);
            ps.setInt(1, id);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int idDB = rs.getInt("id");
                String name_pro = rs.getString("productname");
                Float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                String description = rs.getString("description");
                int category = rs.getInt("category");

                product = new Product(idDB, name_pro, price, quantity, color, description, category);
            }
        } catch (SQLException ex){
            printSQLException(ex);
        }

        return product;
    }

    @Override
    public  List<Product> selectAllProducts() {
        String SELECT_ALL_PRODUCT_SQL = "SELECT id, productname, price, quantity, color, description, category FROM product ORDER BY id desc;";
        List<Product> products = new ArrayList<>();

        Connection connection = MySQLConnUtils.getConnection();
        System.out.println(connection);
        try {
            PreparedStatement ps =connection.prepareStatement(SELECT_ALL_PRODUCT_SQL);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int idDB = rs.getInt("id");
                String name_pro = rs.getString("productname");
                Float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                String description = rs.getString("description");
                int category = rs.getInt("category");

                products.add(new Product(idDB, name_pro, price, quantity, color, description, category));
            }
        } catch (SQLException ex){
            printSQLException(ex);
        }

        return products;    }

    @Override
    public  boolean deleteProduct(int id) throws SQLException {
        boolean check = false;
        String DELETE_PRODUCT_SQL = "DELETE FROM product WHERE id = ?";
        Connection connection = MySQLConnUtils.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_PRODUCT_SQL);
            ps.setInt(1, id);
            check = ps.executeUpdate() > 0;
        }catch (SQLException ex){
            printSQLException(ex);
        }
        return check;    }

    @Override
    public  boolean updateProduct(Product product) throws SQLException {
        boolean update = false;
        String UPDATE_STUDENT_SQL = "UPDATE product SET productname = ?, price = ?, quantity = ?, color = ?, " +
                "description = ?, category = ? WHERE id = ?";
        Connection connection = MySQLConnUtils.getConnection();

        try {
            connection.setAutoCommit(false);
            PreparedStatement ps = connection.prepareStatement(UPDATE_STUDENT_SQL);

            ps.setString(1, product.getProductName());
            ps.setFloat(2, product.getPrice());
            ps.setInt(3, product.getQuantity());
            ps.setString(4, product.getColor());
            ps.setString(5, product.getDescription());
            ps.setInt(6, product.getCategory());
            ps.executeUpdate();

            connection.commit();
            connection.setAutoCommit(true);
            update = true;
        } catch (SQLException ex){
            connection.rollback();
            printSQLException(ex);
        }

        return update;    }

    @Override
    public  List<Product> searchProduct(String searchName) throws SQLException {
        String SEARCH_STUDENT_SQL = "SELECT id, productname, price, quantity, color, description, category FROM product WHERE productname LIKE ?;";
        List<Product> products = new ArrayList<>();
        Connection connection = MySQLConnUtils.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_STUDENT_SQL);
            ps.setString(1,"%" + searchName + "%");
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int idDB = rs.getInt("id");
                String name_pro = rs.getString("productname");
                Float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                String description = rs.getString("description");
                int category = rs.getInt("category");

                products.add(new Product(idDB, name_pro, price, quantity, color, description, category));
            }

        } catch (SQLException ex){
            printSQLException(ex);
        }
        return products;
    }

    private static void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
