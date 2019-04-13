package dao;

import org.springframework.stereotype.Repository;
import po.Employee;

import java.util.ArrayList;

//@Repository("employeeDAO")
@Repository
public interface EmployeeDAO {

    ArrayList<Employee> getAllEmployees();

    Employee getEmployee(int id);

    ArrayList<Employee> getEmployeeByCondition(String first,String last,int salary,int deptno);

    boolean insertEmployee(Employee employee);

    boolean deleteEmployee(int id);

    boolean updateEmployee(int id,String first,String last,int salary,int deptno);
}
