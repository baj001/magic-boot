{
  "properties" : { },
  "id" : "c178ef796fec4668bc12049cde962bae",
  "script" : null,
  "groupId" : "c2035227fab54d70a03972d751fb6b9a",
  "name" : "列表",
  "createTime" : 1660029579880,
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
            permission: 'grow:auto5:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/grow/auto5/list',
            where: {
                name: {
                    label: '教师姓名',
                    component: 'input'
                },
                age: {
                    label: '年龄',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'name',
                    label: '教师姓名'
                },
                {
                    field: 'age',
                    label: '年龄'
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'grow:auto5:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'grow:auto5:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/grow/auto5/delete',
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
              url: '/grow/auto5/get'
            }
        },
        form: {
            request: {
                url: "/grow/auto5/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'name',
                    label: '教师姓名',
                    component: 'input'
                },{
                    span: 12,
                    name: 'age',
                    label: '年龄',
                    component: 'input'
                }]
            }]
        }
    })
</script>