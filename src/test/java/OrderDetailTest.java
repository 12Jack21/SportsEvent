import dao.OrderDetailDAO;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.OrderDetail;

import java.util.ArrayList;

public class OrderDetailTest extends BaseTest{
    @Autowired
    private OrderDetailDAO orderDetailDAO;

    @Test
    public void testGetAll(){
        ArrayList<OrderDetail> orderDetails = orderDetailDAO.getAllDetails();
        Assert.assertEquals(7,orderDetails.toArray().length);

    }

    @Test
    public void testInsert(){
        OrderDetail orderDetail = new OrderDetail("Wine",23.4,33,"2018-12-6-004");
        Assert.assertTrue(orderDetailDAO.insertDetail(orderDetail));
    }

    @Test
    public void testDelete(){
        Assert.assertTrue(orderDetailDAO.deleteDetail(3));
    }
    @Test
    public void testUpdate(){
        Assert.assertTrue(orderDetailDAO.updateDetail(null,-1.0,
                44410,null,7));
    }
    @Test
    public void testConditiona(){
        ArrayList<OrderDetail> orderDetails = orderDetailDAO.getConditionalDetail(null,1000.0);
        Assert.assertEquals(5,orderDetails.toArray().length);

    }
}
