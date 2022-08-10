{
  "properties" : { },
  "id" : "ff910ebec40843ca9d48dd11d1839fda",
  "script" : null,
  "groupId" : "ad2b226efe014e2c9db8b9221483715a",
  "name" : "详情",
  "createTime" : 1659495763941,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "field:create05:view",
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
    select id,colume_name,column_comment,column_type,created_time,entity_id,project_id from field where id = #{id}
""")