<template>
  <v-container style="height: 1000px; max-width: 600px;">
    <v-card>
      <v-card-title class="headline blue-grey lighten-2 white--text">
        登録
      </v-card-title>
      <form>
        <v-text-field
          v-model="user.name"
          label="Name"
          required
          style="margin-top:30px; margin-bottom: 30px; margin:20px;"
        ></v-text-field>
        <v-text-field
          v-model="user.email"
          label="E-mail"
          type="text"
          required
          style="margin-bottom: 30px; margin:20px;"
        ></v-text-field>
        <v-text-field
          v-model="user.password"
          label="Password"
          type="password"
          required
          style="margin-bottom: 30px; margin:20px;"
        ></v-text-field>
        <v-text-field
          v-model="user.password_confirmation"
          label="Password確認用"
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
export default {
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
      }
    }
  },
  methods: {
    register(){
      axios.post('/api/users', { user: this.user })
      .then((res) => {
        this.$router.push({ path: '/' });
      }, (error) => {
        console.log(error);
      });
    }
  }
}
</script>

