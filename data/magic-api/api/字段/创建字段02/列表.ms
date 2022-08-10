{
  "properties" : { },
  "id" : "26deec8dca2442fdbd3f75ec6f511bc9",
  "script" : null,
  "groupId" : "299eceb22dec4a9985b056421a6c4d9e",
  "name" : "列表",
  "createTime" : 1659408069032,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:create02:view",
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
    select id,project_id,entity_id,jfield_name,field_name,jfield_type,field_type,field_desc,field_length,foreign_entity_id,foreign_field_id,created_time,created_by,version from field where 1=1
    ?{projectId, and project_id = #{projectId} }
    ?{entityId, and entity_id = #{entityId} }
    ?{jfieldName, and jfield_name = #{jfieldName} }
    ?{fieldName, and field_name = #{fieldName} }
    ?{jfieldType, and jfield_type = #{jfieldType} }
    ?{fieldType, and field_type = #{fieldType} }
    ?{fieldDesc, and field_desc = #{fieldDesc} }
    ?{fieldLength, and field_length = #{fieldLength} }
    ?{foreignEntityId, and foreign_entity_id = #{foreignEntityId} }
    ?{foreignFieldId, and foreign_field_id = #{foreignFieldId} }
    ?{createdTime, and created_time = #{createdTime} }
    ?{createdBy, and created_by = #{createdBy} }
    ?{version, and version = #{version} }
""")