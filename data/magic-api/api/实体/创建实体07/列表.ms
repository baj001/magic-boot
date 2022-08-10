{
  "properties" : { },
  "id" : "59626e6d29b24f0fbd696b62a82952ca",
  "script" : null,
  "groupId" : "01b26ff0ddbc447880d8caa5ba33a79a",
  "name" : "列表",
  "createTime" : 1659497431631,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create07:view",
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