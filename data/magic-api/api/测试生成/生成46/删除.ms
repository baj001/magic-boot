{
  "properties" : { },
  "id" : "49b744bb17b64c56bd76c6d43bc2ddb8",
  "script" : null,
  "groupId" : "c6c2b98c9de141899150786df4f89e18",
  "name" : "删除",
  "createTime" : null,
  "updateTime" : 1659928315854,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/delete",
  "method" : "DELETE",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "grow:46:delete",
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
  "requestBody" : "",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : null,
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
return db.table('student').where().eq('id', id).delete()