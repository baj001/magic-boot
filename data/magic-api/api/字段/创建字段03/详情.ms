{
  "properties" : { },
  "id" : "076d104c85804e03b92fbce7739f3980",
  "script" : null,
  "groupId" : "2c7e2f0ce8b844a58fb70cfadff71e2b",
  "name" : "详情",
  "createTime" : 1659408390684,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:create03:view",
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