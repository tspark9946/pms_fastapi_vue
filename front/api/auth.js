import http from './http'

// loginData: {
//   sign_email: '',
//   sign_password: ''
// }
export function login (loginData) {
  return http.post('/api/auth/login', loginData)
}

export async function testRequest () {
  const response = await http.get('/')

  return response
}
