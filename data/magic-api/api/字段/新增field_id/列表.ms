{
  "properties" : { },
  "id" : "8194ebf3c8814a059cf6dd4c43e3c17b",
  "script" : null,
  "groupId" : "04c14005197b4ebebf754720bfae68d9",
  "name" : "列表",
  "createTime" : 1659927374676,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
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
return db.page("""
    select id,entity_id,project_id,table_name,column_name,column_comment,column_type,created_time,field_id from field where 1=1
    ?{entityId, and entity_id = #{entityId} }
    ?{projectId, and project_id = #{projectId} }
    ?{tableName, and table_name = #{tableName} }
    ?{columnName, and column_name = #{columnName} }
    ?{columnComment, and column_comment = #{columnComment} }
    ?{columnType, and column_type = #{columnType} }
    ?{createdTime, and created_time = #{createdTime} }
    ?{fieldId, and field_id = #{fieldId} }
""")