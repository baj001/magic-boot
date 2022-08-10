package org.ssssssss.magicboot.utils;

/**
 * @author baj
 * @creat 2022-08-09 15:28
 *
 * 这是用于数据库改为magic-boot的形式后的sql语句生成代码
 */
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CreateTable {
    public static void main(String[] args) throws Exception {
        CreateTable createTable = new CreateTable();
        CreateTable.ready();
    }


    public static void ready() throws Exception {
        //数据准备，从数据库中取出建表的表名字段等信息，全部添加到datalist中
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost/magic-boot-02?useSSL=false&zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF8&autoReconnect=true&serverTimezone=Asia/Shanghai",
                "root",
                "6666");
        Statement statement = con.createStatement();
        String sql1 = "select * from field2";
        ResultSet rs = statement.executeQuery(sql1);
        List<FieldData> datalist = new ArrayList<FieldData>();
        while (rs.next()) {
            FieldData d = new FieldData();
            d.setApp_id(rs.getString("app_id"));//项目id
            d.setEntity_id(rs.getString("entity_id"));//实体id
            d.setTable_name(rs.getString("table_name"));//表名
            d.setTable_comment(rs.getString("table_comment"));//表注释
            d.setColumn_name(rs.getString("column_name"));//字段名
            d.setColumn_comment(rs.getString("column_comment"));//字段注释
            d.setColumn_type(rs.getString("column_type"));//字段类型
            d.setIs_key(rs.getString("is_key"));//是否为主键
            d.setIs_null(rs.getString("is_null"));//是否可为空
            d.setAuto_increment(rs.getString("auto_increment"));//是否自增
            datalist.add(d);
        }
        build(con, datalist);
    }

    //生成建表语句文本
    public static void build(Connection con, List<FieldData> datalist) throws SQLException, IOException {
        StringBuffer CT = new StringBuffer();// CT用来生成建表语句
        StringBuffer AddTip = new StringBuffer();//用来生成添加注释语句
        StringBuffer PK = new StringBuffer();//用来生成 联合主键语句
        StringBuffer createtablesql = new StringBuffer();//最终组合成的完整建表语句
        List<String> PKlist = new ArrayList<String>();//用来暂时存放主键字段名的list
        int i;
        for (i = 0; i <= (datalist.size() - 1); i++) {
            //表名为空 跳过
            if (datalist.get(i).getTable_name().length() == 0) continue;

            //关于表语句的操作
            if (datalist.get(i).getTable_name().length() != 0) {
                //添加建表语句 只有当前的tablename和上一个不同的时候，才会创建新的表
                if((i > 0 && !datalist.get(i).getTable_name().equals(datalist.get(i - 1).getTable_name())) || i == 0){
                    //控制台打印建表提示
                    System.out.println(datalist.get(i).getTable_name() + "表创建");
                    CT.append("create table `" + datalist.get(i).getTable_name() + "`(\r\n");
                }
            }

            //字段的创建
            if (datalist.get(i).getColumn_name().length() != 0) {
                System.out.println("\t" + datalist.get(i).getColumn_name() + "字段创建");//控制台打印字段提示
                CT.append("\t" + "`" + datalist.get(i).getColumn_name() + "`");//字段名
//                CT.append("`" + datalist.get(i).getFiledname() + "`");//字段名

                if(datalist.get(i).getColumn_type().length() != 0){
                    CT.append(" " + datalist.get(i).getColumn_type());
                }

                if (datalist.get(i).getIs_key().equals("Y")) {//字段是否是联合主键
                    PKlist.add(datalist.get(i).getColumn_name());//是则把字段名加入到联合主键集合中
                }

                if (datalist.get(i).getIs_null().equals("N")) {//字段是否可为空
                    CT.append(" NOT NULL");
                }

                if (datalist.get(i).getIs_null().equals("Y")) {//字段是否可为空
                    CT.append(" DEFAULT NULL");
                }

                if(datalist.get(i).getAuto_increment().equals("Y")){//是否自增
                    CT.append(" AUTO_INCREMENT");
                }

                //字段注释
                if(datalist.get(i).getColumn_comment().length() != 0){
                    CT.append(" COMMENT '" + datalist.get(i).getColumn_comment() + "'");
                }

                CT.append(",");

                //把联合主键拼接到建表语句的末尾
                if (i == (datalist.size() - 1) || !datalist.get(i).getTable_name().equals(datalist.get(i + 1).getTable_name())) {//当下一条数据开始为新的表时
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
                                + datalist.get(i).getTable_comment() + "';");
                    }
                }
                CT.append("\r\n");
            }
            //当下一条数据开始为新的表时
            if (i == (datalist.size() - 1) || !datalist.get(i).getTable_name().equals(datalist.get(i + 1).getTable_name())) {
                CT.append("\r\n");
                createtablesql.append(CT);
                CT.delete(0, CT.length());
            }
        }

        //输出到文本文件
        File f = new File("createTable.sql");
        if (!f.exists()) {
            f.createNewFile();
        }
        BufferedWriter output = new BufferedWriter(new FileWriter(f));
        output.write(createtablesql.toString());
        output.close();
    }
}