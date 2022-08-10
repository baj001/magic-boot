{
  "properties" : { },
  "id" : "bd20ca2cd1f94f85897ebc2803ef013b",
  "script" : null,
  "groupId" : "840fd2420e854aa4bb2503bba8f93797",
  "name" : "详情",
  "createTime" : 1659408524115,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:create01:view",
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
    select id,project_id,entity_id,jfield_name,field_name,jfield_type,field_type,field_desc,field_length,foreign_entity_id,foreign_field_id,created_time,created_by,version,foreign_key from field where id = #{id}
""")