<template>
  <v-container>
    <v-card>
      <v-card-title> Client View</v-card-title>
      <v-card-text> {{ sampleData }} </v-card-text>
    </v-card>
  </v-container>
</template>
<script>
export default {
  components: {},
  data() {
    return {
      sampleData: 'Sample Data'
    }
  },
  setup() {},
  created() {},
  mounted() {},
  unmounted() {},
  methods: {}
}
</script>
