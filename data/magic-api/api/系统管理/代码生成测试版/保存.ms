{
  "properties" : { },
  "id" : "ab9fb5514a2c48ad812785a4361c34c0",
  "script" : null,
  "groupId" : "a5266e0bbc3940aba40e743c0c8edc73",
  "name" : "保存",
  "createTime" : null,
  "updateTime" : 1659594673827,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/save",
  "method" : "POST",
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
if(data.id){
    data.updateDate = new Date()
}
return db.table("sys_gen_info").primary("id").save(data)