import { createRouter, createWebHistory } from 'vue-router'
// import UnderConstruction from '../views/UnderConstruction.vue'
import Home from '../views/Home.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  }
  // Temporarily disabled - Under Construction page
  // {
  //   path: '/',
  //   name: 'UnderConstruction',
  //   component: UnderConstruction
  // }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router

