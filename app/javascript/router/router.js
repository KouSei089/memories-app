import Vue from 'vue'
import Router from 'vue-router'
import MemoryHome from '../pages/MemoryHome.vue'
import MemoryCreate from '../pages/MemoryCreate.vue'
import MemoryEdit from '../pages/MemoryEdit.vue'

Vue.use(Router);

export default new Router({
  routes: [
    { 
      path: '/',
      name: 'MemoryHome',
      component: MemoryHome,
    },
    { 
      path: '/create', 
      name: 'MemoryCreate',
      component: MemoryCreate,
    },
    {
      path: '/edit/:id',
      name: 'MemoryEdit',
      component: MemoryEdit,
    },
  ]
});


