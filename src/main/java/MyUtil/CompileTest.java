package MyUtil;

import java.io.*;
import java.util.*;

public class CompileTest {

    public CompileTest() {
    }

    private static char ch, pro[] = new char[100], token[] = new char[8];
    private static int code; //单词对应的符号码
    private static String key[] = {"if", "then", "else", "while", "do"};//关键字

    private static int i, j, p = 0;
    private static int num;//计算数字（整数）
    private static int row = 0;//计算代码行数和列数，方便报出错误行

    public static void initPro() {
        String s = "x := 9; \n" +
                "if x > 0 then x. := (x-3) / 10 else x:=1;#";
        pro = s.toCharArray();

    }

    //是否为符号或者 下划线
    public static boolean isLetter(char ch) {
        if ((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || ch == '_')
            return true;
        return false;
    }

    public static boolean isDigit(char ch) {
        if (ch >= '0' && ch <= '9')
            return true;
        return false;
    }

    /*先判断是否为关键字或者标识符，接着判断是否为整数，
     * 最后判断运算符和界限符，全部不符合则报出错误行*/
    public static void doScan() {
        //初始化
        for (i = 0; i < 8; i++)
            token[i] = '\0';

        //去掉空格
        while (ch == ' ')
            ch = pro[p++];

        if (isLetter(ch)) {
            j = 0;
            token[j++] = ch;
            ch = pro[p++];
            while (isLetter(ch) || isDigit(ch)) {
                token[j++] = ch;
                ch = pro[p++];
            }
            p--; //多读了一位（超前搜索）
            code = 21; //标识符的符号码

            for (i = 0; i < 5; i++) {
                String s = String.valueOf(token);
//                System.out.println(s.equals(key[i]));
                //跟关键字比较
                if (s.trim().equals(key[i])) {
                    code = i + 1;
                    break;
                }
            }

        } else if (isDigit(ch)) {
            num = 0;
            while (isDigit(ch)) {
                //通过Ascii码算出数字字符的 int的值
                num = num * 10 + (ch - '0');
                ch = pro[p++];
            }
            p--; //多读了一位

            code = 11; //数字的符号码

        } else
            switch (ch) {
                case ':':
                    j = 0;
                    token[j++] = ch;
                    ch = pro[p++];
                    //判断赋值号
                    if (ch == '=') {
                        token[j++] = ch;
                        code = 17; //赋值号的 符号码
                    } else {
                        p--;
                        code = 16;
                    }
                    break;
                case '<':
                    j = 0;
                    token[j++] = ch;
                    ch = pro[p++];
                    if (ch == '=') {
                        token[j++] = ch;
                        code = 22; //小于等于号的 符号码
                    } else if (ch == '>') {
                        token[j++] = ch;
                        code = 23;
                    } else {
                        code = 20; //小于号的 符号码
                        p--;
                    }
                    break;
                case '>':
                    j = 0;
                    token[j++] = ch;
                    ch = pro[p++];
                    if (ch == '=') {
                        token[j++] = ch;
                        code = 19; //大于等于号的 符号码
                    } else {
                        code = 18; //大于号的 符号码
                        p--;
                    }
                    break;
                case '+':
                    token[0] = ch;
                    code = 12; //加号的 符号码
                    break;
                case '-':
                    token[0] = ch;
                    code = 13; //减号的 符号码
                    break;
                case '*':
                    token[0] = ch;
                    code = 14; //乘号的 符号码
                    break;
                case '/':
                    token[0] = ch;
                    code = 15; //除号的 符号码
                    break;
                case '(':
                    token[0] = ch;
                    code = 25;//左括号
                    break;
                case ')':
                    token[0] = ch;
                    code = 26; //右括号
                    break;
                case ';':
                    token[0] = ch;
                    code = 24; //分号
                    break;
                case '#':
                    token[0] = ch;
                    code = 0; //井号（结束符）的 符号码
                    break;
                case '\n':
                    code = -2;
                    row++;//换行  //TODO 可以做到换列
                    break;
                default:
                    code = -1; //代表出错
                    token[0] = ch;
                    break;
            }

    }


    private static void initFromFile() {
        try {
            //获取文件路径
            String fileName = new CompileTest().getClass().getClassLoader().getResource("Mypro.txt").getPath();
            System.out.println(fileName);
//            File f = new File(fileName);
            FileInputStream fis = new FileInputStream(fileName);

            //用于读取程序
            StringBuffer sbuf = new StringBuffer();
            String line = "";
            BufferedReader br = new BufferedReader(new InputStreamReader(fis));
            while ((line = br.readLine()) != null) {
                sbuf.append(line);
                sbuf.append("\n");//添加换行符
            }
            pro = sbuf.toString().toCharArray();

            p = 0;
            row = 1;

            //存储整形数和标识符
            Set intTokens = new HashSet();
            Set idTokens = new HashSet();

            /* 写入Txt文件 */
            File write = new File("./MyOutput.txt"); // 相对路径，如果没有则要建立一个新的output.txt文件
//            write.createNewFile(); // 创建新文件
            BufferedWriter out = new BufferedWriter(new FileWriter(write));
            do {
                ch = pro[p++];
                doScan();
                switch (code) {
                    case 11://数字
                        out.write("< " + code + " , " + num + " >" + " " + "\n");
                        intTokens.add(num);
                        break;
                    case -1:
                        out.write("\nError in row " + row + ", character: '" + String.valueOf(token) + "'" + "\n");
                        break;
                    case -2:
                        out.write("\n");
                        break;
                    default:
                        out.write("< " + code + " , " + String.valueOf(token) + " >" + " " + "\n");
                        if (code == 21)
                            idTokens.add(String.valueOf(token));
                        break;
                }
            }
            while (code != 0);

            //整形数符号表
            StringBuilder intStringBuilder = new StringBuilder();
            intStringBuilder.append("\n无符号整数符号表\n");
            intStringBuilder.append("Index" + "\t" + "Name" + "\n");
            int intCount = 1;
            Iterator it1 = intTokens.iterator();
            while (it1.hasNext()) {
                intStringBuilder.append((intCount++) + "\t\t");
                intStringBuilder.append((int) it1.next() + "\n");
            }

            //标识符符号表
            StringBuilder idStringBuilder = new StringBuilder();
            idStringBuilder.append("\n标识符符号表\n");
            idStringBuilder.append("Index" + "\t" + "Name" + "\n");
            int idCount = 1;
            Iterator it2 = idTokens.iterator();
            while (it2.hasNext()) {
                idStringBuilder.append((idCount++) + "\t\t");
                idStringBuilder.append(it2.next() + "\n");
            }

            out.write("\n");
            out.write(intStringBuilder.toString());
            out.write(idStringBuilder.toString());

            out.flush(); // 把缓存区内容压入文件
            out.close(); // 最后记得关闭文件

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

        initFromFile();
    }


}


//    private static void initFromPro(){
//        initPro();
//        p = 0;
//        row = 1;
//        do {
//            ch = pro[p++];
//            doScan();
//            switch (code) {
//                case 11://数字
//                    System.out.println("< " + code + " , " + num + " >");
//                    break;
//                case -1:
//                    System.out.println("Error in row " + row);
//                    break;
//                default:
//                    System.out.println("< " + code + " , " + String.valueOf(token) + " >");
//                    break;
//            }
//        }
//        while (code != 0);
//    }