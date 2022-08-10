{
  "properties" : { },
  "id" : "ece6710c97db47b28d61ee398f5e370b",
  "script" : null,
  "groupId" : "c6c2b98c9de141899150786df4f89e18",
  "name" : "详情",
  "createTime" : null,
  "updateTime" : 1659928327213,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "grow:46:view",
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
    select id,name,phone,mark from student where id = #{id}
""")