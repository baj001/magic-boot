{
  "properties" : { },
  "id" : "09ec14f325614172aed203248dd71570",
  "script" : null,
  "groupId" : "f172ef16474c47eabb2a2a33c513b780",
  "name" : "执行生成",
  "createTime" : 1659510455453,
  "updateTime" : 1659510285513,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/execute",
  "method" : "POST",
  "parameters" : [ {
    "name" : "info",
    "value" : "{\"moduleName\":\"数据管理\",\"modulePath\":\"/data\",\"businessName\":\"测试生成\",\"businessPath\":\"/test\",\"template\":\"singleTable\"}",
    "description" : null,
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  }, {
    "name" : "columns",
    "value" : "[{\"columnName\":\"name\",\"columnComment\":\"名字\",\"columnType\":\"varchar(255)\",\"component\":\"component: 'input'\",\"where\":\"like\",\"save\":true,\"query\":true,\"list\":true,\"required\":false},{\"columnName\":\"sex\",\"columnComment\":\"性别\",\"columnType\":\"varchar(255)\",\"component\":\"component: 'radio-group'\",\"where\":\"=\",\"save\":true,\"query\":true,\"list\":true,\"required\":false,\"dictType\":\"sex\"},{\"columnName\":\"headPortrait\",\"columnComment\":\"头像\",\"columnType\":\"varchar(255)\",\"component\":\"component: 'upload-image'\",\"where\":\"in\",\"save\":true,\"query\":true,\"list\":true,\"required\":false},{\"columnName\":\"remarks\",\"columnComment\":\"备注\",\"columnType\":\"text\",\"component\":\"component: 'input',\\n                    props: {\\n                        type: 'textarea'\\n                    }\\n      \",\"where\":\"<=\",\"save\":true,\"query\":true,\"list\":true,\"required\":false}]",
    "description" : null,
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  }, {
    "name" : "tableName",
    "value" : "t_data_test",
    "description" : null,
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  }, {
    "name" : "tableComment",
    "value" : "测试生成",
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
    "name" : "permission",
    "value" : "code:gen:execute",
    "description" : "允许拥有该权限的访问",
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  }, {
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
  "responseBody" : "{\n    \"code\": 500,\n    \"message\": \"系统内部出现错误\",\n    \"data\": null,\n    \"timestamp\": 1659509195025,\n    \"executeTime\": 33\n}",
  "description" : null,
  "requestBodyDefinition" : {
    "name" : "root",
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
      "name" : "info",
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
        "name" : "moduleName",
        "value" : "数据管理",
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
        "name" : "modulePath",
        "value" : "/data",
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
    } ]
  },
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
      "value" : "500",
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
      "value" : "系统内部出现错误",
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
      "value" : "null",
      "description" : "",
      "required" : false,
      "dataType" : "Object",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "timestamp",
      "value" : "1659509195025",
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
      "value" : "33",
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
import org.ssssssss.magicapi.core.model.Option
import org.ssssssss.magicapi.component.model.ComponentInfo
import org.ssssssss.magicapi.core.model.ApiInfo
import org.ssssssss.magicapi.core.model.Group
import org.ssssssss.magicapi.core.service.MagicResourceService
import log
import org.ssssssss.magicapi.modules.db.cache.SqlCache;
import '@get:/system/menu/cache/delete' as cacheDelete;

info = info::json
var permissionPrefix = (info.modulePath + info.businessPath).replace(/^\//,'').replace(/\/\//, '/').replace('/', ':')

if(!db.selectValue("""select id from sys_menu where url = #{info.modulePath + info.businessPath} and is_del = 0""")){
    var menuId = uuid()
    var sort = db.selectInt("""select max(sort) + 10 from sys_menu where pid = #{info.pid} and is_del = 0""") || 10
    db.update("""
        insert into sys_menu(id, pid,name,url,component_name,sort,is_show)
        values(#{menuId}, #{info.pid}, #{info.businessName},#{info.modulePath + info.businessPath},#{permissionPrefix.replace(':','-') + '-list'},#{sort},1)
    """)
    db.update("""
        insert into sys_menu(id, pid, name, permission, sort, keep_alive) values(#{uuid()}, #{menuId}, '查看', #{permissionPrefix + ':view'}, 10, 0)
    """)
    db.update("""
        insert into sys_menu(id, pid, name, permission, sort, keep_alive) values(#{uuid()}, #{menuId}, '保存', #{permissionPrefix + ':save'}, 20, 0)
    """)
    db.update("""
        insert into sys_menu(id, pid, name, permission, sort, keep_alive) values(#{uuid()}, #{menuId}, '删除', #{permissionPrefix + ':delete'}, 30, 0)
    """)
    SqlCache.delete('permissions:1')
    cacheDelete();
}

var getGroup = (type) => {
    var moduleGroup = MagicResourceService.tree(type).children.filter(it => {
        return it.node.path == info.modulePath || it.node.path == info.modulePath.substring(1, info.modulePath.length())
    })
    if(moduleGroup.length == 0){
        Group group = new Group();
        group.setId(UUID.randomUUID().toString().replace('-', ''));
        group.setName(info.moduleName);
        group.setPath(info.modulePath);
        group.setParentId("0");
        group.setType(type)
        MagicResourceService.saveGroup(group);
        moduleGroup = group;
    }else{
        moduleGroup = moduleGroup[0].node
    }

    var businessGroup = MagicResourceService.tree(type).children.filter(it => it.node.id == moduleGroup.id)[0].children.filter(it => {
        return it.node.path == info.businessPath || it.node.path == info.businessPath.substring(1, info.businessPath.length())
    })
    if(businessGroup.length == 0){
        Group group = new Group();
        group.setId(UUID.randomUUID().toString().replace('-', ''));
        group.setName(info.businessName);
        group.setPath(info.businessPath);
        group.setParentId(moduleGroup.getId());
        group.setType(type)
        MagicResourceService.saveGroup(group);
        businessGroup = group;
    }else{
        businessGroup = businessGroup[0].node
    }
    return {
        moduleGroup,
        businessGroup
    }
}

var deleteFiles = (groupId, paths) => {
    var listFiles = MagicResourceService.listFiles(groupId)
    listFiles.forEach(it => {
        if(paths.indexOf(it.path) != -1){
            MagicResourceService.delete(it.id)
        }
    })
}

var businessGroup = getGroup('api').businessGroup

deleteFiles(businessGroup.getId(),['/list', '/save', '/get', '/delete'])

columns = columns::json
var listFields = columns.filter(it => it.list).map(it => it.columnName.replace(/([A-Z])/g,"_$1").toLowerCase()).join(',')
var wheres = '';
columns.forEach(it => {
    var field = it.columnName.replace(/([A-Z])/g,"_$1").toLowerCase()
    if(it.query){
        if(it.where == 'in'){
            wheres += `    ?{${it.columnName}, and ${field} in(#{`+it.columnName+`.split(',')}) }\n`
        }else if(it.where == 'like'){
            wheres += `    ?{${it.columnName}, and ${field} like concat('%',#{${it.columnName}},'%') }\n`
        }else{
            wheres += `    ?{${it.columnName}, and ${field} ${it.where} #{${it.columnName}} }\n`
        }
    }
})
datasource = datasource || ''
var commonField = db[datasource].select("""
    SELECT
        column_name
    FROM
        information_schema.COLUMNS
    WHERE
        table_name = #{tableName} 
        AND column_name IN ( 'is_del', 'create_by', 'create_date', 'update_by', 'update_date' ) 
        AND table_schema = DATABASE()
""")

// datasource = datasource || ''
// var commonField = db[datasource].select("""
//     SELECT
//         column_name
//     FROM
//         field
//     WHERE
//         table_name = #{tableName} 
//         AND table_schema = DATABASE()
// """)

commonField = commonField.map(it => it.columnName)
var primary = db[datasource].selectValue("SELECT column_name FROM information_schema.COLUMNS WHERE table_name = #{tableName} and column_key = 'PRI' and table_schema = database() limit 1")
var primaryLowerCamelCase = primary.replace(/([A-Z])/g,"_$1").toLowerCase()

var logic = ''
if(commonField.contains('is_del')){
    logic = '.logic()'
    wheres += `    and is_del = 0\n`
}
wheres = wheres.substring(0,wheres.length() - 1)

var datasourceScript = datasource ? `.${datasource}` : '';

ApiInfo listApi = new ApiInfo()
listApi.setName("列表")
listApi.setPath("/list")
listApi.setMethod("POST")
listApi.setGroupId(businessGroup.getId())
listApi.setScript(`return db${datasourceScript}.page("""
    select ${primary},${listFields} from ${tableName} where 1=1
${wheres}
""")`)
listApi.setOption([new Option('permission', `${permissionPrefix}:view`, '允许拥有该权限的访问')])
MagicResourceService.saveFile(listApi)

var saveMethod = 'save(data)'
if(commonField.size() >= 4){
    saveMethod = 'saveOrUpdate(data)'
}

ApiInfo saveApi = new ApiInfo()
saveApi.setName("保存")
saveApi.setPath("/save")
saveApi.setMethod("POST")
saveApi.setGroupId(businessGroup.getId())
saveApi.setScript(`return db${datasourceScript}.table('${tableName}').primary('${primary}').${saveMethod}`)
saveApi.setOption([new Option('wrap_request_parameter', 'data'), new Option('permission', `${permissionPrefix}:save`, '允许拥有该权限的访问')])
MagicResourceService.saveFile(saveApi)

ApiInfo deleteApi = new ApiInfo()
deleteApi.setName("删除")
deleteApi.setPath("/delete")
deleteApi.setMethod("DELETE")
deleteApi.setGroupId(businessGroup.getId())
deleteApi.setScript(`return db${datasourceScript}.table('${tableName}')${logic}.where().eq('${primary}', ${primaryLowerCamelCase}).delete()`)
deleteApi.setOption([new Option('permission', `${permissionPrefix}:delete`, '允许拥有该权限的访问')])
MagicResourceService.saveFile(deleteApi)

var saveFields = columns.filter(it => it.save).map(it => it.columnName.replace(/([A-Z])/g,"_$1").toLowerCase()).join(',')

ApiInfo getApi = new ApiInfo()
getApi.setName("详情")
getApi.setPath("/get")
getApi.setMethod("GET")
getApi.setGroupId(businessGroup.getId())
getApi.setScript(`return db${datasourceScript}.selectOne("""
    select ${primary},${saveFields} from ${tableName} where ${primary} = #{${primaryLowerCamelCase}}
""")`)
getApi.setOption([new Option('permission', `${permissionPrefix}:view`, '允许拥有该权限的访问')])
MagicResourceService.saveFile(getApi)


var componentBusinessGroup = getGroup('component').businessGroup

deleteFiles(componentBusinessGroup.getId(),['/list'])

ComponentInfo componentInfo = new ComponentInfo()
componentInfo.setGroupId(componentBusinessGroup.getId())
componentInfo.setName("列表")
componentInfo.setPath("/list")
componentInfo.setScript(componentScript)
MagicResourceService.saveFile(componentInfo)

return 1
