<template>
  <v-app id="app">
    <v-toolbar color="red lighten-3" dark>
      <v-toolbar-title>Snippet App</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn flat>New Snippet</v-btn>
    </v-toolbar>
    <!--<p>{{ memorys }}</p>-->
  </v-app>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      memorys: "memorys"
    }
  },
  mounted() {
    this.setMemorys();
  },
  methods: {
    setMemorys: function() {
      axios.get('/api/memorys')
      .then(response => (
        this.memorys = response.data
      ))
    }
  }
}
</script>

<style scoped>

</style>
