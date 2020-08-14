<template>
  <div class="input-errors">
    {{ errors[column] }}
  </div>
</template>

<script>
export default {
  props: {
    errors: Object,
    column: String
  }
}
</script>

<style scoped>
.input-errors {
  @apply text-red-400 text-sm mb-3;
}
</style>
