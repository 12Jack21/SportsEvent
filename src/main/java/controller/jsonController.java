package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.Coach;
import service.TeamService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/json")
public class jsonController {
    @Autowired
    private TeamService teamService;

    @ResponseBody
    @RequestMapping("/coach/list/{id}")
    public Object coachList(@PathVariable int id){
        Map<String,Object> map = new HashMap<>();
        List<Coach> list = teamService.getTeamCoaches(id);
        map.put("coaches",list);
        System.out.println(list);
        return map;
    }

    public Object addCoach(){

        return
    }

}
