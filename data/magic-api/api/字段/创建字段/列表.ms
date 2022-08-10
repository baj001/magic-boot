{
  "properties" : { },
  "id" : "297a3be59e9846268ea8100617aff211",
  "script" : null,
  "groupId" : "74c83a008a4d48fc8617a0c2efbfe636",
  "name" : "列表",
  "createTime" : 1659408577753,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:create:view",
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
    select id,project_id,entity_id,jfield_name,field_name,jfield_type,field_type,field_desc,field_length,foreign_entity_id,foreign_field_id,created_time,created_by,version,foreign_key from field where 1=1
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
    ?{foreignKey, and foreign_key = #{foreignKey} }
""")