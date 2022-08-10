{
  "properties" : { },
  "id" : "53f3f44fd8c444daa8f10684856f335b",
  "script" : null,
  "groupId" : "cbf6fe464f37430db2bf18bfbbf32a71",
  "name" : "列表",
  "createTime" : null,
  "updateTime" : 1660029860953,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "grow:auto5:view",
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
// return db.page("""
//     select name,age from teacher where 1=1
//     ?{name, and name = #{name} }
//     ?{age, and age = #{age} }
// """)

// 必须要保存列表中的id 字段才能实现删除
return db.page("""
    select id,name,age from teacher where 1=1
    ?{name, and name = #{name} }
    ?{age, and age = #{age} }
""")