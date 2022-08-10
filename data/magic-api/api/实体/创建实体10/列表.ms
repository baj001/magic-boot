{
  "properties" : { },
  "id" : "20f41a8f199e4d679df9fbb23297f4c8",
  "script" : null,
  "groupId" : "fa0a4aa9a10f4e0bafec8663fdf69707",
  "name" : "列表",
  "createTime" : 1659506412408,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create10:view",
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
    select id,class_name,created_time,entity_id,project_id,table_comment,table_name from entity where 1=1
    ?{className, and class_name = #{className} }
    ?{createdTime, and created_time = #{createdTime} }
    ?{entityId, and entity_id = #{entityId} }
    ?{projectId, and project_id = #{projectId} }
    ?{tableComment, and table_comment = #{tableComment} }
    ?{tableName, and table_name = #{tableName} }
""")