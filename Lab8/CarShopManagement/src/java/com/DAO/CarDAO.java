/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.Model.Car;

public class CarDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3307/carshop"; // Sila semak port anda
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_CAR_SQL = "INSERT INTO cars (model, brand, price) VALUES (?, ?, ?);";
    private static final String SELECT_CAR_BY_ID = "SELECT id, model, brand, price FROM cars WHERE id = ?;";
    private static final String SELECT_ALL_CARS = "SELECT * FROM cars;";
    private static final String DELETE_CAR_SQL = "DELETE FROM cars WHERE id = ?;";
    private static final String UPDATE_CAR_SQL = "UPDATE cars SET model = ?, brand = ?, price = ? WHERE id = ?;";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Guna Driver baru cj
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertCar(Car car) throws SQLException {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(INSERT_CAR_SQL)) {
            ps.setString(1, car.getModel());
            ps.setString(2, car.getBrand());
            ps.setDouble(3, car.getPrice());
            ps.executeUpdate();
        }
    }

    public Car selectCar(int id) {
        Car car = null;
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(SELECT_CAR_BY_ID)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String model = rs.getString("model");
                String brand = rs.getString("brand");
                double price = rs.getDouble("price");
                car = new Car(id, model, brand, price);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return car;
    }

    public List<Car> selectAllCars() {
        List<Car> cars = new ArrayList<>();
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(SELECT_ALL_CARS)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String model = rs.getString("model");
                String brand = rs.getString("brand");
                double price = rs.getDouble("price");
                cars.add(new Car(id, model, brand, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    public boolean deleteCar(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(DELETE_CAR_SQL)) {
            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCar(Car car) throws SQLException {
        boolean rowUpdated;
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(UPDATE_CAR_SQL)) {
            ps.setString(1, car.getModel());
            ps.setString(2, car.getBrand());
            ps.setDouble(3, car.getPrice());
            ps.setInt(4, car.getId());
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
