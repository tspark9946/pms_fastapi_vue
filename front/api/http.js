import axios from 'axios'

// js 파일에서 store에 접근할 수 없어서 plugins init파일을 등록해서 사용
// 1. 선두에 init function 추가
// 2. plugins 폴더에 init.js 파일 생성
// 3. nuxt.config.js -> plugins에 init.js 추가
// 참고영상 : youtube 개발레시피 vue axios
let store
export function init (context) {
  store = context.store
}

const instance = axios.create({
  baseURL: process.env.VUE_APP_API
})

instance.interceptors.request.use(function (config) {
  if (store.state.auth.token !== null) {
    config.headers = {
      Authorization: store.state.auth.token
    }
  }

  return config
})

instance.interceptors.response.use(function (response) {
  store.commit('error/setValidationError', {})

  return response
}, function (errors) {
  console.log(errors.response)
  console.log(errors.response.status)
  const status = Number(errors.response.status)
  if (status === 422) {
    store.commit('error/setValidationError', errors.response.data.detail)
  } else {
    return Promise.reject(errors)
  }
})

export default instance
