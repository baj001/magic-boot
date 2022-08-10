{
  "properties" : { },
  "id" : "a4fbfd06665e41ad83a2dc4065b86978",
  "script" : null,
  "groupId" : "40fc0254ac21412a992ab554d56c647e",
  "name" : "列表",
  "createTime" : 1659406321989,
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
            permission: 'entity:create:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/entity/create/list',
            where: {
                projectId: {
                    label: '所属项目id',
                    component: 'input'
                },
                className: {
                    label: '类名',
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
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'entity:create:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'entity:create:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/entity/create/delete',
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
              url: '/entity/create/get'
            }
        },
        form: {
            request: {
                url: "/entity/create/save"
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
                }]
            }]
        }
    })
</script>