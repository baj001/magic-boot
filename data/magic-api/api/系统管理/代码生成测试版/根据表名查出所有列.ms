{
  "properties" : { },
  "id" : "0dd86c00bb2843b8a15d72ff3dba6fb8",
  "script" : null,
  "groupId" : "a5266e0bbc3940aba40e743c0c8edc73",
  "name" : "根据表名查出所有列",
  "createTime" : null,
  "updateTime" : 1659595010966,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/columns",
  "method" : "GET",
  "parameters" : [ {
    "name" : "tableName",
    "value" : "sys_user",
    "description" : null,
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  } ],
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
return {
    columns: db.select("""
        SELECT
            column_name,
            column_comment,
            column_type,
            case when is_nullable = 'YES' then 0 else 1 end required
        FROM
            information_schema.COLUMNS 
        WHERE
            table_name = #{tableName}
            AND column_name NOT IN ( 'id', 'is_del', 'create_by', 'create_date', 'update_by', 'update_date' ) 
            AND table_schema = DATABASE()
    """),
    primary: db.selectValue("SELECT column_name FROM information_schema.COLUMNS WHERE table_name = #{tableName} and column_key = 'PRI' and table_schema = database() limit 1")
}