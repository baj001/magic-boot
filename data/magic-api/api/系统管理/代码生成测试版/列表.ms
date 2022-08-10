{
  "properties" : { },
  "id" : "7333083f49764bdc83634fb68a996828",
  "script" : null,
  "groupId" : "a5266e0bbc3940aba40e743c0c8edc73",
  "name" : "列表",
  "createTime" : 1659594890518,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
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
return db.page("""
    select id,table_name,table_comment,create_date,update_date from sys_gen_info where 1=1
    ?{tableName, and table_name like concat('%',#{tableName},'%')}
    ?{tableComment, and table_comment like concat('%',#{tableComment},'%')}
    ?{createDate && createDate.split(',')[0], and create_date >= #{createDate.split(',')[0]}}
    ?{createDate && createDate.split(',')[1], and create_date <= #{createDate.split(',')[1]}}
    order by create_date desc
""")