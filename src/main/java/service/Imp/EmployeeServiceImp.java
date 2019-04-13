package service.Imp;

import dao.EmployeeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.Employee;
import service.EmployeeService;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service("employeeService")
public class EmployeeServiceImp implements EmployeeService {
    private EmployeeDAO employeeDAO;

//    @Resource(name = "employeeDAO")
    @Autowired
    public void setEmployeeDAO(EmployeeDAO employeeDAO) {
        this.employeeDAO = employeeDAO;
    }

    public ArrayList<Employee> getAllEmployee() {
        return employeeDAO.getAllEmployees();
    }

    public Employee getEmployee(int id) {
        return employeeDAO.getEmployee(id);
    }

    @Override
    public boolean insertEmployee(Employee employee) {
        return employeeDAO.insertEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
        return employeeDAO.deleteEmployee(id);
    }

    @Override
    public boolean updateEmployee(int id, String first, String last, int salary, int deptno) {
        return false;
    }
}
