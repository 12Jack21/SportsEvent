package UtilTest;

import MyUtil.MyConstrict;
import baseTest.BaseTest;
import org.junit.Test;
import static org.junit.Assert.*;

public class ConstrictTest extends BaseTest {

    @Test
    public void IDstandardtest(){
        String ID = "121245362718999991";
        assertTrue(MyConstrict.isIDLegal(ID));
    }

    @Test
    public void PhoneLegaltest(){
        String phone = "13723778729";
        assertTrue(MyConstrict.isPhoneLegal(phone));
    }
}
