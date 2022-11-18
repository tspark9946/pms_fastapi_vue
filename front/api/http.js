import axios from 'axios'

// js 파일에서 store에 접근할 수 없어서 plugins init파일을 등록해서 사용
// 1. 선두에 init function 추가
// 2. plugins 폴더에 init.js 파일 생성
// 3. nuxt.config.js -> plugins에 init.js 추가
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

export default instance
