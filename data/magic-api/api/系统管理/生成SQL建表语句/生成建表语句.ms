{
  "properties" : { },
  "id" : "166c26d4352f460a8a8d421f10eca51e",
  "script" : null,
  "groupId" : "7ec506f972f14c5d828bf1ca8a9bf8c6",
  "name" : "生成建表语句",
  "createTime" : null,
  "updateTime" : 1660115965732,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/create",
  "method" : "POST",
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
  }, {
    "name" : "permission",
    "value" : "system:sql:create",
    "description" : "允许拥有该权限的访问",
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
  "responseBody" : "{\n    \"code\": 200,\n    \"message\": \"success\",\n    \"data\": 0,\n    \"timestamp\": 1660113129765,\n    \"executeTime\": 40\n}",
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
      "value" : "1660113129765",
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
      "value" : "40",
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
import org.ssssssss.magicboot.utils.CreateTableParameter
print("\r\n\r\n")

print("当前的entity_id为 : " + id + "\r\n\r\n")

print("开始执行建表语句\r\n\r\n")

int ENTITYID = Integer.parseInt(id)
var sql = CreateTableParameter.ready(ENTITYID)
return db.update(sql);







// import org.ssssssss.magicboot.utils.CreateTableParameter

// print("当前的实体id:" + entityId +"\r\n\r\n")

// print("开始执行建表语句\r\n\r\n")

// int ENTITYID = Integer.parseInt(entityId)
// var sql = CreateTableParameter.ready(ENTITYID)
// return db.update(sql);


// select * from sys_gen_info where id = #{id}

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
