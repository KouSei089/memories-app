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
            <v-card-title @click="setmemoryInfo(memory.id)">
              {{ memory.title }
            </v-card-title>

            <v-card v-show="memoryInfoBool">
              <v-card-title>{{ memoryInfo.title }}</v-card-title>
              <v-card-subtitle>{{ memoryInfo.emotion }}</v-card-subtitle>
              <v-card-text>{{ memoryInfo.description }}</v-card-text>
              <v-card-actions>
                <v-btn text color="red">Update</v-btn>
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
      memoryInfo: {},
      memoryInfoBool: false,
      memorys: [],
    }
  },
  mounted: function() {
    this.fetchMemorys();
  },
  methods: {
    fetchMemorys() {
      axios.get('/api/memorys').then((res) => {
        for(var i = 0; i < res.data.memorys.length; i++){
          this.memorys.push(res.data.memorys[i]);
        }
      }, (error) => {
        console.log(error);
      });
    },
    setMemoryInfo(id) {
      axios.get('/api/memorys/${id}.json').then(res => {
        this.memoryInfo = res.data;
        this.memoryInfoBool = true;
      });
    },
  }
}
</script>
