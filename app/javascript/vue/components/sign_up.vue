<template>
  <div id="sign-up">
    <label for="email">Email</label>
    <input type="text"
           name="email"
           v-model="email"
           @keyup.enter="signUpUser"/>
    <input-errors :errors="errors" column="email"></input-errors>

    <label for="password">Password</label>
    <input type="password"
           name="password"
           v-model="password"
           @keyup.enter="signUpUser"/>
    <input-errors :errors="errors" column="password"></input-errors>

    <button @click="signUpUser" class="my-4 w-32 bg-gray-300">Sign up</button>
  </div>
</template>


<script>

import InputErrors from './input_errors.vue'

export default {
  data: function() {
    return {
      email: "",
      password: "",
      errors: {},
    }
  },

  components: { InputErrors },

  methods: {
    signUpUser: function() {
      fetch('/graphql', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-CSRF-Token': document.querySelector(`meta[name="csrf-token"]`).content
        },
        body: JSON.stringify({ query: this.signUpUserQuery(), variables: this.signUpUserVariables() })
      })
        .then(r => r.json())
        .then(data => {
          if(data.data.signUpUser.errors.length > 0) {
            this.handleSignUpUserErrors(data.data.signUpUser.errors);
          } else {
            this.handleSuccess(data.data.signUpUser.email);
          }
        });

    },

    signUpUserQuery: function() {
      return `
        mutation signUpUser($input: SignUpUserInput!) {
          signUpUser(input: $input) {
            user {
              email
            }
            errors {
              attribute
              message
            }
          }
        }`
    },

    signUpUserVariables: function() {
      return {
        input: {
          userParams: {
            email: this.email,
            password: this.password
          }
        }
      }
    },

    handleSignUpUserErrors(errors) {
      const errorsByAttribute = errors.reduce((acc, curr) => {
        acc[curr.attribute] = curr.message;
        return acc;
      }, {});

      this.errors = errorsByAttribute;
    },

    handleSuccess(email) {
      console.log('emmiting')
      this.$emit('signInEvent', email);
    }
  }
}
</script>

<style scoped>
label {
  @apply block text-gray-700 text-sm tracking-wide mt-2;
}
input {
  @apply border block;
}

button[disabled] {
  @apply text-gray-600 bg-gray-200;
}
</style>
