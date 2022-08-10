{
  "properties" : { },
  "id" : "1d8bfa5cf93c43679136c5fff3b1db36",
  "script" : null,
  "groupId" : "cbf6fe464f37430db2bf18bfbbf32a71",
  "name" : "删除",
  "createTime" : 1660029579848,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/delete",
  "method" : "DELETE",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "grow:auto5:delete",
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
return db.table('teacher').where().eq('id', id).delete()