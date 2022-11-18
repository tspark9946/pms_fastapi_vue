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
import * as authApi from '@/api/auth'

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
      console.log(this.loginData.sign_email)
      console.log(this.loginData.sign_password)
      authApi.login(this.loginData.sign_email, this.loginData.sign_password)
        .then((response) => {
          // this.$store.commit('auth/setToken', response.data.Authorization)
          console.log(response.data.Authorization)
        })
        .catch(e => console.error(e))
    }
  }

}
</script>
