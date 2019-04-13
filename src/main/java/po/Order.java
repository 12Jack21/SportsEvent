package po;

import java.util.ArrayList;

public class Order {
    private String id;
    private String cusName;
    private String cusPhone;
    private ArrayList<OrderDetail> orderDetails;

    public Order() {
    }

    public Order(String id, String cusName, String cusPhone) {
        this.id = id;
        this.cusName = cusName;
        this.cusPhone = cusPhone;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }


    public ArrayList<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(ArrayList<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
}
