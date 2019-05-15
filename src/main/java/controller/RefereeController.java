package controller;

import MyUtil.MyConvertor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import po.*;
import service.RefereeService;
import service.TeamService;
import vo.AthTempListNormal;
import vo.RefTempListMajor;

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
    @RequestMapping("/tempScore/list") //得到一个裁判下每个运动员的最新给分，进行了相应的组装
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


    @RequestMapping("/major/{compid}/{athid}") //查看某运动员的 裁判 给分列表，进行与normal相似的 对应的组装
    public String majorConfirm(@PathVariable("compid")int compid,@PathVariable("athid")int athid,@ModelAttribute("refID")int refId,ModelMap map){
        //显示运动员信息 和最终成绩
        Participate par = refereeService.getSingleAthById(compid, athid);

        map.put("par",par);
        return "majorConfirm";
    }

    @ResponseBody
    @RequestMapping("/majorConfirm/refList")  //主裁判对于某个运动员 下的裁判表
    public Object majorConfirmList(@RequestParam("compid")int compid,@RequestParam("athid")int athid,@ModelAttribute("refID")int refId){
        Judge judge = refereeService.getJudgeByRefComp(compid,refId);

        List<Referee> referees = refereeService.getJudgeByCompGroup(compid,judge.getGroupno());
        List<RefTempListMajor> listMajors = new ArrayList<>();
        RefTempListMajor major = null;
        TempScore t = null;

        for(Referee r:referees){
            major = new RefTempListMajor();
            t = refereeService.getNewestScoreOfRef(compid,r.getId(),athid);
            if(t != null){
                major.setReferee(r);
                major.setTempScore_id(t.getId());
                major.setScore(t.getScore());
                major.setIsValid(t.getIsValid());

            }else {
                major.setReferee(r);
            }

            listMajors.add(major);
        }
        return listMajors;
    }

    @ResponseBody
    @RequestMapping("/majorConfirm/showLog/{refid}")
    public Object showLogOfRef(@PathVariable int refid,@RequestParam("compid")int compid,@RequestParam("athid")int athid){
        List<TempScore> tempScores = refereeService.getRefLogOfSingleAth(compid,refid,athid);
        return tempScores;
    }

}
