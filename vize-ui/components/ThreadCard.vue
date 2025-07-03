<script setup lang="ts">
defineProps({
  title: {
    type: String,
    required: true
  },
  id: {
    type: Number,
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
        <span>{{title}}</span>
      </div>
      <div class="thread-card-preview">
        <b class="thread-card-title">{{ id }}: </b>
        <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rhoncus eu lorem sed ultricies. Suspendisse commodo, nulla sed suscipit auctor, magna nulla tincidunt nunc, ac fringilla orci mauris vitae quam. Curabitur cursus vestibulum arcu eu efficitur. Phasellus non feugiat turpis. Sed lobortis volutpat sem vitae condimentum. Donec nunc tortor, congue vitae augue eget, varius condimentum diam. Fusce accumsan sem nec massa vulputate sollicitudin. Nullam quis placerat erat.</span>
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
