{
  "properties" : { },
  "id" : "ee4f7555e84c42b2a82517df09f5d607",
  "script" : null,
  "groupId" : "8dd7fc309d9a4aa8b1c71d1d71fa0272",
  "name" : "列表",
  "createTime" : 1660026864404,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:01:view",
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
    select id,app_id,auto_increment,column_comment,column_name,column_type,entity_id,is_key,is_null,table_comment,table_name from field2 where 1=1
    ?{appId, and app_id = #{appId} }
    ?{autoIncrement, and auto_increment = #{autoIncrement} }
    ?{columnComment, and column_comment = #{columnComment} }
    ?{columnName, and column_name = #{columnName} }
    ?{columnType, and column_type = #{columnType} }
    ?{entityId, and entity_id = #{entityId} }
    ?{isKey, and is_key = #{isKey} }
    ?{isNull, and is_null = #{isNull} }
    ?{tableComment, and table_comment = #{tableComment} }
    ?{tableName, and table_name = #{tableName} }
""")