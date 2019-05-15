package controller;

import MyUtil.MyConvertor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import po.Athlete;
import po.Judge;
import po.TempScore;
import service.RefereeService;
import service.TeamService;
import vo.AthTempListNormal;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/referee")
@SessionAttributes(value = {"refId"}, types = {int.class})
public class RefereeController {//TODO 运动员报名完毕后 设置编号
    @Autowired
    private RefereeService refereeService;
    @Autowired
    private TeamService teamService;

    @RequestMapping("/setSession")
    public void setSession(ModelMap map){
        map.put("refId",1);
    }

    @RequestMapping("/competitionList")
    public String refCompetitionList(@ModelAttribute("refId")int refid, ModelMap map){
        List<Judge> majors = refereeService.getJudges(refid,1);
        List<Judge> normals = refereeService.getJudges(refid,0);

        map.put("majors",majors);
        map.put("normals",normals);

        return "refCompetition";
    }



    @RequestMapping("/normal/{compid}")
    public String normal(@PathVariable int compid,@ModelAttribute("refId")int refid,ModelMap map){
        Judge judge = refereeService.getJudgeByRefComp(compid, refid);
        judge.setCompetitionVO(MyConvertor.convertComp(judge.getCompetition()));
        map.put("jud",judge);
        return "normalRef";
    }

    @ResponseBody
    @RequestMapping("/tempScore/list") //得到一个裁判下每个运动员的最新给分
    public Object normalScoreList(@RequestParam("jud_id")int jud_id){
        Judge j = refereeService.getJudge(jud_id);
        List<Integer> athIds = teamService.getAthByCompGroup(j.getCompetition().getId(),j.getGroupno());

        List<AthTempListNormal> listNormals = new ArrayList<>();
        AthTempListNormal normal = null;
        TempScore t = null;
        for(Integer i:athIds){
            t = refereeService.getAthScoreListNormal(jud_id,i);
            if(t != null){
                normal = new AthTempListNormal();
                normal.setAthlete(t.getAthlete());
                normal.setScore(t.getScore());
                normal.setIsValid(t.getIsValid());

            }else {
                Athlete a = teamService.getAthlete(i);
                normal.setAthlete(a);
            }
            listNormals.add(normal);
        }

        return listNormals;
    }

    @ResponseBody
    @RequestMapping("/tempScore/add") //添加裁判给运动员的给分
    public Object normalAddScore(@RequestParam("ath_id")int athid,@RequestParam("jud_id")int jud_id,@RequestParam("score")Double score){
        if(score == null)
            return false;
        return refereeService.addScore(new Judge(jud_id),athid,score);
    }

    @ResponseBody
    @RequestMapping("tempScore/log") //一个裁判对于一个运动员的所有打分记录（一般都是 isValid = false）
    public Object normalScoreLog(@RequestParam("jud_id")int jud_id,@RequestParam("athId")int athid){
        List<TempScore> logs = refereeService.getSingleAthTemp(jud_id, athid);
        return logs;
    }


    /* 以下为主裁判的相关 resolve method */

    @RequestMapping("/major/{compid}")  //主裁判下的运动员表
    public String major(@PathVariable int compid,@ModelAttribute("refId")int refid,ModelMap map){
        Judge j = refereeService.getJudgeByRefComp(compid, refid);
        j.setCompetitionVO(MyConvertor.convertComp(j.getCompetition()));
        List<Integer> athIds = teamService.getAthByCompGroup(j.getCompetition().getId(),j.getGroupno());

        List<Athlete> athletes = new ArrayList<>();
        for(Integer i:athIds){
            Athlete athlete = teamService.getAthlete(i);
            athletes.add(athlete);
        }

        map.put("jud",j);
        map.put("athletes",athletes);

        return "majorRef";
    }


    @RequestMapping("/major/{compid}/{athid}") //查看某运动员的 裁判 给分列表
    public String majorConfirm(@PathVariable("compid")int compid,@PathVariable("athid")int athid,@ModelAttribute("refID")int refId){
        Judge j = refereeService.getJudgeByRefComp(compid,refId);



    }

}
