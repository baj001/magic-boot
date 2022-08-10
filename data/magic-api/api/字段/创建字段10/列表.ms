{
  "properties" : { },
  "id" : "05a8515775f04ab58868615cb2216bd4",
  "script" : null,
  "groupId" : "71ea613973c04c4ebd3ac27e9a64898f",
  "name" : "列表",
  "createTime" : 1659506352466,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
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
return db.page("""
    select id,column_comment,column_name,column_type,created_time,entity_id,project_id,table_name from field where 1=1
    ?{columnComment, and column_comment = #{columnComment} }
    ?{columnName, and column_name = #{columnName} }
    ?{columnType, and column_type = #{columnType} }
    ?{createdTime, and created_time = #{createdTime} }
    ?{entityId, and entity_id = #{entityId} }
    ?{projectId, and project_id = #{projectId} }
    ?{tableName, and table_name = #{tableName} }
""")