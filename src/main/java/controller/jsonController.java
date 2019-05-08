package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import po.Coach;
import po.Team;
import service.TeamService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/json")
public class jsonController {
    @Autowired
    private TeamService teamService;

    @RequestMapping("/coach/{id}")
    public String coachList(@PathVariable int id,ModelMap map){ //TODO 从sessionAttribute中读取更好
        List<Coach> list = teamService.getTeamCoaches(id);
        map.put("coaches",list);
        return "coach";
    }

    @ResponseBody
    @RequestMapping("/coach/list/{id}")
    public Object coachList111(@PathVariable int id){
        List<Coach> list = teamService.getTeamCoaches(id);
        Map<String,Object> map = new HashMap<>();
        map.put("coaches",list);
        return list;
    }

    @ResponseBody
    @RequestMapping("/coach/add")
    public Object addCoach(Coach coach){
        boolean success = false;
        int teamid = 1;
        coach.setTeam(new Team(teamid,null));
        success = teamService.addCoach(coach);
        Map<String,Object> map = new HashMap<>();
        map.put("res",success);
        return map;
    }

    @RequestMapping("/list")
    public String mappp(ModelMap map){
        map.put("Wow1","what a jerk!!!");
        map.addAttribute("Wow111","shut up");
        return "inxx";
    }

    @ResponseBody
    @Transactional
    @RequestMapping("/coach/delete")
    public Object deleteCoach(@RequestParam(value = "data")String[] data){
        boolean success = true;
        for(int i = 0;i < data.length;i++){
            System.out.println(data[i]);
            if(success == false)
                break;
//            success = teamService.deleteCoach(data[i]);
        }
        return success;
    }

    @ResponseBody
    @RequestMapping("/coach/update")
    public Object updateCoach(@RequestParam(value = "data")String[] data){ //TODO 尝试用JSON parse
        boolean success = true;
        Coach coach = new Coach();

        return success;
    }
}
