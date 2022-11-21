import * as clientsApi from '@/api/client'

export default {
  namespace: true,
  state: {
    list: []
  },

  mutations: {
    setList (state, clients) {
      state.list = clients
    }
  },

  actions: {
    async getClients (context) {
      try {
        const response = await clientsApi.getClients()
        if (response.status === 200) {
          console.log(response.data)
          context.commit('setList', response.data)
        }
      } catch (error) {
        alert('Client List update Failed')
      }
    }

  }
}
