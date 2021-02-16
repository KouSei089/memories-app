import Vue from 'vue'
import Router from 'vue-router'
import MemoryHome from '../pages/MemoryHome.vue'

Vue.use(Router);

export default new Router({
  routes: [
    { 
      path: '/',
      component: MemoryHome,
    },

  ]
});


