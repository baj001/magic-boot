{
  "properties" : { },
  "id" : "3bf69ce1a58341629d530aba0571317d",
  "script" : null,
  "groupId" : "0acaa31892794dc59678a42db71c3e3e",
  "name" : "详情",
  "createTime" : 1659407263199,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create01:view",
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
    select id,project_id,class_name,table_name,depict,created_time,created_by,version from entity where id = #{id}
""")