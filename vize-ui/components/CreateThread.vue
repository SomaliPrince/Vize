<script setup lang="ts">
async function createThread() {
  useFetch()
}
</script>

<template>
  <form class="create-thread-body" @submit="createThread">
    <div class="create-thread-title">
      <input class="create-thread-title-input" placeholder="title">
      <input class="create-thread-submit" type="submit" placeholder="submit">
    </div>
    <div class="create-thread-text">
      <textarea class="create-thread-text-input" placeholder="Commentary"/>
    </div>
  </form>
</template>

<style scoped lang="sass">
.create-thread-body
  width: 20rem
  margin: 1rem auto
  justify-content: center
  text-align: center

.create-thread-title
  display: flex
  align-items: center

.create-thread-title-input
  margin-right: 5px
  height: 1.5rem
  width: 75%

.create-thread-submit
  width: 25%

.create-thread-text-input
  height: 2rem

.create-thread-title-input, .create-thread-text-input
  width: 20rem
</style>