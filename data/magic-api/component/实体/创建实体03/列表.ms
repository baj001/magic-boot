{
  "properties" : { },
  "id" : "883afec721374f5f8cd5362308ae0b2d",
  "script" : null,
  "groupId" : "0c94f79999ce48788473eadacd3d6eb6",
  "name" : "列表",
  "createTime" : 1659406835247,
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
            permission: 'entity:create03:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/entity/create03/list',
            where: {
                projectId: {
                    label: '所属项目id',
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
                depict: {
                    label: '描述',
                    component: 'input'
                },
                createdTime: {
                    label: '创建时间',
                    component: 'date'
                },
                createdBy: {
                    label: '创建人',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'projectId',
                    label: '所属项目id'
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
                    field: 'depict',
                    label: '描述'
                },
                {
                    field: 'createdTime',
                    label: '创建时间'
                },
                {
                    field: 'createdBy',
                    label: '创建人'
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'entity:create03:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'entity:create03:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/entity/create03/delete',
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
              url: '/entity/create03/get'
            }
        },
        form: {
            request: {
                url: "/entity/create03/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'projectId',
                    label: '所属项目id',
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
                    name: 'depict',
                    label: '描述',
                    component: 'input'
                },{
                    span: 12,
                    name: 'createdTime',
                    label: '创建时间',
                    component: 'date'
                },{
                    span: 12,
                    name: 'createdBy',
                    label: '创建人',
                    component: 'input'
                }]
            }]
        }
    })
</script>