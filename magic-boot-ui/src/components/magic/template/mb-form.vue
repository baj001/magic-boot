<template>
  <el-form
    ref="dataForm"
    :rules="rules"
    :model="formData"
    v-bind="form.props"
  >
    <el-row v-for="(row,i) in form.rows" :key="i" :gutter="row.gutter">
      <el-col v-for="(col,j) in row.cols" :key="j" :span="col.span" v-bind="col.colProps">
        <el-form-item :label="col.label" :label-width="col.labelWidth" :prop="col.name" v-bind="col.formItemProps">
          <component
            :is="!col.component ? 'mb-input' : col.component.startsWith('el-') || $global.dynamicComponentNames.indexOf(col.component) != -1 ? col.component : 'mb-' + col.component"
            v-model="formData[col.name]"
            :item-label="col.label"
            v-bind="col.props"
          />
        </el-form-item>
      </el-col>
    </el-row>
  </el-form>
</template>

<script setup>
  import {ref, reactive, getCurrentInstance } from 'vue'
  const { proxy } = getCurrentInstance()
  const rules = reactive(getRules())
  const formData = ref(initFormData())
  const dataForm = ref()
  const props = defineProps({
    form: {
      type: Object,
      default: () => {}
    },
    detail: {
      type: Object,
      default: () => {}
    },
    primaryField: {
      type: String,
      default: 'id'
    }
  })
  const emit = defineEmits(['reload'])

  props.form.props = props.form.props || {}
  proxy.$common.setDefaultValue(props.form.props, 'labelPosition', 'right')
  proxy.$common.setDefaultValue(props.form.props, 'labelWidth', '120px')

  if(props.detail && props.detail.formData){
    if(props.detail.handlerFormData){
      props.detail.handlerFormData(props.detail.formData)
    }
    formData.value = props.detail.formData
  }

  if(props.detail && props.detail.request){

  }

  function getRules(){
    var _rules = {}
    props.form.rows.forEach(row => {
      row.cols.forEach(col => {
        if (col.rules) {
          _rules[col.name] = col.rules
        }
      })
    })
    return _rules
  }

  function initFormData() {
    var data = {}
    props.form.rows.forEach(row => {
      row.cols.forEach(col => {
        data[col.name] = col.defaultValue || undefined
      })
    })
    return data
  }

  function getFormData(){
    return formData.value
  }

  function save(d) {
    dataForm.value.validate((valid) => {
      if (valid) {
        d.loading()
        proxy.$post(props.form.request.url, formData.value).then(res => {
          d.hideLoading()
          proxy.$notify({
            title: '??????',
            message: (!formData.value[props.primaryField] ? '??????' : '??????') + '??????',
            type: 'success',
            duration: 2000
          })
          if(props.detail && props.detail.formData){
            props.detail.formData = {}
          }
          d.hide()
          emit('reload')
        }).catch(() => d.hideLoading())
      }
    })
  }

  function getDetail(id) {
    formData.value[props.primaryField] = id
    proxy.$get(props.detail.request.url, { [props.primaryField]: id }).then(res => {
      const { data } = res
      for (var t in formData.value) {
        if (data[t] && (!props.detail.excludeAssign || props.detail.excludeAssign.indexOf(t) === -1)) {
          formData.value[t] = data[t]
        }
      }
    })
  }

  defineExpose({ save, getDetail, getFormData })

</script>
