package dat.backend.model.entities;



public class Cupcake {
    private int topId;
    private int bottomId;
    private int quantity;

    private Top top;
    private Bottom bottom;

    public Cupcake(int topId, int bottomId, int quantity) {
        this.topId = topId;
        this.bottomId = bottomId;
        this.quantity = quantity;
    }

    public int getTopId() {
        return topId;
    }

    public int getBottomId() {
        return bottomId;
    }

    public int getQuantity() {
        return quantity;
    }

    @Override
    public String toString() {
        return "Cupcake{" +
                "topId=" + topId +
                ", bottomId=" + bottomId +
                ", quantity=" + quantity +
                '}';
    }
}
