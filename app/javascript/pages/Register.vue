<template>
  <v-container style="height: 1000px; max-width: 600px;">
    <v-card>
      <v-card-title class="headline blue-grey lighten-2 white--text">
        登録
      </v-card-title>
      <form>
        <!--<v-text-field
          v-model="name"
          label="Name"
          required
          style="margin-top:30px; margin-bottom: 30px; margin:20px;"
        ></v-text-field> -->
        <v-text-field
          v-model="email"
          label="E-mail"
          type="text"
          required
          style="margin-bottom: 30px; margin:20px;"
        ></v-text-field>
        <v-text-field
          v-model="password"
          label="Password"
          type="password"
          required
          style="margin-bottom: 30px; margin:20px;"
        ></v-text-field>
        <v-btn
          class="mr-4"
          @click="register"
        >
          submit
        </v-btn>
        <v-btn>
          clear
        </v-btn>
      </form>
    </v-card>
  </v-container>
</template>

<script>
//import axios from '../packs/axios-auth';
import firebase from 'firebase'

export default {
  data() {
      return {
    //name: '',
    email: '',
    password: '',
    }
  },
  methods: {
    register() {
      firebase.auth().createUserWithEmailAndPassword(this.email, this.password)
        .then(user => {
          alert('Create account: ', user.email)
          this.$router.push('/')
        })
        .catch(error => {
          alert(error.message)
        })
    }
  }
}
</script>

