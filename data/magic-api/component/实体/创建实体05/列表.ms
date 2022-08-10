{
  "properties" : { },
  "id" : "ea86f112ea404ecfa3759dd39c365f86",
  "script" : null,
  "groupId" : "1ad0fa99526749c48d5d951e835bfbd3",
  "name" : "列表",
  "createTime" : 1659495651744,
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
            permission: 'entity:create05:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/entity/create05/list',
            where: {
                className: {
                    label: '',
                    component: 'input'
                },
                createdTime: {
                    label: '',
                    component: 'input'
                },
                projectId: {
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
                    field: 'className',
                    label: ''
                },
                {
                    field: 'createdTime',
                    label: ''
                },
                {
                    field: 'projectId',
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
                            permission: 'entity:create05:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'entity:create05:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/entity/create05/delete',
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
              url: '/entity/create05/get'
            }
        },
        form: {
            request: {
                url: "/entity/create05/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'className',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'createdTime',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'projectId',
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