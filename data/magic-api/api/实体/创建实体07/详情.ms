{
  "properties" : { },
  "id" : "66853354638943a78a49bdebf1c7cc18",
  "script" : null,
  "groupId" : "01b26ff0ddbc447880d8caa5ba33a79a",
  "name" : "详情",
  "createTime" : 1659497431649,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create07:view",
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
    select id,class_name,created_time,entity_id,project_id,table_comment,table_name from entity where id = #{id}
""")