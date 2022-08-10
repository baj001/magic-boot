{
  "properties" : { },
  "id" : "1a130a2b2ae5448ab8283b37561cfec9",
  "script" : null,
  "groupId" : "a7a73bf7026b47deb9e24c1d50791604",
  "name" : "列表",
  "createTime" : 1659605246363,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
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
return db.page("""
    select id,entity_id,project_id,table_name,column_name,column_comment,column_type,created_time,primary_key from field where 1=1
    ?{entityId, and entity_id = #{entityId} }
    ?{projectId, and project_id = #{projectId} }
    ?{tableName, and table_name = #{tableName} }
    ?{columnName, and column_name = #{columnName} }
    ?{columnComment, and column_comment = #{columnComment} }
    ?{columnType, and column_type = #{columnType} }
    ?{createdTime, and created_time = #{createdTime} }
    ?{primaryKey, and primary_key = #{primaryKey} }
""")