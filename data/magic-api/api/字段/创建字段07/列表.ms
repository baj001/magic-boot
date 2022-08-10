{
  "properties" : { },
  "id" : "75a44f688d5948d59098f8ade525b2a1",
  "script" : null,
  "groupId" : "75f9c880ef70453bbdeb5c73d12703bc",
  "name" : "列表",
  "createTime" : 1659497383089,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
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
return db.page("""
    select id,colume_name,column_comment,column_type,created_time,entity_id,project_id,table_name from field where 1=1
    ?{columeName, and colume_name = #{columeName} }
    ?{columnComment, and column_comment = #{columnComment} }
    ?{columnType, and column_type = #{columnType} }
    ?{createdTime, and created_time = #{createdTime} }
    ?{entityId, and entity_id = #{entityId} }
    ?{projectId, and project_id = #{projectId} }
    ?{tableName, and table_name = #{tableName} }
""")