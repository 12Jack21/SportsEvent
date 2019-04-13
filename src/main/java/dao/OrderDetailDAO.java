package dao;

import org.springframework.stereotype.Repository;
import po.OrderDetail;

import java.util.ArrayList;

@Repository
public interface OrderDetailDAO {

    ArrayList<OrderDetail> getAllDetails();

    ArrayList<OrderDetail> getConditionalDetail(String name,Double unitPrice);

    boolean insertDetail(OrderDetail detail);

    boolean deleteDetail(int id);

    boolean updateDetail(String name,Double unitPrice,int quantity,String orderId,int id);

}
