<template>
  <div id="sign-up">
    <label for="email">Email</label>
    <input type="text"
           name="email"
           @keyup="checkAndEnableButton"
           v-model="email" />

    <label for="password">Password</label>
    <input type="password"
           name="password"
           @keyup="checkAndEnableButton"
           v-model="password" />

    <button :disabled="buttonDisabled"
            @click="signUp" class="my-4 w-32 bg-gray-300">Sign up</button>
  </div>
</template>


<script>
function getDefaultData() {
  return {
    email: "",
    password: "",
    buttonDisabled: "disabled"
  }
}

export default {
  data: getDefaultData,
  methods: {
    checkAndEnableButton: function() {
      this.enableButton(this.emailAndPasswordsGiven())
    },
    enableButton: function(boolean) {
      if (boolean) {
        this.buttonDisabled = null
      } else {
        this.buttonDisabled = 'disabled'
      }
    },
    emailAndPasswordsGiven: function() {
      return this.email.length > 0 && this.password.length > 0;
    },
    signUp: function() {
      console.log('todo', this.$data);
    }
  }
}
</script>

<style scoped>
input {
  @apply border block;
}

button[disabled] {
  @apply text-gray-600 bg-gray-200;
}
</style>
