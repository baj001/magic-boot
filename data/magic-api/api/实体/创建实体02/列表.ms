{
  "properties" : { },
  "id" : "a977b7fce0a44a1cb5fb6cb59006dbb1",
  "script" : null,
  "groupId" : "be400834e6174f178e4ff9809521f386",
  "name" : "列表",
  "createTime" : 1659406562469,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "entity:create02:view",
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
    select id,project_id,class_name,table_name from entity02 where 1=1
    ?{projectId, and project_id = #{projectId} }
    ?{className, and class_name = #{className} }
    ?{tableName, and table_name = #{tableName} }
""")