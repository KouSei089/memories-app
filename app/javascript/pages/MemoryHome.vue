<template>
  <!-- main -->
  <v-container style="height: 1000px; max-width: 2400px;">
      <v-card v-for="memory in memorys" :key="memory.id" style="margin-top: 20px; margin-bottom: 20px;">
        <v-layout>
          <v-flex xs6>
            <!-- HTML あとから修正 -->
            <div>
              <youtube :video-id="url"></youtube>
            </div>
          </v-flex>
          <v-flex xs6>
            <v-card-title>{{ memory.title }}</v-card-title>
            <v-card-subtitle>{{ memory.emotion }}</v-card-subtitle>
            <v-card-text>{{ memory.description }}</v-card-text>
            <v-card-actions>
              <v-btn text color="red"><router-link :to="{ path: '/edit/' + memory.id }">Update</router-link></v-btn>
              <v-btn text color="gray" @click="deleteMemory(memory.id)">Delete</v-btn>
            </v-card-actions>
          </v-flex>

        </v-layout>
      </v-card>
  </v-container>
</template>

<script>
import axios from 'axios';
import VueYoutube from 'vue-youtube'
import Vue from 'vue'

/*var video_id = window.location.search.split('v=')[1];
var ampersandPosition = video_id.indexOf('&');
if(ampersandPosition != -1) {
  video_id = video_id.substring(0, ampersandPosition);
} */

Vue.use(VueYoutube)

export default {
  name: 'MemoryHome',
  data: function () {
    return {
      memorys: "memorys",
      dialogDelete: false,
      url: "Wdll9P9icJU"
    }
  },
  mounted: function() {
    this.fetchMemorys();
  },
  methods: {
    fetchMemorys() {
      axios.get('/api/memorys').then((res) => {
        this.memorys = res.data 
      }, (error) => {
        console.log(error);
      });
    },
    deleteMemory(id) {
      axios.delete('/api/memorys/' + id).then(res => {
        this.memorys = "memorys";
        this.fetchMemorys();
      });
    },
  }
}
</script>
