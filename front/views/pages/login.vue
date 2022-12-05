<template>
  <v-app id="inspire">
    <v-main class="blue-grey lighten-4">
      <!-- Login Component -->
      <v-container style="max-width: 450px" fill-height>
        <v-layout align-center row wrap>
          <v-flex xs12>
            <v-card>
              <div class="pa-10">
                <h1 style="text-align: center" class="mb-10">
                  Login
                </h1>
                <form>
                  <v-text-field
                    v-model="loginData.sign_email"
                    label="E-mail"
                    prepend-inner-icon="mdi-account"
                  />
                  <v-text-field
                    v-model="loginData.sign_password"
                    prepend-inner-icon="mdi-lock"
                    type="password"
                    label="Password"
                  />
                  <v-btn
                    type="submit"
                    color="blue lighten-1 text-capitalize"
                    depressed
                    large
                    block
                    dark
                    class="mb-3"
                    @click.prevent="requestLogin"
                  >
                    Login
                  </v-btn>
                  <v-btn
                    color="blue lighten-1 text-capitalize"
                    depressed
                    large
                    block
                    dark
                  >
                    Sign Up
                  </v-btn>
                </form>
              </div>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>

export default {
  name: 'LoginPage',
  data: () => ({
    loginData: {
      sign_email: '',
      sign_password: ''
    }

  }),
  methods: {
    requestLogin () {
      for (let i = 0; i <= 10; i++) {
        console.log('test')
      }
      this.$store.dispatch('auth/login', this.loginData)
    }
  }

}
</script>
