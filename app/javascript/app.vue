<template>
  <v-app id="app">

    <!-- header -->
    <v-toolbar color="blue-grey darken-4" dark>
      <v-toolbar-title>Memories App</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn flat @click="postModel()" color="blue-grey darken-2">New Memory</v-btn>
    </v-toolbar>

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
            <v-card-actions>
              <v-btn flat color="red" @click="putModel(memory.id)">Update</v-btn>
              <v-btn flat color="gray">Delete</v-btn>
            </v-card-actions>
          </v-flex>
        </v-layout>
      </v-card>

    <!-- ポップアップPOST -->
    <v-dialog v-model="dialogPostFlag" width="800" persistent>
      <v-card>
        <v-card-title class="headline blue-grey darken-4 white--text">
          Create Form
        </v-card-title>
        <v-text-field v-model="postTitle" label="Memory Title" required style='margin:20px; margin-top:30px'></v-text-field>
        <v-flex d-flex>
          <v-text-field v-model="postEmotion" label="Emotion" required style='margin:20px; margin-bottom:0px; margin-left:20px'></v-text-field>
        </v-flex>
        <v-card-text>
          <p>Memory</p>
          <div style="width:100%">
            <textarea  style='width:100%; height:300px; background-color:#efefef; padding:3px' v-model='postDescription'></textarea>
          </div>
        </v-card-text>

        <v-divider></v-divider>
        <v-card-actions>
          <v-btn color="#grey lighten-4" flat @click="postModel">Cancel</v-btn>
          <v-spacer></v-spacer>
          <v-btn color="blue-grey darken-2" flat @click="addMemory">Add Memory</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- Edit Form -->
    <v-dialog v-model="dialogPutFlag" width="800" persistent>
      <v-card>
        <v-card-title class="headline blue-grey darken-4 white--text">
          Edit Form
        </v-card-title>

        <v-text-field v-model="putTitle" label="Memory Title" required style='margin:20px; margin-top:30px'></v-text-field>
        <v-flex d-flex>
          <v-text-field v-model="putEmotion" label="Emotion" required style='margin:20px; margin-bottom:0px; margin-left:20px'></v-text-field>
        </v-flex>
        <v-card-text>
          <p>Memory</p>
          <div style='width:100%;'>
            <textarea style='width:100%; height:300px; background-color:#efefef; padding:3px' v-model='putDescription'></textarea>
          </div>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-btn color="#grey lighten-4" flat @click="putModel">Cancel</v-btn>
          <v-spacer></v-spacer>
          <v-btn color="blue-grey darken-2" flat @click="putMemory">Update Memory</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    </v-container>
  </v-app>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      memorys: "memorys",
      //create
      dialogPostFlag: false,
      postTitle: "",
      postEmotion: "",
      postDescription: "",
      //edit
      dialogPutFlag: false,
      putTitle: '',
      putEmotion: '',
      putDescription: '',
    }
  },
  mounted() {
    this.setMemory();
    this.putModel();
  },
  methods: {
    setMemory: function(id) {
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
    putModel: function(id) {
      axios.get("/api/memorys/" + id + ".json")
      .then(response => {
        this.putTitle = response.data.title
        this.putEmotion = response.data.emotion
        this.postDescription = response.data.description
      });
      this.id = id
      this.dialogPutFlag = !this.dialogPutFlag
    },
    putMemory: function() {
      axios.put("/api/memorys/" + this.id + ".json",{ 
        title: this.putTitle, emotion: this.putEmotion, description: this.putDescription})
       .then(response => {
         this.setMemory();
       });
       this.dialogPutFlag = !this.dialogPutFlag
    },
  }
}
</script>

<style scoped>


</style>
