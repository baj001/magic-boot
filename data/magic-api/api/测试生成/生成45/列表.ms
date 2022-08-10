{
  "properties" : { },
  "id" : "41d5c4af3e4c4025afa42731a6ea8f30",
  "script" : null,
  "groupId" : "df30a3a2d92b4590b9b7185599100eb8",
  "name" : "列表",
  "createTime" : 1659928083277,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
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
return db.page("""
    select name,phone,mark from student where 1=1
    ?{name, and name = #{name} }
    ?{phone, and phone = #{phone} }
    ?{mark, and mark = #{mark} }
""")