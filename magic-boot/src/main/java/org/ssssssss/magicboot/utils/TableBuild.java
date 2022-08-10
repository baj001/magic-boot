package org.ssssssss.magicboot.utils;

/**
 * @author baj
 * @creat 2022-08-09 9:10
 */
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TableBuild {
    public static void main(String[] args) throws Exception {
        TableBuild tableBuild = new TableBuild();
        tableBuild.ready();
    }


    public static void ready() throws Exception {
        //数据准备，先从数据库中取出建表的表名字段等信息，全部添加到datalist中
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost/magic-boot-02?useSSL=false&zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF8&autoReconnect=true&serverTimezone=Asia/Shanghai",
                "root",
                "6666");
        Statement statement = con.createStatement();
        String sql1 = "select * from data";
        ResultSet rs = statement.executeQuery(sql1);
        List<Data> datalist = new ArrayList<Data>();
        while (rs.next()) {
            Data d = new Data();
            d.setTablename(rs.getString("tablename"));//表名
            d.setTablecname(rs.getString("tablecname"));//表注释
            d.setFiledname(rs.getString("filedname"));//字段名
            d.setType(rs.getString("type"));//字段类型
            d.setFiledcname(rs.getString("filedcname"));//字段注释
            d.setIskey(rs.getString("iskey"));//是否为主键
            d.setIsnull(rs.getString("isnull"));//是否可为空
            d.setCode(rs.getString("code"));//用来匹配字段格式的
            d.setAuto_increment(rs.getString("auto_increment"));//是否自增
            datalist.add(d);
        }
        build(con, datalist);
    }

    //生成建表语句文本
    public static void build(Connection con, List<Data> datalist) throws SQLException, IOException {
        StringBuffer CT = new StringBuffer();// CT用来生成建表语句
        StringBuffer AddTip = new StringBuffer();//用来生成添加注释语句
        StringBuffer PK = new StringBuffer();//用来生成 联合主键语句
        StringBuffer createtablesql = new StringBuffer();//最终组合成的完整建表语句
        List<String> PKlist = new ArrayList<String>();//用来暂时存放主键字段名的list
        int i;
        for (i = 0; i <= (datalist.size() - 1); i++) {
            //表名为空 跳过
            if (datalist.get(i).getTablename().length() == 0) continue;

            //关于表语句的操作
            if (datalist.get(i).getTablename().length() != 0) {
                //添加建表语句 只有当前的tablename和上一个不同的时候，才会创建新的表
                if((i > 0 && !datalist.get(i).getTablename().equals(datalist.get(i - 1).getTablename())) || i == 0){
                    //控制台打印建表提示
                    System.out.println(datalist.get(i).getTablename() + "表创建");
                    CT.append("create table `" + datalist.get(i).getTablename() + "`(\r\n");
                }
            }

            //字段的创建
            if (datalist.get(i).getFiledname().length() != 0) {
                System.out.println("\t" + datalist.get(i).getFiledname() + "字段创建");//控制台打印字段提示
                CT.append("\t" + "`" + datalist.get(i).getFiledname() + "`");//字段名
//                CT.append("`" + datalist.get(i).getFiledname() + "`");//字段名

                if(datalist.get(i).getType().length() != 0){
                    CT.append(" " + datalist.get(i).getType());
                }

                if (datalist.get(i).getIskey().equals("Y")) {//字段是否是联合主键
                    PKlist.add(datalist.get(i).getFiledname());//是则把字段名加入到联合主键集合中
                }

                if (datalist.get(i).getIsnull().equals("N")) {//字段是否可为空
                    CT.append(" NOT NULL");
                }

                if (datalist.get(i).getIsnull().equals("Y")) {//字段是否可为空
                    CT.append(" DEFAULT NULL");
                }

                if(datalist.get(i).getAuto_increment().equals("Y")){//是否自增
                    CT.append(" AUTO_INCREMENT");
                }

                //字段注释
                if(datalist.get(i).getFiledcname().length() != 0){
                    CT.append(" COMMENT '" + datalist.get(i).getFiledcname() + "'");
                }

                CT.append(",");

                //把联合主键拼接到建表语句的末尾
                if (i == (datalist.size() - 1) || !datalist.get(i).getTablename().equals(datalist.get(i + 1).getTablename())) {//当下一条数据开始为新的表时
                    if (PKlist.size() > 0) {
                        //添加联合主键
//                        PK.append("\tCONSTRAINT PK_" + datalist.get(i).getTablename() + " PRIMARY KEY (");
                        PK.append("\t" + "PRIMARY KEY (`");
                        for (String str : PKlist) {//把存有主键的list用逗号分隔开转化成String类型
                            PK.append(str).append(",");
                        }
                        PK = PK.deleteCharAt(PK.length() - 1);//去掉拼接完成后最后一个逗号
                        PKlist.clear();//清空PKlist
                        PK.append("`)");

                        CT.append("\r\n");
                        CT.append(PK);//把生成的主键语句拼接到建表语句中
                        PK.delete(0, PK.length());//拼接完后清空创建主键语句
                        CT.append("\r\n");
                        CT.append(") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='"
                                + datalist.get(i).getTablecname() + "';");
                    }
                }
                CT.append("\r\n");
            }
            //当下一条数据开始为新的表时
            if (i == (datalist.size() - 1) || !datalist.get(i).getTablename().equals(datalist.get(i + 1).getTablename())) {
                CT.append("\r\n");
                createtablesql.append(CT);
                CT.delete(0, CT.length());
            }
        }

        //输出到文本文件
        File f = new File("2.sql");
        if (!f.exists()) {
            f.createNewFile();
        }
        BufferedWriter output = new BufferedWriter(new FileWriter(f));
        output.write(createtablesql.toString());
        output.close();
    }
}






