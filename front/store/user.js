export const state = () => ({
  id: 0,
  name: "",
  email: "",
  password: ""
})

export const mutations = {
  storeId: (state, data) => {
    state.id = data
  },
  storeName: (state, data) => {
    state.id = data
  },
  storeEmail: (state, data) => {
    state.id = data
  },
  storePassword: (state, data) => {
    state.id = data
  }

}