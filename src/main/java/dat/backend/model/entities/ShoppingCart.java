package dat.backend.model.entities;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {

    private List<Cupcake> cupcakeList = new ArrayList<>();
    private int totalPrice;

    public void add(Cupcake cupcake) {
        cupcakeList.add(cupcake);
    }

    public int getNumberOfCupcakes() {
        return cupcakeList.size();
    }

    public List<Cupcake> getCupcakeList() {
        return cupcakeList;
    }

    public int getTotalPriceOfCupcakes() {
        return totalPrice;
    }

    public void setTotalPriceOfCupcakes(int totalPrice) {
        this.totalPrice = totalPrice;
    }
}
