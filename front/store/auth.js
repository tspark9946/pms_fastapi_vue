import * as authApi from '@/api/auth'

export default {
  namespace: true,
  state: {
    token: null
  },
  mutations: {
    setToken (state, token) {
      state.token = token
    }
  },
  actions: {
    async login (context, loginData) {
      try {
        const response = await authApi.login(loginData)
        if (response.status === 200) {
          context.commit('setToken', response.data.Authorization)
        }
      } catch (error) {
        alert('아이디 혹은 비번을 확인하세요')
      }
    },

    loginWithoutAsync (context, loginData) {
      authApi.login(loginData).then((response) => {
        if (response.status === 200) {
          context.commit('setToken', response.data.Authorization)
        }
      }).catch((e) => {
        alert('아이디 혹은 비번을 확인하세요')
      })
    }
  }
}
