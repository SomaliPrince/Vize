import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '@/views/Home-view.vue'
import BoardView from '@/views/Board-view.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/:code',
      name: 'Board',
      component: BoardView,
      props: true,
    },
  ],
})

export default router
