{
  "properties" : { },
  "id" : "d80f8774fd23450c9218c2959d32faf1",
  "script" : null,
  "groupId" : "75f9c880ef70453bbdeb5c73d12703bc",
  "name" : "详情",
  "createTime" : 1659497383107,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:create07:view",
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
    select id,colume_name,column_comment,column_type,created_time,entity_id,project_id,table_name from field where id = #{id}
""")