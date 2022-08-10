{
  "properties" : { },
  "id" : "166c26d4352f460a8a8d421f10eca51e",
  "script" : null,
  "groupId" : "7ec506f972f14c5d828bf1ca8a9bf8c6",
  "name" : "生成建表语句",
  "createTime" : null,
  "updateTime" : 1660092605769,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/create",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "require_login",
    "value" : "false",
    "description" : "该接口需要登录才允许访问",
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  } ],
  "requestBody" : "",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 200,\n    \"message\": \"success\",\n    \"data\": 0,\n    \"timestamp\": 1660092501709,\n    \"executeTime\": 28\n}",
  "description" : "",
  "requestBodyDefinition" : {
    "name" : "",
    "value" : "",
    "description" : "",
    "required" : false,
    "dataType" : "Integer",
    "type" : null,
    "defaultValue" : null,
    "validateType" : "",
    "error" : "",
    "expression" : "",
    "children" : [ ]
  },
  "responseBodyDefinition" : {
    "name" : "",
    "value" : "",
    "description" : "",
    "required" : false,
    "dataType" : "Object",
    "type" : null,
    "defaultValue" : null,
    "validateType" : "",
    "error" : "",
    "expression" : "",
    "children" : [ {
      "name" : "code",
      "value" : "200",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "message",
      "value" : "success",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "data",
      "value" : "0",
      "description" : "",
      "required" : false,
      "dataType" : "Object",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "timestamp",
      "value" : "1660092501709",
      "description" : "",
      "required" : false,
      "dataType" : "Long",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "executeTime",
      "value" : "28",
      "description" : "",
      "required" : false,
      "dataType" : "Object",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    } ]
  }
}
================================
// CREATE TABLE `teacher` (
//     `id` int(11) AUTO_INCREMENT COMMENT '主键ID',
//     `age` int(11) DEFAULT NULL COMMENT '年龄',
//     `name` varchar(32) DEFAULT NULL COMMENT '姓名',
//     PRIMARY KEY (`id`)
// ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

// import org.ssssssss.magicboot.utils.AutoSql
// return AutoSql.helloTest()


// import org.ssssssss.magicboot.utils.TableBuild
// return TableBuild.ready()

// 方式1
// import org.ssssssss.magicboot.utils.CreateTable
// CreateTable.ready();

// 方式2
// var  sql = "create table `student`(
// 	`id` int NOT NULL AUTO_INCREMENT COMMENT '学生主键',
// 	`name` varchar(255) NOT NULL COMMENT '学生姓名',
// 	`mark` int NOT NULL COMMENT '考试成绩',
// 	`address` varchar(255) NOT NULL COMMENT '学生籍贯',
// 	PRIMARY KEY (`id`)
// ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生表'"

// var  sql = """
// create table `student`(
// 	`id` int NOT NULL AUTO_INCREMENT COMMENT '学生主键',
// 	`name` varchar(255) NOT NULL COMMENT '学生姓名',
// 	`mark` int NOT NULL COMMENT '考试成绩',
// 	`address` varchar(255) NOT NULL COMMENT '学生籍贯',
// 	PRIMARY KEY (`id`)
// ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生表'
// """
// return db.update(sql);




// 方式3
// return db.update("""
// create table `student`(
// 	`id` int NOT NULL AUTO_INCREMENT COMMENT '学生主键',
// 	`name` varchar(255) NOT NULL COMMENT '学生姓名',
// 	`mark` int NOT NULL COMMENT '考试成绩',
// 	`address` varchar(255) NOT NULL COMMENT '学生籍贯',
// 	PRIMARY KEY (`id`)
// ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生表'
// """);
