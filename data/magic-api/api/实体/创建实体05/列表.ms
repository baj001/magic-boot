{
  "properties" : { },
  "id" : "72324cb61611495eabff6b4e6f5e12aa",
  "script" : null,
  "groupId" : "34b26a6b2dc643f087a065ea7931da80",
  "name" : "列表",
  "createTime" : 1659495651719,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create05:view",
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