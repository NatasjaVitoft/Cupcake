package dat.backend.model.entities;

public class Orderline {

    private int id;
    private int topid;
    private int bottomid;
    private int price;

    public Orderline(int topid, int bottomid, int price) {
        this.topid = topid;
        this.bottomid = bottomid;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTopid() {
        return topid;
    }

    public void setTopid(int topid) {
        this.topid = topid;
    }

    public int getBottomid() {
        return bottomid;
    }

    public void setBottomid(int bottomid) {
        this.bottomid = bottomid;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Orderline{" +
                "id=" + id +
                ", topid=" + topid +
                ", bottomid=" + bottomid +
                ", price=" + price +
                '}';
    }
}
