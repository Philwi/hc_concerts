import { createRouter, createWebHistory } from 'vue-router'
import ConcertsPage from '@/views/Concerts.vue'
import AddConcertPage from '@/views/AddConcert.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'concerts',
      component: ConcertsPage
    },
    {
      path: '/add',
      name: 'addConcert',
      component: AddConcertPage
    }
    // {
    //   path: '/',
    //   name: 'home',
    //   component: HomeView
    // },
    // {
    //   path: '/about',
    //   name: 'about',
    //   // route level code-splitting
    //   // this generates a separate chunk (About.[hash].js) for this route
    //   // which is lazy-loaded when the route is visited.
    //   component: () => import('../views/AboutView.vue')
    // }
  ]
})

export default router
