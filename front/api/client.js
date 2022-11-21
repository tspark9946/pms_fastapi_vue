import http from './http'

export function getClients () {
  return http.get('/api/client')
}
