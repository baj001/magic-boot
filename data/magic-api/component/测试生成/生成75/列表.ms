{
  "properties" : { },
  "id" : "e8aea41c5d0243cda507f43aea48b693",
  "script" : null,
  "groupId" : "73e0a2d3c2824a088fc9c43e88f6b69c",
  "name" : "列表",
  "createTime" : 1659949437676,
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
            permission: 'grow:75:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/grow/75/list',
            where: {
                id: {
                    label: '',
                    component: 'input'
                },
                name: {
                    label: '',
                    component: 'input'
                },
                phone: {
                    label: '',
                    component: 'input'
                },
                mark: {
                    label: '',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'id',
                    label: ''
                },
                {
                    field: 'name',
                    label: ''
                },
                {
                    field: 'phone',
                    label: ''
                },
                {
                    field: 'mark',
                    label: ''
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'grow:75:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'grow:75:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/grow/75/delete',
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
              url: '/grow/75/get'
            }
        },
        form: {
            request: {
                url: "/grow/75/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'id',
                    label: '',
                    component: 'input',
                    rules: [{ required: true, message: '请输入', trigger: 'change' }]
                },{
                    span: 12,
                    name: 'name',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'phone',
                    label: '',
                    component: 'input'
                },{
                    span: 12,
                    name: 'mark',
                    label: '',
                    component: 'input'
                }]
            }]
        }
    })
</script>