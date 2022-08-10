{
  "properties" : { },
  "id" : "b242062a80824f2cb1aa419a818c385d",
  "script" : null,
  "groupId" : "ed8953882ef6488fa0e1a02e5cdcdabd",
  "name" : "列表",
  "createTime" : 1659593530530,
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
            permission: 'grow:16:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/grow/16/list',
            where: {
                name: {
                    label: '姓名',
                    component: 'input'
                },
                phone: {
                    label: '手机号',
                    component: 'input'
                },
                mark: {
                    label: '成绩',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'name',
                    label: '姓名'
                },
                {
                    field: 'phone',
                    label: '手机号'
                },
                {
                    field: 'mark',
                    label: '成绩'
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'grow:16:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'grow:16:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/grow/16/delete',
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
              url: '/grow/16/get'
            }
        },
        form: {
            request: {
                url: "/grow/16/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'name',
                    label: '姓名',
                    component: 'input'
                },{
                    span: 12,
                    name: 'phone',
                    label: '手机号',
                    component: 'input'
                },{
                    span: 12,
                    name: 'mark',
                    label: '成绩',
                    component: 'input'
                }]
            }]
        }
    })
</script>