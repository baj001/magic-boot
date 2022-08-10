{
  "properties" : { },
  "id" : "f507a7c8338c406ba25c5c0ab05fa80a",
  "script" : null,
  "groupId" : "df30a3a2d92b4590b9b7185599100eb8",
  "name" : "详情",
  "createTime" : 1659928083312,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "grow:45:view",
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
return db.selectOne("""
    select name,name,phone,mark from student where name = #{name}
""")