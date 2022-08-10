{
  "properties" : { },
  "id" : "bdda17ec94834feebdfc4b34f5777fd2",
  "script" : null,
  "groupId" : "6dbd66c3a2e0440d942eb676c598c862",
  "name" : "列表",
  "createTime" : 1660032340785,
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
            permission: 'grow:auto7:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/grow/auto7/list',
            where: {
                name: {
                    label: '学生姓名',
                    component: 'input'
                },
                mark: {
                    label: '考试成绩',
                    component: 'input'
                },
                address: {
                    label: '学生籍贯',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'name',
                    label: '学生姓名'
                },
                {
                    field: 'mark',
                    label: '考试成绩'
                },
                {
                    field: 'address',
                    label: '学生籍贯'
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'grow:auto7:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'grow:auto7:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/grow/auto7/delete',
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
              url: '/grow/auto7/get'
            }
        },
        form: {
            request: {
                url: "/grow/auto7/save"
            },
            rows: [{
                gutter: 24,
                cols: [{
                    span: 12,
                    name: 'name',
                    label: '学生姓名',
                    component: 'input'
                },{
                    span: 12,
                    name: 'mark',
                    label: '考试成绩',
                    component: 'input'
                },{
                    span: 12,
                    name: 'address',
                    label: '学生籍贯',
                    component: 'input'
                }]
            }]
        }
    })
</script>