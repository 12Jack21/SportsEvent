package MyUtil;

public class MyConvertor {

    //将数字转换成 组别的字符串
    public static String groupString(int group){
        if(group == 0)
            return "7-8岁组";
        else if(group == 1)
            return "9-10岁组";
        else
            return "11-12岁组";
    }

    //将数字转换成 性别字符串
    public static String sexString(int sex){
        if(sex == 0)
            return "女";
        else
            return "男";
    }

    //比赛类型 转换成字符串(初赛、决赛类型)
    public static String comptypeString(int comptype){
        if(comptype == 0)
            return "初赛";
        else
            return "决赛";
    }

    //裁判类型转变成字符串
    public static String reftypeString(int reftype){
        if(reftype == 0)
            return "普通裁判";
        else
            return "主裁判";
    }
}
