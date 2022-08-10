{
  "properties" : { },
  "id" : "f02177bc34eb47f7849d1872d1adbf5d",
  "script" : null,
  "groupId" : "b41f4de377d54694975ad75840e8cd2e",
  "name" : "列表",
  "createTime" : 1659598334719,
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
            permission: 'grow:18:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/grow/18/list',
            where: {
                entityId: {
                    label: '实体id',
                    component: 'input'
                },
                projectId: {
                    label: '项目id',
                    component: 'input'
                },
                className: {
                    label: '类名',
                    component: 'input'
                },
                tableName: {
                    label: '表名',
                    component: 'input'
                },
                tableComment: {
                    label: '备注',
                    component: 'input'
                },
                createdTime: {
                    label: '创建时间',
                    component: 'date'
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
                    field: 'className',
                    label: '类名'
                },
                {
                    field: 'tableName',
                    label: '表名'
                },
                {
                    field: 'tableComment',
                    label: '备注'
                },
                {
                    field: 'createdTime',
                    label: '创建时间'
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'grow:18:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'grow:18:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/grow/18/delete',
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
              url: '/grow/18/get'
            }
        },
        form: {
            request: {
                url: "/grow/18/save"
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
                    name: 'className',
                    label: '类名',
                    component: 'input'
                },{
                    span: 12,
                    name: 'tableName',
                    label: '表名',
                    component: 'input'
                },{
                    span: 12,
                    name: 'tableComment',
                    label: '备注',
                    component: 'input'
                },{
                    span: 12,
                    name: 'createdTime',
                    label: '创建时间',
                    component: 'date'
                }]
            }]
        }
    })
</script>