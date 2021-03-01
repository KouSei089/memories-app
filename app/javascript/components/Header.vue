<template>
  <v-toolbar color="blue-grey darken-4" dark>
    <v-toolbar-title>Memories App</v-toolbar-title>
    <v-spacer></v-spacer>
    <v-btn outlined style="margin:5px;">
      <router-link style="color:white;" to="/create">New Memory</router-link>
    </v-btn >
    <v-btn outlined style="margin:5px;">
      <router-link style="color:white;" to="/login">Login</router-link>
    </v-btn>
    <v-btn outlined style="margin:5px;">
      <router-link style="color:white;" to="/register">登録</router-link>
    </v-btn>
    <v-btn outlined style="margin:5px;">
      <router-link style="color:white;" to="/users">ユーザー</router-link>
    </v-btn>
  </v-toolbar>
</template>

<style scoped>
a {
  color: white;
  text-decoration: none;
}
</style>
