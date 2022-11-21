export default {
  namespace: true,
  state: {
    validations: {}
  },
  mutations: {
    setValidationError (state, error) {
      state.validations = error
    }
  }
}
