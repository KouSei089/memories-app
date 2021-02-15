import Vue          from 'vue'
import VueRouter    from 'vue-router'
import MemoryHome     from '../pages/MemoryHome.vue'

Vue.use(VueRouter)

const routes = [
  { path: '/',  name: 'MemoryHome', component: MemoryHome },
];

export default new VueRouter({ routes });
