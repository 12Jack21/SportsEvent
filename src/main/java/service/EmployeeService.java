package service;

import java.util.ArrayList;

public interface EmployeeService {

    ArrayList<Employee> getAllEmployee();

    Employee getEmployee(int id);

    boolean insertEmployee(Employee employee);

    boolean deleteEmployee(int id);

    boolean updateEmployee(int id,String first,String last,int salary,int deptno);


}
