{
  "properties" : { },
  "id" : "cc2cdf03fded4694a50916821ad1cb45",
  "script" : null,
  "groupId" : "a5266e0bbc3940aba40e743c0c8edc73",
  "name" : "详情",
  "createTime" : null,
  "updateTime" : 1659594945165,
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