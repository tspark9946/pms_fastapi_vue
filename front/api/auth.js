import http from './http'

let store
export function init (context) {
  store = context.store
}

export async function login (email, password) {
  const loginData = {
    sign_email: email,
    sign_password: password
  }
  const response = await http.post('/api/auth/login', loginData)

  if (response.status === 200) {
    store.commit('auth/setToken', response.data.Authorization)
  }

  return response
}

export async function testRequest () {
  const response = await http.get('/')

  return response
}
