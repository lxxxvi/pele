<template>
  <div id="app">
    <sign-up v-if="!signedIn" @signInEvent="signIn"></sign-up>
    <welcome v-if="signedIn" @signOutEvent="signOut"></welcome>
  </div>
</template>

<script>
import SignUp from './sign_up.vue'
import Welcome from './welcome.vue'

export default {
  data: function() {
    return {
      signedIn: this.isSignedIn()
    }
  },

  components: {
    SignUp,
    Welcome
  },

  methods: {
    signIn: function(email) {
      sessionStorage.setItem('email', email);
      this.signedIn = this.isSignedIn();
    },

    signOut: function() {
      sessionStorage.removeItem('email');
      this.signedIn = this.isSignedIn();
    },

    isSignedIn: function() {
      return sessionStorage.getItem('email') != null
    }
  }

}
</script>
