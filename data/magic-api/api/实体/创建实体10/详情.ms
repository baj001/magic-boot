{
  "properties" : { },
  "id" : "f1f2f4327c334285b18548d64b841a80",
  "script" : null,
  "groupId" : "fa0a4aa9a10f4e0bafec8663fdf69707",
  "name" : "详情",
  "createTime" : 1659506412443,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create10:view",
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