{
  "properties" : { },
  "id" : "c07cd55a1c264b3a82c76848a7d50aea",
  "script" : null,
  "groupId" : "04c14005197b4ebebf754720bfae68d9",
  "name" : "详情",
  "createTime" : 1659927374711,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:fieldId:view",
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
    select id,entity_id,project_id,table_name,column_name,column_comment,column_type,created_time,field_id from field where id = #{id}
""")