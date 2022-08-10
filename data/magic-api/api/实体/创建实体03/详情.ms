{
  "properties" : { },
  "id" : "5efda246c69c4055bb25ee9f75e9c745",
  "script" : null,
  "groupId" : "fb53e16894d341bcb295d27170fbcc5b",
  "name" : "详情",
  "createTime" : 1659406835239,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create03:view",
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
    select id,project_id,class_name,table_name,depict,created_time,created_by from entity03 where id = #{id}
""")