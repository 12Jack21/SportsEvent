package controller;

import MyUtil.MyConvertor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import po.Coach;
import po.Competition;
import po.Team;
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

        return "adminGroup";//TODO not done
    }

    @RequestMapping("/team")
    public String team(){
        return "adminTeam";
    }

    @ResponseBody
    @RequestMapping("/team/list")
    public Object teamList(){
        List<Team> teams = adminService.getAllTeams();
        return teams;
    }

    @ResponseBody
    @RequestMapping("/team/add")
    public Object addTeam(Team team) {
        boolean success = false;
        success = adminService.addTeamAccount(team);
        return success;
    }

    @ResponseBody
    @Transactional
    @RequestMapping("/team/delete")
    public Object deleteTeam(@RequestParam(value = "data") int[] data) {
        boolean success = true;
        for (int i = 0; i < data.length; i++) {
            success = adminService.deleteTeamAccount(data[i]);
            if (success == false)
                break;
        }
        return success;
    }

    @ResponseBody
    @RequestMapping("/team/update")
    public Object updateTeam(Team team) {
        boolean success = false;
        success = adminService.updateTeamAccount(team);
        return success;
    }

}
