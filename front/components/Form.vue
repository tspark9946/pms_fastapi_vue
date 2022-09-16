<template>
  <v-form ref="form">
    <v-text-field></v-text-field>
    <v-text-field label="Name"></v-text-field>
    <v-text-field label="E-mail"></v-text-field>
    <v-text-field label="Password"></v-text-field>

    <v-btn color="success" @click="submitUser({ id, name, email, password })">
      {{ id ? "Edit" : "Submit" }}
    </v-btn>
  </v-form>
</template>

<script>
export default {
  computed: {
    id: {
      get() {
        return this.$store.state.user.id;
      },
      set() {
        this.$store.commit("user/storeId", value);
      },
    },
    name: {
      get() {
        return this.$store.state.user.name;
      },
      set() {
        this.$store.commit("user/storeName", value);
      },
    },
    email: {
      get() {
        return this.$store.state.user.email;
      },
      set() {
        this.$store.commit("user/storeEmail", value);
      },
    },
    password: {
      get() {
        return this.$store.state.user.password;
      },
      set() {
        this.$store.commit("user/storePassword", value);
      },
    },
  },

  methods: {
    async submitUser(user) {
      this.$axios.get("http://localhost:8000").then((res) => {
        console.log(res.data);
      });
    },
    resetForm(user) {
      this.$store.commit("user/storeId", user.id);
      this.$store.commit("user/storeName", user.name);
      this.$store.commit("user/storeEmail", user.email);
      this.$store.commit("user/storePassword", user.password);
    },
  },
};
</script>

<style>
</style>