<template>
  <v-container style="height: 1000px; max-width: 600px;">
    <v-card>
      <v-card-title class="headline blue-grey lighten-2 white--text">
        ログイン
      </v-card-title>
      <form>
        <v-text-field
          v-model="email"
          label="E-mail"
          required
          style="margin-bottom: 30px; margin:20px;"
        ></v-text-field>
        <v-text-field
          v-model="password"
          label="Password"
          required
          style="margin-bottom: 30px; margin:20px;"
        ></v-text-field>
        <v-btn
          class="mr-4"
          @click="login"
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
import axios from 'axios';

export default {
  data () {
    return {
      id: '',
      email: '',
      password: '',
    }
  },
  methods: {
    login(){
      axios.post('/api/sessions',{ email: this.email, password: this.password })
      .then((res) => {
        this.$router.push({ path: '/users'});
      }, (error) => {
        console.log(error);
      });
    }
  }
}
</script>

