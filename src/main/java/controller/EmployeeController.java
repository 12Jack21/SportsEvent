package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import po.Employee;
import service.EmployeeService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Map;

@Controller
public class EmployeeController {

    private EmployeeService employeeService;

    @Resource(name = "employeeService")
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @RequestMapping("/showEmployee")
    public ModelAndView showEmployee(){
        ModelAndView mv = new ModelAndView("showEmployee");
        ArrayList<Employee> employees = employeeService.getAllEmployee();
        mv.addObject("employees",employees);
        return mv;
    }
    @RequestMapping("/selectEmployee")
    public String getEmployee(@RequestParam(value = "id",defaultValue = "1") int id, Map<String,Object> map){
        Employee employee = employeeService.getEmployee(id);
        map.put("employee",employee);
        return "selectedEmployee";

    }
    @RequestMapping("/insertEmployee")
    public String insertEmployee(Employee e,ModelMap map){
        boolean isInsert = employeeService.insertEmployee(e);

        return "insertSuccess";
    }


}
