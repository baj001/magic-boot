{
  "properties" : { },
  "id" : "b7c17a28ac2e4486a3dce0dd56235f70",
  "script" : null,
  "groupId" : "fa0a4aa9a10f4e0bafec8663fdf69707",
  "name" : "保存",
  "createTime" : null,
  "updateTime" : 1660102962644,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/save",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "wrap_request_parameter",
    "value" : "data",
    "description" : null,
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  }, {
    "name" : "permission",
    "value" : "entity:create10:save",
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
return db.table('entity').primary('id').save(data)

// import org.ssssssss.magicboot.utils.CreateTableParameter
// // 此处应该接收一个参数作为ready函数的
// // int testid = 1
// var sql = CreateTableParameter.ready(1)
// return db.update(sql);