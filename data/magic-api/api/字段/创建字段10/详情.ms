{
  "properties" : { },
  "id" : "48d1608341304f05947666a7f6167120",
  "script" : null,
  "groupId" : "71ea613973c04c4ebd3ac27e9a64898f",
  "name" : "详情",
  "createTime" : 1659506352482,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:create10:view",
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
    select id,column_comment,column_name,column_type,created_time,entity_id,project_id,table_name from field where id = #{id}
""")