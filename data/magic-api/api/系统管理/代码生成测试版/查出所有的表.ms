{
  "properties" : { },
  "id" : "71699eba45a847cb8572492a3669fd65",
  "script" : null,
  "groupId" : "a5266e0bbc3940aba40e743c0c8edc73",
  "name" : "查出所有的表",
  "createTime" : 1659594706239,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/tables",
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
return db.select("""
    select table_name, table_comment from information_schema.tables where table_schema = database()
""").map(it => { label: it.tableName + `(${it.tableComment})`, value: it.tableName  })