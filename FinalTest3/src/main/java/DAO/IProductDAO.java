package DAO;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductDAO {
    public void insertProduct(Product product) throws SQLException;



    public Product selectProduct(String id);

    public List<Product> selectAllProducts();



    public boolean deleteProduct(String id) throws SQLException;

    public boolean updateProduct(Product product) throws SQLException;

    public List<Product> searchProduct(String searchName) throws SQLException;
}
