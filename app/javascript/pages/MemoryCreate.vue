<template>
  <!-- ポップアップPOST -->
  <v-container style="height: 1000px; max-width: 2400px;">
      <v-card>
        <v-card-title class="headline blue-grey darken-4 white--text">
          Create Form
        </v-card-title>
        <v-text-field v-model="memory.title" label="Memory Title" required style='margin:20px; margin-top:30px'></v-text-field>
        <v-flex d-flex>
          <v-text-field v-model="memory.emotion" label="Emotion" required style='margin:20px; margin-bottom:0px; margin-left:20px'></v-text-field>
        </v-flex>
        <v-card-text>
          <p>Memory</p>
          <div style="width:100%">
            <textarea  style='width:100%; height:300px; background-color:#efefef; padding:3px' v-model='memory.description'></textarea>
          </div>
        </v-card-text>
        <v-text-field v-model="memory.youtubeurl" label="Youtube URL" required style='margin:20px; margin-top:30px'></v-text-field>


        <v-divider></v-divider>
        <v-card-actions>
          <v-btn color="#grey lighten-4">Cancel</v-btn>
          <v-spacer></v-spacer>
          <v-btn color="blue-grey darken-2" @click="createMemory">Add Memory</v-btn>
        </v-card-actions>
      </v-card>
  </v-container>
</template>

<script>
import axios from 'axios';
export default {
  data: function() {
    return {
      memory: {
        title: '',
        emotion: '',
        description: '',
        youtubeurl: '',
      }
    }
  },
  methods: {
    createMemory() {
      axios.post('/api/memorys', { memory: this.memory })
      .then((res) => {
        this.$router.push({ path: '/' });
      }, (error) => {
        console.log(error);
      });
    }
  }
}
</script>
