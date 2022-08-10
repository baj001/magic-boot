{
  "properties" : { },
  "id" : "6e4a3f5fb7d14275a48154b5a03ae5e7",
  "script" : null,
  "groupId" : "dc1795b3ee4a47a487762520ca3e78b2",
  "name" : "列表",
  "createTime" : 1659518964451,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "test:one:view",
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
return db.page("""
    select name,name,phone,mark from student where 1=1
    ?{name, and name = #{name} }
    ?{phone, and phone = #{phone} }
    ?{mark, and mark = #{mark} }
""")