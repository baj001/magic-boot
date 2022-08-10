{
  "properties" : { },
  "id" : "67f5a33c1fe745d5bfa63956a9ae2a2d",
  "script" : null,
  "groupId" : "a5266e0bbc3940aba40e743c0c8edc73",
  "name" : "所有数据源",
  "createTime" : null,
  "updateTime" : 1659595735818,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/database",
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
import org.ssssssss.magicapi.datasource.model.MagicDynamicDataSource
return MagicDynamicDataSource.datasources().map(it => {
    return {
        // label: it == '' ? '选择默认数据源' : it,
        label: it == '' ? '实体表' : it,
        value: it
    }
})