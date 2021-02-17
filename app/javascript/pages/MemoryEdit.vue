 <template>
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
  </template>
