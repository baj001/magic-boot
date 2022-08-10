{
  "properties" : { },
  "id" : "79f3a7726a0b4fec90aa28df9f8480c1",
  "script" : null,
  "groupId" : "f172ef16474c47eabb2a2a33c513b780",
  "name" : "根据表名查出所有列",
  "createTime" : 1659510455464,
  "updateTime" : 1659509363405,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/columns",
  "method" : "GET",
  "parameters" : [ {
    "name" : "tableName",
    "value" : "field",
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
  "options" : [ {
    "name" : "require_login",
    "value" : "false",
    "description" : "该接口需要登录才允许访问",
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
  "responseBody" : "{\n    \"code\": 200,\n    \"message\": \"success\",\n    \"data\": {\n        \"columns\": [],\n        \"primary\": \"id\"\n    },\n    \"timestamp\": 1659509361548,\n    \"executeTime\": 2\n}",
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : {
    "name" : "",
    "value" : "",
    "description" : "",
    "required" : false,
    "dataType" : "Object",
    "type" : null,
    "defaultValue" : null,
    "validateType" : "",
    "error" : "",
    "expression" : "",
    "children" : [ {
      "name" : "code",
      "value" : "200",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "message",
      "value" : "success",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "data",
      "value" : "",
      "description" : "",
      "required" : false,
      "dataType" : "Object",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ {
        "name" : "columns",
        "value" : "",
        "description" : "",
        "required" : false,
        "dataType" : "Array",
        "type" : null,
        "defaultValue" : null,
        "validateType" : "",
        "error" : "",
        "expression" : "",
        "children" : [ ]
      }, {
        "name" : "primary",
        "value" : "id",
        "description" : "",
        "required" : false,
        "dataType" : "String",
        "type" : null,
        "defaultValue" : null,
        "validateType" : "",
        "error" : "",
        "expression" : "",
        "children" : [ ]
      } ]
    }, {
      "name" : "timestamp",
      "value" : "1659509361548",
      "description" : "",
      "required" : false,
      "dataType" : "Long",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "executeTime",
      "value" : "2",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    } ]
  }
}
================================
// return {
//     columns: db[datasource || ''].select("""
//         SELECT
//             column_name,
//             column_comment,
//             column_type,
//             case when is_nullable = 'YES' then 0 else 1 end required
//         FROM
//             information_schema.COLUMNS 
//         WHERE
//             table_name = #{tableName}
//             AND column_name NOT IN ( 'id', 'is_del', 'create_by', 'create_date', 'update_by', 'update_date' ) 
//             AND table_schema = DATABASE()
//     """),
//     primary: db.selectValue("SELECT column_name FROM information_schema.COLUMNS WHERE table_name = #{tableName} and column_key = 'PRI' and table_schema = database() limit 1")
// }


// return {
//     columns: db[datasource || ''].select("""
//         SELECT
//             column_name,
//             column_comment,
//             column_type,
//             case when is_nullable = 'YES' then 0 else 1 end required
//         FROM
//             -- field
//             information_schema.COLUMNS 
//         WHERE
//             table_name = #{tableName}
//             AND column_name NOT IN ( 'id', 'is_del', 'create_by', 'create_date', 'update_by', 'update_date' ) 
//             AND table_schema = DATABASE()
//     """),
//     primary: db.selectValue("SELECT column_name FROM information_schema.COLUMNS WHERE table_name = #{tableName} and column_key = 'PRI' and table_schema = database() limit 1")
// }

// return db[datasource || ''].select("""
//     select table_name, table_comment from entity
// """).map(it => { label: it.tableName + `(${it.tableComment})`, value: it.tableName  })

// return {
//     columns: db[datasource || ''].select("""
//         SELECT
//             column_name,
//             column_comment,
//             column_type,
//         FROM
//             field
//         -- WHERE
//         --     table_name = #{tableName}
//             -- AND column_name NOT IN ( 'id', 'is_del', 'create_by', 'create_date', 'update_by', 'update_date' ) 
//             -- AND table_schema = DATABASE()
//     """),
//     primary: db.selectValue("SELECT column_name FROM information_schema.COLUMNS WHERE table_name = #{tableName} and table_schema = database() limit 1")
// }

// return db[datasource || ''].select("""
//         select 
//             colume_name,
//             column_comment,
//             column_type
//         from
//             field
//     """)


// return db[datasource || ''].select("""
//     select 
//         column_name, 
//         column_comment, 
//         column_type 
//     from 
//         field
// """)

return {
    columns: db[datasource || ''].select("""
    select 
        column_name, 
        column_comment, 
        column_type 
    from 
        field
    where
        table_name = #{tableName}
"""),
    primary: db.selectValue("SELECT column_name FROM information_schema.COLUMNS WHERE table_name = #{tableName} and column_key = 'PRI' and table_schema = database() limit 1")
}
