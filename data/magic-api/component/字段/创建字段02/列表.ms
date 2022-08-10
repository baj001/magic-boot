{
  "properties" : { },
  "id" : "5ce84e3931454c68bd1133cd9e4ab474",
  "script" : null,
  "groupId" : "7bc1a805e24b4966804cef3fb9b5d5f1",
  "name" : "列表",
  "createTime" : 1659408069075,
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
            permission: 'field:create02:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/field/create02/list',
            where: {
                projectId: {
                    label: '',
                    component: 'input'
                },
                entityId: {
                    label: '',
                    component: 'input'
                },
                jfieldName: {
                    label: '',
                    component: 'input'
                },
                fieldName: {
                    label: '',
                    component: 'input'
                },
                jfieldType: {
                    label: '',
                    component: 'input'
                },
                fieldType: {
                    label: '',
                    component: 'input'
                },
                fieldDesc: {
                    label: '',
                    component: 'input'
                },
                fieldLength: {
                    label: '',
                    component: 'input'
                },
                foreignEntityId: {
                    label: '',
                    component: 'input'
                },
                foreignFieldId: {
                    label: '',
                    component: 'input'
                },
                createdTime: {
                    label: '',
                    component: 'date'
                },
                createdBy: {
                    label: '',
                    component: 'input'
                },
                version: {
                    label: '',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'projectId',
                    label: ''
                },
                {
                    field: 'entityId',
                    label: ''
                },
                {
                    field: 'jfieldName',
                    label: ''
                },
                {
                    field: 'fieldName',
                    label: ''
                },
                {
                    field: 'jfieldType',
                    label: ''
                },
                {
                    field: 'fieldType',
                    label: ''
                },
                {
                    field: 'fieldDesc',
                    label: ''
                },
                {
                    field: 'fieldLength',
                    label: ''
                },
                {
                    field: 'foreignEntityId',
                    label: ''
                },
                {
                    field: 'foreignFieldId',
                    label: ''
                },
                {
                    field: 'createdTime',
                    label: ''
                },
                {
                    field: 'createdBy',
                    label: ''
                },
                {
                    field: 'version',
                    label: ''
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'field:create02:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'field:create02:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/field/create02/delete',
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
              url: '/field/create02/get'
            }
        },
        form: {
            request: {
                url: "/field/create02/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'projectId',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'entityId',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'jfieldName',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'fieldName',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'jfieldType',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'fieldType',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'fieldDesc',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'fieldLength',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'foreignEntityId',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'foreignFieldId',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'createdTime',
                    label: '',
                    component: 'date'
                },{
                    span: 12,
                    name: 'createdBy',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'version',
                    label: '',
                    component: 'input'
                }]
            }]
        }
    })
</script>