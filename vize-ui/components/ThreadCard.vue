<script setup lang="ts">
defineProps({
  name: {
    type: String,
    required: true
  },
  comment: {
    type: String,
    required: true
  }
})
</script>

<template>
  <div class="thread-body">
    <div class="thread-card-img-box">
      <img class="thread-card-img" src="https://picsum.photos/200/200" alt="Random image">
    </div>
    <div class="thread-card-info">
      <div class="thread-card-meta">
        <span>R: </span>
        <b>mock</b>
        <span> / I: </span>
        <b>mock</b>
        <br>
        <span>{{ name }}</span>
      </div>
      <div class="thread-card-preview">
        <b class="thread-card-title">xd: </b>
        <span>{{ comment }}</span>
      </div>
    </div>
  </div>
</template>

<style scoped lang="sass">
.thread-body
  font-size: 14px
  flex: 0 1 15rem
  margin: 1rem
  height: 25rem
  display: inline-block
  word-wrap: break-word
  overflow: hidden
  position: relative
  cursor: grab

.thread-card-img-box
  text-align: center
  padding-bottom: 0.25rem

.thread-card-preview
  text-align: center

.thread-card-meta
  padding-right: 0.5rem
  padding-left: 0.5rem
  padding-bottom: 0.5rem
  background: #C9D8CD
  text-align: center
</style>
