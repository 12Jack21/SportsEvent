package dao;

import org.springframework.stereotype.Repository;
import po.Order;
import po.OrderDetail;

import javax.xml.soap.Detail;
import java.util.ArrayList;

@Repository
public interface OrderDAO {

    ArrayList<Order> getAllOrders();

    ArrayList<Order> getConditionalOrders(String id, String cusName, String cusPhone);

    boolean insertOrder(Order order);

    boolean deleteOrder(String id);

//    boolean updateOrder(String id,String cusName,String cusPhone);
    boolean updateOrder(Order order);


}
