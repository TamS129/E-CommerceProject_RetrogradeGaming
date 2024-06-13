package Application;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Locale;
import java.util.*;
import java.util.Scanner;

public class MenuTable {
    Scanner userInput = new Scanner(System.in);
    RetrogradeGamingAPI api = new RetrogradeGamingAPI();

    public void mainMenu() throws SQLException {
        api.connect();

        System.out.println("Welcome to Retrograde Gaming's Database System.");
        System.out.println("Please choose one of the following options: ");
        System.out.println("Inventory Management:\n[1] - List all Products. [2] - Create a new Product [3] - Delete Product [4] - View Inventory [5] - Modify Inventory\n");
        System.out.println("User Data:\n[6] - List all current Users [7] - Promotional Email  [8] - Upcoming Birthday List\n");
        System.out.println("Product Statistics:\n[9]- List of Popular Products [10] - List of Least Popular Products");
        System.out.println("[0] - Close Application");

        String input = userInput.nextLine().toLowerCase();

        switch(input){
            case "1":
                listProds();
                break;
            case "2":
                createProds();
                break;
            case "3":
                delProd();
                break;
            case "4":
                listInven();
                break;
            case "5":
                modInventory();
                break;
            case "6":
                listUser();
                break;
            case "7":
                userEmailPromo();
                break;
            case "8":
                userBirthdayPromo();
                break;
            case "9":
                popProducts();
                break;
            case "10":
                unPopProducts();
                break;
            case "0":
                end();
                break;
            default:
                System.out.println("This is not an available option. Please try again.");
                mainMenu();

        }



    }

    public void listProds() throws SQLException {
        System.out.println("Here are all the current products: ");

        api.listProducts();

        System.out.println("Press any key to continue to main menu.");
        String next = userInput.nextLine();
        mainMenu();

        }

    public void createProds() throws SQLException {
        System.out.println("Would you like to create a new product?");
        String next = userInput.nextLine();
        if(next.toLowerCase().equals("y") || next.toLowerCase().equals("yes") ){
            System.out.print("Product Condition: ");
            String conditions = userInput.nextLine();

            System.out.print("Description: ");
            String description = userInput.nextLine();

            System.out.print("Company: ");
            String company = userInput.nextLine();

            System.out.print("Year of Release: ");
            int yearOfRelease = userInput.nextInt();
            userInput.nextLine();

            api.createProduct(conditions,description,company,yearOfRelease);
            int currPID = api.getLastPID();

            createGameOrCons(currPID,conditions, description,company,yearOfRelease);



        } else {
            mainMenu();
        }


    }

    public void createGameOrCons(int id, String conditions, String description, String company, int yearOfRelease ) throws SQLException {

        System.out.println("Game or Console?");
        String type = userInput.nextLine();

        if (type.toLowerCase().equals("game")) {

            System.out.print("Title of Game: ");
            String title = userInput.nextLine();


            System.out.print("Genre of Game: ");
            String genre =userInput.nextLine();

            System.out.print("Platform for the Game: ");
            String platform = userInput.nextLine();

            api.createGame(id,title,genre,platform,conditions,description,company,yearOfRelease);
            System.out.println("Your game has been successfully added.");
            createProds();

        }
        else{
            System.out.print("Name of Console: ");
            String consoleName = userInput.nextLine();

            api.createConsole(id,consoleName,conditions,company,yearOfRelease);

            System.out.println("Your console has been successfully added.");

            createProds();

        }


    }
    
    public void delProd() throws SQLException {
        System.out.println("Would you like to delete a product from Inventory?");
        String next = userInput.nextLine();

        if(next.toLowerCase().equals( "y") ||next.toLowerCase().equals("yes") ){

            System.out.println("Please provide the productID for the product you wish to erase: ");
            int erase = userInput.nextInt();
            userInput.nextLine();

            api.deleteProduct(erase);
            System.out.println("Product has been erased from Database.");
            userInput.nextLine();
            mainMenu();


        }else{
            mainMenu();
        }


        
    }

    public void modInventory() throws SQLException {
    System.out.println("Please Provide the ProductID for the item you want to modify.");
    System.out.print("ProductID: ");
    int prodID = userInput.nextInt();

    System.out.print("New quantity on hand: ");
    int quantityOnHand = userInput.nextInt();

    System.out.print("New quantity on order: ");
    int quantityOnOrder = userInput.nextInt();
    api.modifyInventory(prodID,quantityOnHand,quantityOnOrder);

    System.out.println("Inventory Item has been modified.");
    userInput.nextLine();

    mainMenu();

    }

    public void listInven() throws SQLException {
        System.out.println("Here is the on hand inventory and store availability list: ");

        api.listInventory();

        System.out.println("Press any key to continue to main menu.");
        String next = userInput.nextLine();
        mainMenu();

    }

    public void listUser() throws SQLException {
        System.out.println("Here are all of our current clients: ");

        api.listUsers();

        System.out.println("Press any key to continue to main menu.");
        String next = userInput.nextLine();
        mainMenu();

    }

    public void userEmailPromo() throws SQLException {
        System.out.println("List of clients to send promotional emails to: ");

        api.promoEmail(3);

        System.out.println("Press any key to continue to main menu.");
        String next = userInput.nextLine();
        mainMenu();

    }

    public void userBirthdayPromo() throws SQLException {
        System.out.println("Clients who are eligible for a Birthday discount: ");

        api.promoBirthdayEmail();

        System.out.println("Press any key to continue to main menu.");
        String next = userInput.nextLine();
        mainMenu();
    }

    public void popProducts() throws SQLException {

        System.out.println("Enter start date (yyyy-mm-dd): ");
        Date startDate = Date.valueOf(userInput.nextLine());

        System.out.println("Enter end date (yyyy-mm-dd): ");
        Date endDate = Date.valueOf(userInput.nextLine());

        System.out.println("Here is a list of the most popular products for" + startDate + " to " + endDate + ":");
        api.mostPopList(startDate, endDate,true);

        System.out.println("Press any key to continue to main menu.");
        String next = userInput.nextLine();
        mainMenu();

    }

    public void unPopProducts() throws SQLException {
        System.out.println("Enter start date (yyyy-mm-dd): ");
        Date startDate = Date.valueOf(userInput.nextLine());

        System.out.println("Enter end date (yyyy-mm-dd): ");
        Date endDate = Date.valueOf(userInput.nextLine());

        System.out.println("Here is a list of the least popular products from " + startDate + " to " + endDate + ":");
        api.leastPopList(startDate, endDate,true);

        System.out.println("Press any key to continue to main menu.");
        String next = userInput.nextLine();
        mainMenu();
    }

    public void end() throws SQLException {
        System.out.println("Thank you for using the Retrograde Gaming Application.");
        api.endConnect();

    }

}
