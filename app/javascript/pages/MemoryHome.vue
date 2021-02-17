<template>
  <!-- main -->
  <v-container style="height: 1000px; max-width: 2400px;">
      <v-card v-for="memory in memorys" :key="memory.id" style="margin-top: 20px; margin-bottom: 20px;">
        <v-layout>
          <v-flex xs6>
            <!-- HTML あとから修正 -->
            <p>Youtube</p>
          </v-flex>
          <v-flex xs6>
            <v-card>
              <v-card-title>{{ memory.title }}</v-card-title>
              <v-card-subtitle>{{ memory.emotion }}</v-card-subtitle>
              <v-card-text>{{ memory.description }}</v-card-text>
              <v-card-actions>
                <v-btn text color="red"><router-link :to="{ path: '/edit/' + memory.id }">Update</router-link></v-btn>
                <v-btn text color="gray">Delete</v-btn>
              </v-card-actions>
            </v-card>
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
      memoryEd: {},
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
    /*setMemoryInfo(id) {
      axios.get('/api/memorys/' + id + '.json').then(res => {
        this.memoryEd = res.data;
     });
    },*/
  }
}
</script>
