{
  "properties" : { },
  "id" : "7e9faab92395468b90525aeb20bc040f",
  "script" : null,
  "groupId" : "0acaa31892794dc59678a42db71c3e3e",
  "name" : "列表",
  "createTime" : 1659407263182,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create01:view",
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
    select id,project_id,class_name,table_name,depict,created_time,created_by,version from entity where 1=1
    ?{projectId, and project_id = #{projectId} }
    ?{className, and class_name = #{className} }
    ?{tableName, and table_name = #{tableName} }
    ?{depict, and depict = #{depict} }
    ?{createdTime, and created_time = #{createdTime} }
    ?{createdBy, and created_by = #{createdBy} }
    ?{version, and version = #{version} }
""")