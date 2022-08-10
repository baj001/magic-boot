{
  "properties" : { },
  "id" : "fd9989cc91ca4f5ba0dca66d73bbb004",
  "script" : null,
  "groupId" : "fb53e16894d341bcb295d27170fbcc5b",
  "name" : "列表",
  "createTime" : 1659406835221,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create03:view",
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
    select id,project_id,class_name,table_name,depict,created_time,created_by from entity03 where 1=1
    ?{projectId, and project_id = #{projectId} }
    ?{className, and class_name = #{className} }
    ?{tableName, and table_name = #{tableName} }
    ?{depict, and depict = #{depict} }
    ?{createdTime, and created_time = #{createdTime} }
    ?{createdBy, and created_by = #{createdBy} }
""")