{
  "properties" : { },
  "id" : "83cc0d78f2e34716b9b41e8fb317d604",
  "script" : null,
  "groupId" : "7345388aa92044ad939b1c6985160f34",
  "name" : "详情",
  "createTime" : null,
  "updateTime" : 1660028685050,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "grow:auto4:view",
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
return db.selectOne("""
    select id,name,age from teacher where id = #{id}
""")
