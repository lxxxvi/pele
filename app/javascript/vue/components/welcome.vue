<template>
  <div>
    <h1>Welcome!!</h1>
    <button @click="signOut" class="py-2 px-4 bg-gray-300 hover:bg-gray-400 transition duration-500 ease-out">Sign out</button>
  </div>
</template>


<script>
export default {
  methods: {
    signOut: function() {
      this.$emit('signOutEvent')
    }
  }
}
</script>
