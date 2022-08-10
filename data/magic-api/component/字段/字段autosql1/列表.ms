{
  "properties" : { },
  "id" : "671399298d8f4e9bb52bbdc30f4b7e13",
  "script" : null,
  "groupId" : "dc51a76b8bb744778ab4fdbcb1b3abc3",
  "name" : "列表",
  "createTime" : 1660026239358,
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
            permission: 'field:autosql1:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/field/autosql1/list',
            where: {
                appId: {
                    label: '',
                    component: 'input'
                },
                autoIncrement: {
                    label: '',
                    component: 'input'
                },
                columnComment: {
                    label: '',
                    component: 'input'
                },
                columnName: {
                    label: '',
                    component: 'input'
                },
                columnType: {
                    label: '',
                    component: 'input'
                },
                entityId: {
                    label: '',
                    component: 'input'
                },
                iskey: {
                    label: '',
                    component: 'input'
                },
                isnull: {
                    label: '',
                    component: 'input'
                },
                tableComment: {
                    label: '',
                    component: 'input'
                },
                tableName: {
                    label: '',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'appId',
                    label: ''
                },
                {
                    field: 'autoIncrement',
                    label: ''
                },
                {
                    field: 'columnComment',
                    label: ''
                },
                {
                    field: 'columnName',
                    label: ''
                },
                {
                    field: 'columnType',
                    label: ''
                },
                {
                    field: 'entityId',
                    label: ''
                },
                {
                    field: 'iskey',
                    label: ''
                },
                {
                    field: 'isnull',
                    label: ''
                },
                {
                    field: 'tableComment',
                    label: ''
                },
                {
                    field: 'tableName',
                    label: ''
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'field:autosql1:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'field:autosql1:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/field/autosql1/delete',
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
              url: '/field/autosql1/get'
            }
        },
        form: {
            request: {
                url: "/field/autosql1/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'appId',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'autoIncrement',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'columnComment',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'columnName',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'columnType',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'entityId',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'iskey',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'isnull',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'tableComment',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'tableName',
                    label: '',
                    component: 'input'
                }]
            }]
        }
    })
</script>