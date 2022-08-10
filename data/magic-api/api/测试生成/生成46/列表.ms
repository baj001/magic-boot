{
  "properties" : { },
  "id" : "eee87d1b8f3d402eb990e325d27d1788",
  "script" : null,
  "groupId" : "c6c2b98c9de141899150786df4f89e18",
  "name" : "列表",
  "createTime" : null,
  "updateTime" : 1659928305044,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
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
return db.page("""
    select id,name,phone,mark from student where 1=1
    ?{name, and name = #{name} }
    ?{phone, and phone = #{phone} }
    ?{mark, and mark = #{mark} }
""")