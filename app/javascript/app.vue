<template>
  <v-app id="app">

    <!-- header -->
    <v-toolbar color="blue-grey darken-4" dark>
      <v-toolbar-title>Memories App</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn flat color="blue-grey darken-2">New Memory</v-btn>
    </v-toolbar>

    <!-- POST 代用 -->
    <div>
      <input v-model="title" placeholder="title">
      <input v-model="emotion" placeholder="emotion">
      <input v-model="description" placeholder="description">
    </div>
    <button @click="addMemory">思い出を追加</button>

    <!-- main -->
    <v-container style="height: 1000px; max-width: 2400px;">
      <v-card v-for="memory in memorys" :key="memory.id" style="margin-top: 20px; margin-bottom: 20px;">
        <v-layout>
          <v-flex xs6>
            <!-- HTML あとから修正 -->
            <p>Youtube</p>
          </v-flex>
          <v-flex xs6>
            <v-card-title>{{ memory.title }}</v-card-title>
            <v-card-subtitle>{{ memory.emotion }}</v-card-subtitle>
            <v-card-text>{{ memory.description }}</v-card-text>
          </v-flex>
        </v-layout>
      </v-card>
    </v-container>
      
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
    this.setMemory();
  },
  methods: {
    setMemory: function() {
      axios.get('/api/memorys')
      .then(response => (
        this.memorys = response.data
      ))
    },
    addMemory: function() {
      axios.post('/api/memorys',{
        title: this.title,
        emotion: this.emotion,
        description: this.description
      })
      .then(response => (
        this.setMemory()
      ));
    }
  }
}
</script>

<style scoped>


</style>
