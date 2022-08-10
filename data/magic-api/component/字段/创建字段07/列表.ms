{
  "properties" : { },
  "id" : "c78a44784585413a9a2d9ff0f39d1d8a",
  "script" : null,
  "groupId" : "4248befcedac4e839843aef02556af0a",
  "name" : "列表",
  "createTime" : 1659497383112,
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
            permission: 'field:create07:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/field/create07/list',
            where: {
                columeName: {
                    label: '字段名',
                    component: 'input'
                },
                columnComment: {
                    label: '备注',
                    component: 'input'
                },
                columnType: {
                    label: '字段类型',
                    component: 'input'
                },
                createdTime: {
                    label: '创建时间',
                    component: 'input'
                },
                entityId: {
                    label: '实体id',
                    component: 'input'
                },
                projectId: {
                    label: '应用id',
                    component: 'input'
                },
                tableName: {
                    label: '表名',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'columeName',
                    label: '字段名'
                },
                {
                    field: 'columnComment',
                    label: '备注'
                },
                {
                    field: 'columnType',
                    label: '字段类型'
                },
                {
                    field: 'createdTime',
                    label: '创建时间'
                },
                {
                    field: 'entityId',
                    label: '实体id'
                },
                {
                    field: 'projectId',
                    label: '应用id'
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
                            permission: 'field:create07:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'field:create07:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/field/create07/delete',
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
              url: '/field/create07/get'
            }
        },
        form: {
            request: {
                url: "/field/create07/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'columeName',
                    label: '字段名',
                    component: 'input'
                },{
                    span: 12,
                    name: 'columnComment',
                    label: '备注',
                    component: 'input'
                },{
                    span: 12,
                    name: 'columnType',
                    label: '字段类型',
                    component: 'input'
                },{
                    span: 12,
                    name: 'createdTime',
                    label: '创建时间',
                    component: 'input'
                },{
                    span: 12,
                    name: 'entityId',
                    label: '实体id',
                    component: 'input'
                },{
                    span: 12,
                    name: 'projectId',
                    label: '应用id',
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