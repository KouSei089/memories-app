import Vue from 'vue'
import Vuetify from "vuetify"
import "vuetify/dist/vuetify.min.css"
import App from '../App.vue'
import Router from '../router/router.js'

Vue.use(Vuetify); 
const vuetify = new Vuetify(); 

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    vuetify,
    router: Router,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
