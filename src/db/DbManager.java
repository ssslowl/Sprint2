package db;

import models.Item;
import models.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DbManager {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "qwerty");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public static User getUser(String username){
        User user = null;

        try{
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE username = ?" );

            statement.setString(1, username);

            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()){
                user = new User();
                user.setId(resultSet.getLong("id"));
                user.setUsername(resultSet.getString("username"));
                user.setFullName(resultSet.getString("full_name"));
                user.setPassword(resultSet.getString("password"));
            }
            statement.close();


        }catch (Exception e){
            e.printStackTrace();
        }

        return user;
    }


    public static List<Item> getItems() {
        List<Item> items = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM items");

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Item item = new Item();
                item.setId(resultSet.getInt("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                item.setImg(resultSet.getString("img"));

                items.add(item);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }
}
