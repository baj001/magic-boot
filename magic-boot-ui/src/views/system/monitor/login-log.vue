<template>
  <div class="app-container">
    <mb-search :where="tableOptions.where" @search="reloadTable" />
    <mb-table ref="table" v-bind="tableOptions" />
  </div>
</template>

<script setup>
  import { ref, reactive } from 'vue'
  const table = ref()
  const tableOptions = reactive({
    url: '/system/log/login/list',
    where: {
      createDate: {
        component: 'date',
        label: '创建时间',
        props: {
          type: 'datetimerange'
        }
      }
    },
    cols: [
      {
        field: 'username',
        label: '登录名'
      },
      {
        field: 'failPassword',
        label: '失败密码'
      },
      {
        field: 'type',
        label: '登录状态',
        width: '100px',
        templet: (row) => {
          return row.type == '成功' ? '<b style="color: #409EFF">成功</b>' : '<b style="color: red">失败</b>'
        }
      },
      {
        field: 'address',
        label: '登录地址'
      },
      {
        field: 'ip',
        label: 'ip',
        width: '150px'
      },
      {
        field: 'browser',
        label: '浏览器'
      },
      {
        field: 'os',
        label: '系统',
        props: {
          "show-overflow-tooltip": true
        }
      },
      {
        field: 'createDate',
        label: '操作时间',
        width: '180px'
      }
    ]
  })
  function reloadTable(){
    table.value.reload()
  }
</script>
