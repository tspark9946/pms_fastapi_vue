import Vue from 'vue'
import Router from 'vue-router'
import { normalizeURL, decode } from 'ufo'
import { interopDefault } from './utils'
import scrollBehavior from './router.scrollBehavior.js'

const _76f8fe7e = () => interopDefault(import('../views/pages/inspire.vue' /* webpackChunkName: "views/pages/inspire" */))
const _4c85e590 = () => interopDefault(import('../views/pages/login.vue' /* webpackChunkName: "views/pages/login" */))
const _fa437b0e = () => interopDefault(import('../views/pages/index.vue' /* webpackChunkName: "views/pages/index" */))

const emptyFn = () => {}

Vue.use(Router)

export const routerOptions = {
  mode: 'history',
  base: '/',
  linkActiveClass: 'nuxt-link-active',
  linkExactActiveClass: 'nuxt-link-exact-active',
  scrollBehavior,

  routes: [{
    path: "/inspire",
    component: _76f8fe7e,
    name: "inspire"
  }, {
    path: "/login",
    component: _4c85e590,
    name: "login"
  }, {
    path: "/",
    component: _fa437b0e,
    name: "index"
  }],

  fallback: false
}

export function createRouter (ssrContext, config) {
  const base = (config._app && config._app.basePath) || routerOptions.base
  const router = new Router({ ...routerOptions, base  })

  // TODO: remove in Nuxt 3
  const originalPush = router.push
  router.push = function push (location, onComplete = emptyFn, onAbort) {
    return originalPush.call(this, location, onComplete, onAbort)
  }

  const resolve = router.resolve.bind(router)
  router.resolve = (to, current, append) => {
    if (typeof to === 'string') {
      to = normalizeURL(to)
    }
    return resolve(to, current, append)
  }

  return router
}
