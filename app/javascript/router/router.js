import Vue from 'vue'
import Router from 'vue-router'
import MemoryHome from '../pages/MemoryHome.vue'
import MemoryCreate from '../pages/MemoryCreate.vue'
import MemoryEdit from '../pages/MemoryEdit.vue'
import Login from '../pages/Login.vue'
import Register from '../pages/Register.vue'
import User from '../pages/User.vue'

Vue.use(Router);

export default new Router({
  //mode: 'history',
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
    {
      path: '/login', 
      component: Login,
    },
    {
      path: '/register',
      component: Register,
    },
    {
      path: '/users',
      component: User,
    }
    
  ]
});


