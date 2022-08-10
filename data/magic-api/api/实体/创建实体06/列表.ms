{
  "properties" : { },
  "id" : "cebb3ec3997d438488d4244c4d1e91db",
  "script" : null,
  "groupId" : "b4a11522ac934947a60a0c17b6e23a5c",
  "name" : "列表",
  "createTime" : 1659495853193,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
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
return db.page("""
    select id,class_name,created_time,project_id,table_comment,table_name from entity where 1=1
    ?{className, and class_name = #{className} }
    ?{createdTime, and created_time = #{createdTime} }
    ?{projectId, and project_id = #{projectId} }
    ?{tableComment, and table_comment = #{tableComment} }
    ?{tableName, and table_name = #{tableName} }
""")