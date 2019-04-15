import dao.OrderDAO;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Order;

import java.util.ArrayList;

public class OrderTest extends BaseTest{
    @Autowired
    private OrderDAO orderDAO;

    @Test
    public void testGetAll(){
        ArrayList<Order> orders = orderDAO.getAllOrders();
        Order o = orders.get(1);

        Assert.assertEquals("Sam",o.getCusName());
        Assert.assertEquals(4,o.getOrderDetails().toArray().length);
    }

    @Test
    public void testGetConditionalOrder(){
        ArrayList<Order> orders = orderDAO.getConditionalOrders(null,null,"%89%");

        Assert.assertEquals("Sam",orders.get(0).getCusName());

    }

    @Test
    public void testInsert(){
        Order order = new Order("2019-03-04","WIca","1189230811");
        boolean result = orderDAO.insertOrder(order);

        Assert.assertTrue(result);

    }

    @Test
    public void testDelete(){
        String id = "2018-12-6-003";
        boolean result = orderDAO.deleteOrder(id);
        Assert.assertTrue(result);
    }

    @Test
    public void testUpdate(){
        Order r = new Order("2018-12-6-003","Curry","233333");
        boolean result = orderDAO.updateOrder(r);
        Assert.assertTrue(result);
    }
}
