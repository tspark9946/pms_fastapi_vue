<template>
  <v-row>
    <v-col class="text-center">
      <img
        src="/v.png"
        alt="Vuetify.js"
        class="mb-5"
      >
      <v-card>
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
      </v-card>
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
import * as authApi from '@/api/auth'

export default {
  name: 'InspirePage',
  methods: {
    testRequest () {
      authApi.testRequest()
        .then((response) => {
          console.log(response.data)
        })
        .catch(e => console.error(e))
    }
  }

}
</script>
