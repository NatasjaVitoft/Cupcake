package dat.backend.model.entities;

import java.sql.Timestamp;


public class Order {

    private int id;
    private String username;
    private Timestamp date;
    private int total_price;

    public Order(String username, int total_price) {
        this.username = username;
        this.total_price = total_price;
    }

    public Order() {
    }

    public Order(int id, String username, Timestamp date, int total_price) {
        this.username = username;
        this.total_price = total_price;
        this.date = date;
        this.id = id;
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
