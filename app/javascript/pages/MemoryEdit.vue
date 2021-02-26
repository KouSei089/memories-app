 <template>
 <!-- Edit Form -->
    <v-container style="height: 1000px; max-width: 2400px;">
      <v-card>
        <v-card-title class="headline blue-grey darken-4 white--text">
          Edit Form
        </v-card-title>

        <v-text-field v-model="memory.title" label="Memory Title" required style='margin:20px; margin-top:30px'></v-text-field>
        <v-flex d-flex>
          <v-text-field v-model="memory.emotion" label="Emotion" required style='margin:20px; margin-bottom:0px; margin-left:20px'></v-text-field>
        </v-flex>
        <v-card-text>
          <p>Memory</p>
          <div style='width:100%;'>
            <textarea style='width:100%; height:300px; background-color:#efefef; padding:3px' v-model='memory.description'></textarea>
          </div>
        </v-card-text>
        <v-text-field v-model="memory.youtubeurl" label="Youtube URL" required style='margin:20px; margin-top:30px'></v-text-field>
        <v-text-field v-model="memory.artist" label="Artist" required style='margin:20px; margin-top:30px'></v-text-field>
        <v-text-field v-model="memory.song" label="Song" required style='margin:20px; margin-top:30px'></v-text-field>

        <v-divider></v-divider>

        <v-card-actions>
          <v-btn color="#grey lighten-4" text>Cancel</v-btn>
          <v-spacer></v-spacer>
          <v-btn color="blue-grey darken-2" text @click="updateMemory(id)">Update Memory</v-btn>
        </v-card-actions>
      </v-card>
    </v-container>
</template>

<script>
import axios from "axios";
export default {
  name: 'MemoryEdit',
  data: function() {
    return {
      id: this.$route.params.id,
      memory: {
        id: '',
        title: '',
        emotion: '',
        description: '',
        youtubeurl: '',
        artist: '',
        song: '',
      },
    }
  },
  mounted: function() {
    this.setMemoryEdit(this.id);
  },
  methods: {
    setMemoryEdit(id){
      axios.get('/api/memorys/'+ id +'.json').then( res => {
        this.memory.id = res.data.id;
        this.memory.title = res.data.title;
        this.memory.emotion = res.data.emotion;
        this.memory.description = res.data.description;
        this.memory.youtubeurl = res.data.youtubeurl;
        this.memory.artist = res.data.artist;
        this.memory.song = res.data.song;
      });
    },
    updateMemory(id) {
      axios.put('/api/memorys/'+ id, { memory: this.memory }).then((res) => {
        this.$router.push({ path: '/' });
      }, (error) => {
        console.log(error);
      });
    },
  }
}
</script>
