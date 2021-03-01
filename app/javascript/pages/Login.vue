<template>
  <v-container style="height: 1000px; max-width: 600px;">
    <v-card>
      <v-card-title class="headline blue-grey lighten-2 white--text">
        ログイン
      </v-card-title>
      <form>
        <v-text-field
          v-model="name"
          label="Name"
          required
          style="margin-top:30px; margin-bottom: 30px; margin:20px;"
        ></v-text-field>
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
  data () {
    return {
    }
  },
}
</script>

