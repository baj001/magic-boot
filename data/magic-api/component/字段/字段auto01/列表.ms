{
  "properties" : { },
  "id" : "142dc57f6c024aa58fb7a43dc1be62ce",
  "script" : null,
  "groupId" : "2cbb159dbbdb45efbb141900fc8ae790",
  "name" : "列表",
  "createTime" : 1660026864478,
  "updateTime" : null,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "description" : null
}
================================
<template>
    <mb-list ref="magicList" v-bind="listOptions" />
    <mb-dialog ref="formDialog" :title="magicFormTitle" @confirm-click="magicForm.save($event)" width="50%">
        <template #content>
            <mb-form ref="magicForm" @reload="magicList.reload" v-bind="formOptions" />
        </template>
    </mb-dialog>
</template>
<script setup>
    import { ref, reactive, getCurrentInstance, nextTick } from 'vue'
    const { proxy } = getCurrentInstance()
    const formDialog = ref()
    const magicList = ref()
    const magicForm = ref()
    const magicFormTitle = ref()
    const listOptions = reactive({
        tools: [{
            type: 'add',
            permission: 'field:01:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/field/01/list',
            where: {
                appId: {
                    label: '应用id',
                    component: 'input'
                },
                autoIncrement: {
                    label: '是否自增(Y/N)',
                    component: 'input'
                },
                columnComment: {
                    label: '字段备注',
                    component: 'input'
                },
                columnName: {
                    label: '字段名',
                    component: 'input'
                },
                columnType: {
                    label: '字段类型',
                    component: 'input'
                },
                entityId: {
                    label: '实体id',
                    component: 'input'
                },
                isKey: {
                    label: '是否主键(Y/N)',
                    component: 'input'
                },
                isNull: {
                    label: '是否为NULL(Y/N)',
                    component: 'input'
                },
                tableComment: {
                    label: '表备注',
                    component: 'input'
                },
                tableName: {
                    label: '表名',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'appId',
                    label: '应用id'
                },
                {
                    field: 'autoIncrement',
                    label: '是否自增(Y/N)'
                },
                {
                    field: 'columnComment',
                    label: '字段备注'
                },
                {
                    field: 'columnName',
                    label: '字段名'
                },
                {
                    field: 'columnType',
                    label: '字段类型'
                },
                {
                    field: 'entityId',
                    label: '实体id'
                },
                {
                    field: 'isKey',
                    label: '是否主键(Y/N)'
                },
                {
                    field: 'isNull',
                    label: '是否为NULL(Y/N)'
                },
                {
                    field: 'tableComment',
                    label: '表备注'
                },
                {
                    field: 'tableName',
                    label: '表名'
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'field:01:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'field:01:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/field/01/delete',
                                    id: row.id,
                                    done: () => magicList.value.reload()
                                })
                            }
                        }
                    ]
                }
            ]
        }
    })
    
    const formOptions = reactive({
        detail: {
            request: {
              url: '/field/01/get'
            }
        },
        form: {
            request: {
                url: "/field/01/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'appId',
                    label: '应用id',
                    component: 'input'
                },{
                    span: 12,
                    name: 'autoIncrement',
                    label: '是否自增(Y/N)',
                    component: 'input'
                },{
                    span: 12,
                    name: 'columnComment',
                    label: '字段备注',
                    component: 'input'
                },{
                    span: 12,
                    name: 'columnName',
                    label: '字段名',
                    component: 'input'
                },{
                    span: 12,
                    name: 'columnType',
                    label: '字段类型',
                    component: 'input'
                },{
                    span: 12,
                    name: 'entityId',
                    label: '实体id',
                    component: 'input'
                },{
                    span: 12,
                    name: 'isKey',
                    label: '是否主键(Y/N)',
                    component: 'input'
                },{
                    span: 12,
                    name: 'isNull',
                    label: '是否为NULL(Y/N)',
                    component: 'input'
                },{
                    span: 12,
                    name: 'tableComment',
                    label: '表备注',
                    component: 'input'
                },{
                    span: 12,
                    name: 'tableName',
                    label: '表名',
                    component: 'input'
                }]
            }]
        }
    })
</script>