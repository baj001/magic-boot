{
  "properties" : { },
  "id" : "7d4d1596b146486489d10f473b6e54e2",
  "script" : null,
  "groupId" : "b4a11522ac934947a60a0c17b6e23a5c",
  "name" : "详情",
  "createTime" : 1659495853207,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create06:view",
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
    select id,class_name,created_time,project_id,table_comment,table_name from entity where id = #{id}
""")