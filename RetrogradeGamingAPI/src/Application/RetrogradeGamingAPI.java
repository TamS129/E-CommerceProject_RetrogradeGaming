package Application;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.*;
import java.sql.Date;
import java.util.*;

public class RetrogradeGamingAPI {
    private String url = "jdbc:mysql://localhost:3306/retrogradegaming";
    private String username = "root";
    private String password = "Terra@panda129";

    private Connection connectController;

    public Connection connect() throws SQLException {
        connectController = DriverManager.getConnection(url, username, password);
        return connectController;
    }

    public void listProducts() throws SQLException {
        String query = "SELECT * FROM Product";
        Statement stmt = connectController.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
            int productID = rs.getInt("ProductID");
            String conditions = rs.getString("Conditions");
            String description  = rs.getString("Description");
            String company = rs.getString("Company");
            int year = rs.getInt("YearOfRelease");

            System.out.println("ProductID ID: " + productID );
            System.out.println("Condition of Product: " + conditions);
            System.out.println("Description of Product: " + description);
            System.out.println("Company:  " + company);
            System.out.println("ReleaseDate:  " + year);
            System.out.println("--------------------------");
        }
    }

    public void createProduct(String conditions, String description, String company, int yearOfRelease) throws SQLException {
        String query = "CALL CreateProduct(?, ?, ?, ?) ";
        CallableStatement cstmt = connectController.prepareCall(query);

        cstmt.setString(1, conditions);
        cstmt.setString(2, description);
        cstmt.setString(3, company);
        cstmt.setInt(4, yearOfRelease);

        cstmt.execute();

    }

    public int getLastPID() throws SQLException {
        String query = "SELECT LAST_INSERT_ID()";
        Statement stmt = connectController.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        if (rs.next()) {
            return rs.getInt(1);
        }
        return 0;
    }

    public void createConsole(int productID, String consoleName, String conditions, String company, int yearOfRel ) throws SQLException {
        String query = "CALL CreateConsole(?, ?, ?, ?, ?)";
        CallableStatement cstmt = connectController.prepareCall(query);

        cstmt.setInt(1, productID);
        cstmt.setString(2, consoleName);
        cstmt.setString(3, conditions);
        cstmt.setString(4, company);
        cstmt.setInt(5, yearOfRel);

        cstmt.execute();

    }

    public void createGame(int productID, String title, String genre, String platform, String conditions, String description, String company, int yearOfrel ) throws SQLException {
        String query = "CALL CreateGame(?, ?, ?, ?, ?, ?, ?, ?)";
        CallableStatement cstmt = connectController.prepareCall(query);

        cstmt.setInt(1, productID);
        cstmt.setString(2, title);
        cstmt.setString(3,genre);
        cstmt.setString(4,genre);
        cstmt.setString(5, conditions);
        cstmt.setString(6, description);
        cstmt.setString(7, company);
        cstmt.setInt(8, yearOfrel);

        cstmt.execute();

    }

    public void modifyInventory(int productId, int quantityOnHand, int quantityOnOrder) throws SQLException {
        String query = "UPDATE Inventory SET QuantityOnHand = ?, QuantityOnOrder = ? WHERE ProductID = ?";
        PreparedStatement pstmt = connectController.prepareStatement(query);

        pstmt.setInt(1, quantityOnHand);
        pstmt.setInt(2, quantityOnOrder);
        pstmt.setInt(3, productId);
        pstmt.executeUpdate();
    }

    public void listInventory() throws SQLException {
        String query = "SELECT * FROM Inventory";
        Statement stmt = connectController.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
            int inventoryID = rs.getInt("InventoryID");
            String storeAvailable = rs.getString("StoreAvailable");
            int quantityOnHand = rs.getInt("QuantityOnHand");
            int quantityOnOrder = rs.getInt("QuantityOnOrder");

            System.out.println("Inventory ID: " + inventoryID);
            System.out.println("Store Available: " + storeAvailable);
            System.out.println("Quantity On Hand: " + quantityOnHand);
            System.out.println("Quantity On Order: " + quantityOnOrder);
            System.out.println("--------------------------");
        }
    }

    public void deleteProduct(int productId) throws SQLException{
        String query = "DELETE FROM Product WHERE PRODUCTID = ?";
        PreparedStatement pstmt = connectController.prepareStatement(query);

        pstmt.setInt(1,productId);
        pstmt.executeUpdate();

    }

    public void mostPopList(Date startDate, Date endDate, boolean mostPopular) throws SQLException {
        String order = mostPopular ? "DESC" : "ASC";
        String query = "SELECT p.*, COUNT(o.ProductID) AS popularity " +
                "FROM Product p " +
                "JOIN Orders o ON p.ProductID = o.ProductID " +
                "WHERE o.DateOfPurchase BETWEEN ? AND ? " +
                "GROUP BY p.ProductID " +
                "ORDER BY popularity " + order;

        PreparedStatement pstmt = connectController.prepareStatement(query);
        pstmt.setDate(1, startDate);
        pstmt.setDate(2, endDate);
        ResultSet set = pstmt.executeQuery();

        System.out.println("Most Popular Items:");
        while (set.next()) {
            int productID = set.getInt("ProductID");
            String conditions = set.getString("Conditions");
            String description = set.getString("Description");
            String company = set.getString("Company");
            int year = set.getInt("YearOfRelease");

            System.out.println("ProductID ID: " + productID);
            System.out.println("Condition of Product: " + conditions);
            System.out.println("Description of Product: " + description);
            System.out.println("Company:  " + company);
            System.out.println("ReleaseDate:  " + year);
            System.out.println("--------------------------");
        }
    }

    public void leastPopList(Date startDate, Date endDate, boolean leastPopular) throws SQLException {
        String order = leastPopular ? "DESC" : "ASC";
        String query = "SELECT p.*, COUNT(o.ProductID) AS popularity " +
                "FROM Product p " +
                "JOIN Orders o ON p.ProductID = o.ProductID " +
                "WHERE o.DateOfPurchase BETWEEN ? AND ? " +
                "GROUP BY p.ProductID " +
                "ORDER BY popularity " + order;

        PreparedStatement pstmt = connectController.prepareStatement(query);
        pstmt.setDate(1, startDate);
        pstmt.setDate(2, endDate);
        ResultSet set = pstmt.executeQuery();

        System.out.println("Least Popular Items:");
        while (set.next()) {
            int productID = set.getInt("ProductID");
            String conditions = set.getString("Conditions");
            String description = set.getString("Description");
            String company = set.getString("Company");
            int year = set.getInt("YearOfRelease");

            System.out.println("ProductID ID: " + productID);
            System.out.println("Condition of Product: " + conditions);
            System.out.println("Description of Product: " + description);
            System.out.println("Company:  " + company);
            System.out.println("ReleaseDate:  " + year);
            System.out.println("--------------------------");
        }
    }


    public void listUsers() throws SQLException {
        String query = "SELECT * FROM User";
        Statement stmt = connectController.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
            int userID = rs.getInt("UserID");
            String fullName = rs.getString("FullName");
            Date birthday = rs.getDate("Birthday");
            String email = rs.getString("Email");
            String password = rs.getString("Password");
            BigInteger phoneNumber = new BigInteger(rs.getString("PhoneNumber"));

            System.out.println("UserID: " + userID);
            System.out.println("Full Name: " + fullName);
            System.out.println("Birthday: " + birthday);
            System.out.println("Email: " + email);
            System.out.println("Password: " + password);
            System.out.println("Phone Number: " + phoneNumber);
            System.out.println("--------------------------");
        }
    }

    public void promoEmail(int months) throws SQLException {
        String query = "SELECT DISTINCT u.UserID, u.FullName, u.Email, p.ProductID, " +
                "CASE " +
                "    WHEN g.Title IS NOT NULL THEN g.Title " +
                "    WHEN c.ConsoleName IS NOT NULL THEN c.ConsoleName " +
                "END AS ItemName " +
                "FROM User u " +
                "LEFT JOIN Orders o ON u.UserID = o.UserID " +
                "LEFT JOIN Product p ON o.ProductID = p.ProductID " +
                "LEFT JOIN Game g ON p.ProductID = g.ProductID " +
                "LEFT JOIN Console c ON p.ProductID = c.ProductID " +
                "WHERE (o.DateOfPurchase IS NULL OR o.DateOfPurchase < DATE_SUB(NOW(), INTERVAL ? MONTH)) " +
                "AND p.ProductID IN (" +
                "    SELECT o.ProductID " +
                "    FROM Orders o " +
                "    WHERE o.UserID = u.UserID " +
                "    GROUP BY o.ProductID " +
                "    HAVING COUNT(o.ProductID) > 1" +
                ")";

        PreparedStatement pstmt = connectController.prepareStatement(query);
        pstmt.setInt(1, months);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            int userID = rs.getInt("UserID");
            String fullName = rs.getString("FullName");
            String email = rs.getString("Email");
            int productID = rs.getInt("ProductID");
            String itemName = rs.getString("ItemName");

            System.out.println("UserID: " + userID);
            System.out.println("Full Name: " + fullName);
            System.out.println("Email: " + email);
            System.out.println("ProductID: " + productID);
            System.out.println("Most Frequently Bought Item: " + itemName);
            System.out.println("--------------------------");
        }
    }

    public void promoBirthdayEmail() throws SQLException {
        String query = "SELECT UserID, FullName, Email " +
                "FROM User " +
                "WHERE MONTH(Birthday) = MONTH(DATE_ADD(NOW(), INTERVAL 1 MONTH)) " +
                "AND DAYOFMONTH(Birthday) BETWEEN DAYOFMONTH(NOW()) AND DAYOFMONTH(DATE_ADD(NOW(), INTERVAL 1 MONTH))";

        Statement stmt = connectController.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        if (!rs.next()) {
            System.out.println("No users found with birthdays in the next month.");
        } else {
            System.out.println("Users found with birthdays in the next month:");
            do {
                int userID = rs.getInt("UserID");
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");

                System.out.println("UserID: " + userID);
                System.out.println("Full Name: " + fullName);
                System.out.println("Email: " + email);
                System.out.println("--------------------------");
            } while (rs.next());
        }

        // Close resources
        rs.close();
        stmt.close();
    }



    public Connection endConnect() throws SQLException{

        while(connectController != null && !connectController.isClosed()){
            connectController.close();
        }
        System.out.println("Connection Ended.");
        return connectController;
    }

}
