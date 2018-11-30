import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/rest',
      name: 'REST',
      component: () => import(/* webpackChunkName: "rest" */ './views/REST.vue')
    },
    {
      path: '/sql',
      name: 'SQL',
      component: () => import(/* webpackChunkName: "sql" */ './views/SQL.vue')
    }
  ],
  scrollBehavior (to, from, savedPosition) {
    return { x: 0, y: 0 }
  }
})
