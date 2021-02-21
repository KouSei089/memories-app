<template>
  <!-- main -->
  <v-container style="height: 1000px; max-width: 2400px;">

    <v-text-field
      v-model="keyword"
      label="Sertch"
    ></v-text-field>
   
    <v-row>
      <v-col
        v-for="memory in filteredMemorys" 
        :key="memory.id"
        cols="6"
        md="4"
      >
        <v-card>
          <div>
            <iframe :src="memory.youtubeurl | embedVideo" allow="fullscreen"
            width="100%" height="235px"
            frameborder="0" style="border: none"
            ></iframe>
          </div>
          <v-card-title>{{ memory.title }}</v-card-title>
          <v-card-subtitle>{{ memory.emotion }}</v-card-subtitle>
          <v-card-text class="text--primary">{{ memory.description }}</v-card-text>
          <v-card-actions>
            <v-btn text>
              <!-- カラー変更 -->
              <router-link :to="{ path: '/edit/' + memory.id }">Update</router-link>
            </v-btn>
          <!-- 削除機能 -->
            <v-btn text color="pink" @click="toggleDelete(memory.id)">Delete
            </v-btn>  
          </v-card-actions>
        </v-card>

        <v-dialog v-model="dialogDelete" width="400">
          <v-card color="blue-grey darken-4">
            <v-spacer></v-spacer>
            <v-card-title></v-card-title>
            <v-card-text>
              <p style="color:white;">本当に削除してもよろしいですか？</p>
            </v-card-text>
            <v-divider></v-divider>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn text color="pink" @click="deleteMemory()">
                Completely deleted
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>

      </v-col>
    </v-row>

  </v-container>
</template>

<script>
import axios from 'axios';

export default {
  name: 'MemoryHome',
  data: function () {
    return {
      dialogDelete: false, 
      keyword: "",
      memorys: null,
    }
  },
  mounted: function() {
    this.fetchMemorys();
  },
  computed: {
    filteredMemorys: function() {
      return this.filterMemorys();
    }
  },
  methods: {
    fetchMemorys() {
      axios.get('/api/memorys').then((res) => {
        this.memorys  = res.data 
      }, (error) => {
        console.log(error);
      });
    },
    filterMemorys: function() {
      let filtered = [];
      for (let i in this.memorys) {
        let memory = this.memorys[i];
        if (memory.title.indexOf(this.keyword) !== -1) {
          filtered.push(memory);
        }
      }
      return filtered;
    },
    deleteMemory: function() {
      axios.delete('/api/memorys/' + this.id + '.json')
        .then(response => {
          this.fetchMemorys();
        }
      );
      this.dialogDelete = !this.dialogDelete
    },
    toggleDelete: function(id) {
      this.id = id
      this.dialogDelete = !this.dialogDelete
    },
    /*abstruct: function() {
      this.memorys = []
      for (i=0;i<this.allData.length;i++) {
        if((this.allData[i].emotion.indexOf(this.searchWord) !== -1) || (this.allData[i].title.indexOf(this.searchWord) !== -1) || (this.allData[i].description.indexOf(this.searchWord) !== -1)){
           this.memorys.push(this.allData[i])
        }
      }
    }*/
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

<style scoped>
a {
  color: white;
  text-decoration: none;
}
</style>
