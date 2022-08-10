{
  "properties" : { },
  "id" : "da4324110cab41ea89fa6d74950bb543",
  "script" : null,
  "groupId" : "f172ef16474c47eabb2a2a33c513b780",
  "name" : "保存",
  "createTime" : 1659510455470,
  "updateTime" : 1648391254377,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/save",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "wrap_request_parameter",
    "value" : "data",
    "description" : "包装请求参数到一个变量中",
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
if(data.id){
    data.updateDate = new Date()
}
return db.table("sys_gen_info").primary("id").save(data)