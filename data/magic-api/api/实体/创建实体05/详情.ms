{
  "properties" : { },
  "id" : "7e98d369c60f4be2b6f1e8cc1295f09c",
  "script" : null,
  "groupId" : "34b26a6b2dc643f087a065ea7931da80",
  "name" : "详情",
  "createTime" : 1659495651738,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create05:view",
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
  "requestBody" : null,
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : null,
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
return db.selectOne("""
    select id,class_name,created_time,project_id,table_comment,table_name from entity where id = #{id}
""")