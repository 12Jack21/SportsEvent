import dao.EmployeeDAO;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import po.Dept;
import po.Employee;

import java.util.ArrayList;

public class EmployeeTest extends BaseTest {
    @Autowired
    private EmployeeDAO employeeDAO;


    //    @Test
//    public void testInsert() {
//
//        EmployeeDAO e = sqlSession.getMapper(EmployeeDAO.class);
//        Employee employee = new Employee(0,"Xiao","Mi",442);
//        employee.setDept(new Dept(20,null,null));
//        e.insertEmployee(employee);
//
//        Assert.assertEquals(13,employee.getId());
//    }
    @Test
    @Rollback(false)
    public void testInsert() {
        Employee employee = new Employee(0, "Xiao", "Mi", 442);
        employee.setDept(new Dept(20, null, null));
        employeeDAO.insertEmployee(employee);
        Assert.assertEquals(15, employee.getId());
    }

    @Test
    public void testSelect() {

    }

    @Test
    public void testShowAll() {
        EmployeeDAO e = sqlSession.getMapper(EmployeeDAO.class);
        ArrayList<Employee> employees = e.getAllEmployees();

        Assert.assertEquals(7, employees.toArray().length);
    }

    @Test
    @Rollback(false)
    public void testDelete() {

        Assert.assertEquals(true,employeeDAO.deleteEmployee(14));
    }

    @Test
    @Rollback(false)
    public void testUpdate(){
        boolean isUpdate = employeeDAO.updateEmployee(20,null,"Guang",-1,-1);
        Assert.assertTrue(isUpdate);
    }

    @Test
    public void testGetConditionalEmployee(){
        ArrayList<Employee> employees = employeeDAO.getEmployeeByCondition("Mi",null,-1,20);

        Assert.assertEquals(1111,employees.get(0).getSalary());

    }
}
