{
  "properties" : { },
  "id" : "0694b3ba15744c2d997086e6dc462ae3",
  "script" : null,
  "groupId" : "02c9e06457e54963985be5ad81fe078b",
  "name" : "列表",
  "createTime" : 1659495853215,
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
            permission: 'entity:create06:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/entity/create06/list',
            where: {
                className: {
                    label: '类名',
                    component: 'input'
                },
                createdTime: {
                    label: '创建时间',
                    component: 'date'
                },
                projectId: {
                    label: '应用id',
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
                    field: 'className',
                    label: '类名'
                },
                {
                    field: 'createdTime',
                    label: '创建时间'
                },
                {
                    field: 'projectId',
                    label: '应用id'
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
                            permission: 'entity:create06:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'entity:create06:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/entity/create06/delete',
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
              url: '/entity/create06/get'
            }
        },
        form: {
            request: {
                url: "/entity/create06/save"
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
                    component: 'date'
                },{
                    span: 12,
                    name: 'projectId',
                    label: '应用id',
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