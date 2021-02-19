<template>
  <!-- main -->
  <v-container style="height: 1000px; max-width: 2400px;">
      <v-card v-for="memory in memorys" :key="memory.id" style="margin-top: 20px; margin-bottom: 20px;">
        <v-layout>
          <v-flex xs6>
            <!-- HTML あとから修正 -->
            <div>
              <iframe :src="url | embedVideo" allow="fullscreen"></iframe>
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

export default {
  name: 'MemoryHome',
  data: function () {
    return {
      memorys: "memorys",
      dialogDelete: false,
      url: "https://www.youtube.com/watch?v=Wdll9P9icJU"
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
  },
  filters: {
    embedVideo(url) {
        const matches = url.match(/(\/watch\?v=|youtu\.be\/)([^#&?/]+)/)
        if (!matches) return ''
        return 'https://www.youtube.com/embed/' + matches[2]
    }
  },
}
</script>
