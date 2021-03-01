<template>
  <v-container style="height: 1000px; max-width: 2400px;">
    <div>
      <p>User</p>
      <p>{{ users }}</p>
    </div>
</v-container>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      users: null,
    }
  },
  mounted: function() {
    this.fetchUsers();
  },
  methods: {
    fetchUsers() {
      axios.get('/api/users').then((res) => {
        this.users  = res.data 
      }, (error) => {
        console.log(error);
      });
    },
  }
}
</script>

