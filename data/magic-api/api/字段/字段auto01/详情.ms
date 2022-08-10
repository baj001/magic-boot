{
  "properties" : { },
  "id" : "916a32bf216a4e59a102e3e9252fe43e",
  "script" : null,
  "groupId" : "8dd7fc309d9a4aa8b1c71d1d71fa0272",
  "name" : "详情",
  "createTime" : 1660026864461,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:01:view",
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
    select id,app_id,auto_increment,column_comment,column_name,column_type,entity_id,is_key,is_null,table_comment,table_name from field2 where id = #{id}
""")