{
  "properties" : { },
  "id" : "65fcea4079e14ad79717e923812a5ad0",
  "script" : null,
  "groupId" : "686f48877bae42258fb5c8771a088907",
  "name" : "列表",
  "createTime" : 1660027573077,
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
            permission: 'grow:auto2:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/grow/auto2/list',
            where: {
                id: {
                    label: '主键id',
                    component: 'input'
                },
                name: {
                    label: '教师姓名',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'id',
                    label: '主键id'
                },
                {
                    field: 'name',
                    label: '教师姓名'
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'grow:auto2:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'grow:auto2:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/grow/auto2/delete',
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
              url: '/grow/auto2/get'
            }
        },
        form: {
            request: {
                url: "/grow/auto2/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'id',
                    label: '主键id',
                    component: 'input'
                },{
                    span: 12,
                    name: 'name',
                    label: '教师姓名',
                    component: 'input'
                }]
            }]
        }
    })
</script>