<template>
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
          <v-card-actions>
            <v-btn flat color="red" @click="putMemory">Update</v-btn>
            <v-btn flat color="gray">Delete</v-btn>
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
      memory: {},
      //memoryInfoBool: false,
      memorys: [],
    }
  },
  mounted: function() {
    this.fetchMemorys();
  },
  methods: {
    fetchMemorys() {
      axios.get('/api/memorys').then((response) => {
        for(var i = 0; i < response.data.memorys.length; i++) {
          this.memorys.push(response.data.memorys[i]);
        }
      }, (error) => {
        console.log(error);
      }); 
    },
    setMemoryInfo(id){
      axios.get('api/memorys/${id}.json').then(response => {
        this.memoryInfo = response.data;
        this.memoryInfoBool = true;
      });
    }
  }
}

      /*memorys: "memorys",
      create
      dialogPostFlag: false,
      postTitle: "",
      postEmotion: "",
      postDescription: "",
      edit
      dialogPutFlag: false,
      putTitle: '',
      putEmotion: '',
      putDescription: '',
    }
  },
  mounted() {
    this.putModel();
    this.setMemory();
  },
  methods: {
    setMemory: function() {
      axios.get('/api/memorys')
      .then(response => (
        this.memorys = response.data
      ))
    },
    postModel: function() {
      this.dialogPostFlag = !this.dialogPostFlag
    },
    addMemory: function() {
      axios.post('/api/memorys',{
        title: this.postTitle,
        emotion: this.postEmotion,
        description: this.postDescription
      })
      .then(response => {
        this.setMemory();
        this.postTitle = ""
        this.postEmotion = ""
        this.postDescription = ""
      });
      this.dialogPostFlag = !this.dialogPostFlag
    },
    putModel: function() {
      axios.get("/api/memorys/${this.$route.params.id}.json")
      .then(response => 
        (this.memory = response.data)
      )},
      //編集ポップアップ
      //this.dialogPutFlag = !this.dialogPutFlag
    //},
    putMemory: function() {
      axios.put('/api/memorys/${this.$route.params.id}',{ memory: this.memory})
       .then(response => {
         this.setMemory();
       });
       this.dialogPutFlag = !this.dialogPutFlag
    },
  }
}*/
</script>


