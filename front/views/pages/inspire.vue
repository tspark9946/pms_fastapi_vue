<template>
  <v-row>
    <v-col class="text-center">
      <img
        src="/v.png"
        alt="Vuetify.js"
        class="mb-5"
      >
      <v-card>
        <fa icon="download" size="lg" :style="{ color: 'red'}" />
        <fa :icon="['fas', 'download']" />
        <fa :icon="['far', 'star']" />
        <fa :icon="['fab', 'twitter']" />

        <v-btn
          color="blue lighten-1 text-capitalize"
          depressed
          large
          block
          dark
          @click.prevent="testRequest"
        >
          Sever test
        </v-btn>
        <v-btn
          color="blue lighten-1 text-capitalize"
          depressed
          large
          block
          dark
          @click.prevent="requestClient"
        >
          Request Clients
        </v-btn>
      </v-card>
      <p1> {{ title }} </p1>
      <ul id="clienttest">
        <li v-for="(client) in clientlist" :key="client.client_id">
          {{ client.client_name }}
        </li>
      </ul>
      <blockquote class="blockquote">
        &#8220;First, solve the problem. Then, write the code.&#8221;
        <footer>
          <small>
            <em>&mdash;John Johnson</em>
          </small>
        </footer>
      </blockquote>
    </v-col>
  </v-row>
</template>

<script>
// import { mapMutations } from 'vuex'
import * as authApi from '@/api/auth'

export default {
  name: 'InspirePage',
  data: () => {
    return {
      title: '고객목록'

    }
  },
  computed: {
    clientlist () {
      return this.$store.state.client.list
    }
  },
  methods: {
    testRequest () {
      authApi.testRequest()
        .then((response) => {
          console.log(response.data)
        })
        .catch(e => console.error(e))
    },

    requestClient () {
      this.$store.dispatch('client/getClients')
      console.log(this.$store.state.client.list)
    }
  }

}
</script>
