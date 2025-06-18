<script setup>
const size = Array.from({length: 8}, (_, i) => i + 1);
const props = defineProps({
  message: String,
})
</script>

<template>
  <div class="thread-body">
    <img class="thread-img" src="https://picsum.photos/400/300" alt="Random image">
    <div class="thread-text">
      <b class="thread-title">{{ message }}:&nbsp;</b>
      <div class="teaser">My UK visa application got rejected</div>
    </div>
  </div>
</template>

<style scoped lang="sass">
.thread-body
  width: 10rem
  max-height: 15rem
  display: inline-block
  word-wrap: break-word
  overflow: hidden
  cursor: grab

.thread-img
  margin: auto
  min-width: 10rem
  max-height: 10rem

.thread-text
  display: flex
</style>
