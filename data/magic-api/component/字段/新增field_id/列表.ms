{
  "properties" : { },
  "id" : "c7e5e3960c4f44a0b85f26828dd1d786",
  "script" : null,
  "groupId" : "a3acd2f0d71446dab88662418e068a09",
  "name" : "列表",
  "createTime" : 1659927374724,
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
            permission: 'field:fieldId:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/field/fieldId/list',
            where: {
                entityId: {
                    label: '实体id',
                    component: 'input'
                },
                projectId: {
                    label: '项目id',
                    component: 'input'
                },
                tableName: {
                    label: '表名',
                    component: 'input'
                },
                columnName: {
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
                    component: 'date'
                },
                fieldId: {
                    label: '字段id',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'entityId',
                    label: '实体id'
                },
                {
                    field: 'projectId',
                    label: '项目id'
                },
                {
                    field: 'tableName',
                    label: '表名'
                },
                {
                    field: 'columnName',
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
                    field: 'fieldId',
                    label: '字段id'
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'field:fieldId:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'field:fieldId:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/field/fieldId/delete',
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
              url: '/field/fieldId/get'
            }
        },
        form: {
            request: {
                url: "/field/fieldId/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'entityId',
                    label: '实体id',
                    component: 'input'
                },{
                    span: 12,
                    name: 'projectId',
                    label: '项目id',
                    component: 'input'
                },{
                    span: 12,
                    name: 'tableName',
                    label: '表名',
                    component: 'input'
                },{
                    span: 12,
                    name: 'columnName',
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
                    component: 'date'
                },{
                    span: 12,
                    name: 'fieldId',
                    label: '字段id',
                    component: 'input'
                }]
            }]
        }
    })
</script>