{
  "properties" : { },
  "id" : "0f1e89671845455286fffa9cb0f08712",
  "script" : null,
  "groupId" : "f172ef16474c47eabb2a2a33c513b780",
  "name" : "删除",
  "createTime" : 1659510455467,
  "updateTime" : 1652170827148,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/delete",
  "method" : "DELETE",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "code:gen:delete",
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
return db.table("sys_gen_info").where().eq("id",id).delete()