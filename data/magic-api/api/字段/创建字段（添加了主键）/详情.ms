{
  "properties" : { },
  "id" : "32068897e4fa46ec9a4f32063210440b",
  "script" : null,
  "groupId" : "a7a73bf7026b47deb9e24c1d50791604",
  "name" : "详情",
  "createTime" : 1659605246380,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:createprimary:view",
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
    select id,entity_id,project_id,table_name,column_name,column_comment,column_type,created_time,primary_key from field where id = #{id}
""")