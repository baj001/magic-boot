{
  "properties" : { },
  "id" : "1883bcc50a014888837bd8148432a286",
  "script" : null,
  "groupId" : "cbf6fe464f37430db2bf18bfbbf32a71",
  "name" : "详情",
  "createTime" : null,
  "updateTime" : 1660029877646,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
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
// 这里的 id 可以不用添加

return db.selectOne("""
    select name,age from teacher where id = #{id}
""")