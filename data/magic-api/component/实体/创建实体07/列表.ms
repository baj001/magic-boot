{
  "properties" : { },
  "id" : "9c8557131bdc408cb18ac7813f6d262a",
  "script" : null,
  "groupId" : "ec63af939bea4d14a3713efa86bfcae1",
  "name" : "列表",
  "createTime" : 1659497431654,
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
            permission: 'entity:create07:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/entity/create07/list',
            where: {
                className: {
                    label: '类名',
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
                tableComment: {
                    label: '备注',
                    component: 'input'
                },
                tableName: {
                    label: '表名',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'className',
                    label: '类名'
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
                    field: 'tableComment',
                    label: '备注'
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
                            permission: 'entity:create07:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'entity:create07:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/entity/create07/delete',
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
              url: '/entity/create07/get'
            }
        },
        form: {
            request: {
                url: "/entity/create07/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'className',
                    label: '类名',
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
                    name: 'tableComment',
                    label: '备注',
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