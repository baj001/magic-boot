{
  "properties" : { },
  "id" : "6d72205eccb3497e95e2cbd83ae58683",
  "script" : null,
  "groupId" : "10cab9a000024a6aafc7da54ac441401",
  "name" : "列表",
  "createTime" : 1659408524121,
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
            permission: 'field:create01:save',
            click: () => {
                magicFormTitle.value = '添加'
                formDialog.value.show()
            }
        }],
        table: {
            url: '/field/create01/list',
            where: {
                projectId: {
                    label: '所属项目id',
                    component: 'input'
                },
                entityId: {
                    label: '所属实体id',
                    component: 'input'
                },
                jfieldName: {
                    label: '实体字段名称',
                    component: 'input'
                },
                fieldName: {
                    label: '表字段名称',
                    component: 'input'
                },
                jfieldType: {
                    label: '实体字段类型',
                    component: 'input'
                },
                fieldType: {
                    label: '表字段类型',
                    component: 'input'
                },
                fieldDesc: {
                    label: '描述',
                    component: 'input'
                },
                fieldLength: {
                    label: '表字段长度',
                    component: 'input'
                },
                foreignEntityId: {
                    label: '外键实体id',
                    component: 'input'
                },
                foreignFieldId: {
                    label: '外键字段id',
                    component: 'input'
                },
                createdTime: {
                    label: '创建时间',
                    component: 'date'
                },
                createdBy: {
                    label: '创建人',
                    component: 'input'
                },
                version: {
                    label: '乐观锁版本号',
                    component: 'input'
                },
                foreignKey: {
                    label: '是否外键(1:是 0:否)',
                    component: 'input'
                }
            },
            cols: [
                {
                    field: 'projectId',
                    label: '所属项目id'
                },
                {
                    field: 'entityId',
                    label: '所属实体id'
                },
                {
                    field: 'jfieldName',
                    label: '实体字段名称'
                },
                {
                    field: 'fieldName',
                    label: '表字段名称'
                },
                {
                    field: 'jfieldType',
                    label: '实体字段类型'
                },
                {
                    field: 'fieldType',
                    label: '表字段类型'
                },
                {
                    field: 'fieldDesc',
                    label: '描述'
                },
                {
                    field: 'fieldLength',
                    label: '表字段长度'
                },
                {
                    field: 'foreignEntityId',
                    label: '外键实体id'
                },
                {
                    field: 'foreignFieldId',
                    label: '外键字段id'
                },
                {
                    field: 'createdTime',
                    label: '创建时间'
                },
                {
                    field: 'createdBy',
                    label: '创建人'
                },
                {
                    field: 'version',
                    label: '乐观锁版本号'
                },
                {
                    field: 'foreignKey',
                    label: '是否外键(1:是 0:否)'
                },{
                    label: '操作',
                    type: 'btns',
                    width: 140,
                    fixed: 'right',
                    btns: [
                        {
                            permission: 'field:create01:save',
                            label: '修改',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconEdit',
                            click: (row) => {
                                magicFormTitle.value = '修改'
                                formDialog.value.show(() => magicForm.value.getDetail(row.id))
                            }
                        }, {
                            permission: 'field:create01:delete',
                            label: '删除',
                            type: 'primary',
                            link: true,
                            icon: 'ElIconDelete',
                            click: (row) => {
                                proxy.$common.handleDelete({
                                    url: '/field/create01/delete',
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
              url: '/field/create01/get'
            }
        },
        form: {
            request: {
                url: "/field/create01/save"
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
                    name: 'entityId',
                    label: '所属实体id',
                    component: 'input'
                },{
                    span: 12,
                    name: 'jfieldName',
                    label: '实体字段名称',
                    component: 'input'
                },{
                    span: 12,
                    name: 'fieldName',
                    label: '表字段名称',
                    component: 'input'
                },{
                    span: 12,
                    name: 'jfieldType',
                    label: '实体字段类型',
                    component: 'input'
                },{
                    span: 12,
                    name: 'fieldType',
                    label: '表字段类型',
                    component: 'input'
                },{
                    span: 12,
                    name: 'fieldDesc',
                    label: '描述',
                    component: 'input'
                },{
                    span: 12,
                    name: 'fieldLength',
                    label: '表字段长度',
                    component: 'input'
                },{
                    span: 12,
                    name: 'foreignEntityId',
                    label: '外键实体id',
                    component: 'input'
                },{
                    span: 12,
                    name: 'foreignFieldId',
                    label: '外键字段id',
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
                },{
                    span: 12,
                    name: 'version',
                    label: '乐观锁版本号',
                    component: 'input'
                },{
                    span: 12,
                    name: 'foreignKey',
                    label: '是否外键(1:是 0:否)',
                    component: 'input'
                }]
            }]
        }
    })
</script>