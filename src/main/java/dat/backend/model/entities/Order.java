package dat.backend.model.entities;

import java.sql.Timestamp;

public class Order {

    private int id;
    private String username;
    private Timestamp date;
    private int total_price;
    private boolean checker;

    public Order(int id, String username, Timestamp date, int total_price) {
        this.id = id;
        this.username = username;
        this.date = date;
        this.total_price = total_price;
    }

    public Order(int id, String username) {
        this.id = id;
        this.username = username;
    }

    public Order(String username, int total_price) {
        this.username = username;
        this.total_price = total_price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    public boolean isChecker() {
        return checker;
    }

    public void setChecker(boolean checker) {
        this.checker = checker;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", date=" + date +
                ", total_price=" + total_price +
                '}';
    }
}
