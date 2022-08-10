{
  "properties" : { },
  "id" : "163d6cc7bf274832b438f1d175f536b5",
  "script" : null,
  "groupId" : "ad2b226efe014e2c9db8b9221483715a",
  "name" : "列表",
  "createTime" : 1659495763926,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:create05:view",
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
    select id,colume_name,column_comment,column_type,created_time,entity_id,project_id from field where 1=1
    ?{columeName, and colume_name = #{columeName} }
    ?{columnComment, and column_comment = #{columnComment} }
    ?{columnType, and column_type = #{columnType} }
    ?{createdTime, and created_time = #{createdTime} }
    ?{entityId, and entity_id = #{entityId} }
    ?{projectId, and project_id = #{projectId} }
""")