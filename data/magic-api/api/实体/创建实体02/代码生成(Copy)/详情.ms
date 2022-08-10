{
  "properties" : { },
  "id" : "21d88183a2d94178b68cee038d6a52b9",
  "script" : null,
  "groupId" : "f172ef16474c47eabb2a2a33c513b780",
  "name" : "详情",
  "createTime" : 1659510455457,
  "updateTime" : 1648386086354,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ ],
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
    select * from sys_gen_info where id = #{id}
""")