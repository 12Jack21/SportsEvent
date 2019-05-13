package controller;

import MyUtil.MyConvertor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import po.Competition;
import service.AdminService;
import service.TeamService;
import vo.CompetitionVO;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private TeamService teamService;

    @RequestMapping("/competition")
    public String adminCompetition(){
        return "adminCompetition";
    }

    @ResponseBody
    @RequestMapping("/competition/list")
    public Object adminCompList(){
        List<Competition> competitions = adminService.getAllCompetitions();
        List<CompetitionVO> cVO = new ArrayList<>();

        for (Competition c : competitions) {
            cVO.add(MyConvertor.convertComp(c));
        }
        return cVO;
    }

    @ResponseBody
    @RequestMapping("/competition/add")
    public Object adminCompetitionAdd(Competition competition){
        boolean s = false;
        s = adminService.addCompetition(competition);
        return s;
    }

    @ResponseBody
    @RequestMapping("/competition/delete")
    public Object competitionDelete(@RequestParam("data")int[] compIds){
        boolean success = false;
        for (int i = 0; i < compIds.length; i++) {
            success = adminService.deleteCompetition(compIds[i]);
            if (success == false)
                break;
        }
        return success;
    }

    @RequestMapping("/group/{compid}")
    public String adminGroup(@PathVariable int compid, ModelMap map){

        return "adminGroup";
    }
}
