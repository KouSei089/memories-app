import Vue from 'vue'
import App from '../app.vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

Vue.use(Vuetify);

new Vue({
  Vuetify,
  render: h => h(App)
}).$mount('#app')
