import Vue from 'vue'
import Vuetify from "vuetify"
import "vuetify/dist/vuetify.min.css"
import App from '../app.vue'
import router from '../router/router.js'
//import axios from 'axios'
import firebase from 'firebase'

Vue.use(Vuetify); 
const vuetify = new Vuetify(); 

const config = {
  apiKey:'AIzaSyAV0VfU3gcMoWHEejm5VFpfRQPLrC1u4os',
  authDomain: 'YOUR_DOMAIN.firebaseapp.com',
  databaseURL: 'YOUR_DOMAIN.firebaseio.com',
  projectId: 'YOUR_ID',
  storageBucket: 'YOUR_BUCKET_ID.appspot.com',
  messagingSenderId: 'YOUR_SENDER_ID'
}
firebase.initializeApp(config);

//axios.defaults.baseURL = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]"

//リクエストとレスポンスのときになにか事前に処理をする.
/*axios.interceptors.request.use(
  config => {
    return config;
  },
  error => {
    return Promise.reject(error)
  }
);
axios.interceptors.response.use(
  config => {
    return config;
  },
  error => {
    return Promise.reject(error)
  }
);

axios.interceptors.request.eject(); */

//いつ使うか? 別のファイルで管理する.

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    vuetify,
    router,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
