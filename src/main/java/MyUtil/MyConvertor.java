package MyUtil;

public class MyConvertor {

    //将数字转换成 年龄组别的字符串
    public static String ageGroupString(int ageGroup){
        if(ageGroup == 0)
            return "7-8岁组";
        else if(ageGroup == 1)
            return "9-10岁组";
        else
            return "11-12岁组";
    }

    public static String groupString(int sex,int age){
        if ((sex != 0 && sex != 1) || !(age >=7 && age<=12))
            return null;

        String group = "";
        if (sex == 0)
            group += "女子";
        else
            group += "男子";
        if (age >= 7 && age <= 8)
            group += "7-8岁年龄组";
        else if(age >= 9 && age <= 10)
            group += "9-10岁年龄组";
        else
            group += "11-12岁年龄组";

        return group;

    }

    //将数字转换成 性别字符串
    public static String sexString(int sex){
        if(sex == 0)
            return "女";
        else
            return "男";
    }

    //比赛项目 转换成字符串（单杠，跳马等）


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
