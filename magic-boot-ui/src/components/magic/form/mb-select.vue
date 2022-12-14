<template>
  <el-select v-model="selectValue" v-bind="props.props" :multiple="multiple" :style="{ width }" :placeholder="placeholder || (itemLabel && '请输入' + itemLabel)" filterable clearable>
    <el-option
      v-for="item in selectList"
      :key="item.value"
      :label="item.label"
      :value="item.value"
    >
      <span style="float: left">{{ item.label }}</span>
      <span v-if="showValue" style="float: right;color: var(--el-text-color-secondary);font-size: 13px;">{{ item.value }}</span>
    </el-option>
  </el-select>
</template>

<script setup>

import { ref, watch, onMounted, getCurrentInstance } from 'vue'

const { proxy } = getCurrentInstance()

const emit = defineEmits(['update:modelValue', 'change'])

const props = defineProps({
  modelValue: {
    required: true
  },
  type: {
    type: String,
    default: ''
  },
  options: {
    type: Array,
    default: () => []
  },
  url: {
    type: String,
    default: ''
  },
  params: {
    type: Object,
    default: () => {}
  },
  labelField: {
    type: String,
    default: 'label'
  },
  valueField: {
    type: String,
    default: 'value'
  },
  props: {
    type: Object,
    default: () => {}
  },
  width: {
    type: String,
    default: '100%'
  },
  allOption: {
    type: Boolean,
    default: false
  },
  placeholder: {
    type: String,
    default: ''
  },
  itemLabel: String,
  multiple: {
    type: Boolean,
    default: false
  },
  join: {
    type: Boolean,
    default: true
  },
  showValue: {
    type: Boolean,
    default: false
  }
})

const selectList = ref([])
const selectValue = ref(props.multiple ? [] : '')

watch(() => [props.type, props.url, props.options], () => {
  loadData()
}, { deep: true })

watch(() => props.modelValue, (value) => {
  setValue(value)
})

watch(selectValue, (value) => {
  if(props.multiple && props.join){
    emit('update:modelValue', value.join(','))
    emit('change', value.join(','))
  }else{
    emit('update:modelValue', value)
    emit('change', value)
  }
})

onMounted(() => {
  loadData()
})

function setValue(value){
  if(props.multiple && props.join){
    selectValue.value = value ? value.split(',') : []
  }else{
    selectValue.value = value ? value.toString() : ''
  }
}

function loadData() {
  if(props.type){
    listConcat(proxy.$common.getDictType(props.type))
  }else if(props.url){
    proxy.$get(props.url, props.params).then(res => {
      listConcat(handlerData(res.data.list || res.data))
    })
  }else if(props.options && props.options.length > 0){
    listConcat(handlerData(props.options))
  }
}

function listConcat(dictData) {
  if (props.allOption) {
    selectList.value = [{
      value: '',
      label: '全部'
    }]
    selectList.value = selectList.value.concat(dictData)
  } else {
    selectList.value = dictData
  }
  setValue(props.modelValue)
}

function handlerData(data) {
  var newData = []
  data.forEach(it => {
    newData.push({
      label: it[props.labelField],
      value: it[props.valueField].toString()
    })
  })
  return newData
}

</script>
