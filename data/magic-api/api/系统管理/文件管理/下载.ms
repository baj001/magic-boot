{
  "properties" : { },
  "id" : "63f76dedb8084db7b11f45b2ef1285de",
  "script" : null,
  "groupId" : "fd3d225a1cf141bf9998c4ec4bf4a6ab",
  "name" : "下载",
  "createTime" : null,
  "updateTime" : 1659949979663,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/download",
  "method" : "GET",
  "parameters" : [ {
    "name" : "urls",
    "value" : "userfiles/2022-05-05/c6aeb598deef48c385b0da831b7c2b85/QQ%E5%9B%BE%E7%89%8720220505165410.jpg,userfiles/2022-06-24/3eae989f6e5942a3b2e3dab2653865e3/QQ%E5%9B%BE%E7%89%8720220519110559.jpg",
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
  "responseBody" : "{\n    \"code\": 402,\n    \"message\": \"凭证已过期\",\n    \"data\": null,\n    \"timestamp\": 1659949970226,\n    \"executeTime\": null\n}",
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
      "value" : "402",
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
      "value" : "凭证已过期",
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
      "value" : "1659949970226",
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
    } ]
  }
}
================================
import java.net.URLDecoder
import java.net.URLEncoder
import java.io.File
import org.ssssssss.magicboot.model.Global
import cn.hutool.core.io.FileUtil
import cn.hutool.core.util.CharsetUtil
import cn.hutool.core.util.ZipUtil
import response

var files = []
urls = URLDecoder.decode(urls, "UTF-8").split(',')
for(url in urls){
    files.push(FileUtil.file(Global.getUserFilesBaseDir() + "/" + url))
}
if(!filename){
    if(urls.length > 1){
        filename = '附件.zip'
    }else{
        filename = urls[0].substring(urls[0].lastIndexOf('/') + 1)
    }
}else{
    if(urls.length > 1){
        filename += '.zip'
    }else{
        filename += urls[0].substring(urls[0].lastIndexOf('.'))
    }
}
response.setHeader("Content-Type","application/octet-stream;charset=utf-8")
response.setHeader("Content-Disposition", `attachment;filename=${URLEncoder.encode(filename, "UTF-8")}`)

if(urls.length > 1){
    ZipUtil.zip(response.getOutputStream(), CharsetUtil.defaultCharset(), false, null, files.toArray(new_array(File.class, 0)));
}else{
    FileUtil.writeToStream(FileUtil.file(Global.getUserFilesBaseDir() + "/" + urls[0]), response.getOutputStream())
}

return response.end()