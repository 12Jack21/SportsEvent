package controller;

import MyUtil.MyConvertor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import po.Judge;
import po.TempScore;
import service.RefereeService;

import java.util.List;

@Controller
@RequestMapping("/referee")
@SessionAttributes(value = {"refId"}, types = {int.class})
public class RefereeController {//TODO 运动员报名完毕后 设置编号
    @Autowired
    private RefereeService refereeService;

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

    @RequestMapping("/major/{compid}")
    public String major(@PathVariable int compid){

        return "majorRef";
    }

    @RequestMapping("/normal/{compid}")
    public String normal(@PathVariable int compid,@ModelAttribute("refId")int refid,ModelMap map){
        Judge judge = refereeService.getJudgeByRefComp(compid, refid);
        judge.setCompetitionVO(MyConvertor.convertComp(judge.getCompetition()));
        map.put("jud",judge);
        return "normalRef";
    }

    @ResponseBody
    @RequestMapping("/tempScore/list")
    public Object normalScoreList(@RequestParam("compId")int compid,@RequestParam("groupNo")int groupNo){

    }

    @ResponseBody
    @RequestMapping("/tempScore/add")
    public Object normalAddScore(TempScore tempScore){

    }

    @ResponseBody
    @RequestMapping("tempScore/log")
    public Object normalScoreLog(@RequestParam("compId")int compid,@RequestParam("athId")int athid){

    }

}
