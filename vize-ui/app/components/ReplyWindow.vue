<script setup lang="ts">

import type {CreatePost} from "~/types/data";

const emit = defineEmits(['closeReply']);
const prop = defineProps({
  board: {
    type: String,
    required: true
  },
  thread: {
    type: Number,
    required: true
  }
})

const form = ref<CreatePost>({
  board: prop.board,
  threadId: prop.thread,
  comment: ''
})

const appendId = (value: string) => {
  form.value.comment = `${form.value.comment}>>${value}\n`;
}
defineExpose({appendId});

async function createPost() {
  await useThreadStore().createPost(form.value);
  emit('closeReply');
}
</script>

<template>
  <form class="reply-body" @submit.prevent="createPost">
    <!--    TODO MAKE IT MOVABLE-->
    <div class="reply-title">
      <span>Reply to thread</span>
      <span class="reply-title-cross" @click="$emit('closeReply')">x</span>
    </div>
    <div>
      <input style="width: 75%; margin: 0.25rem 0.25rem 0.25rem 0" placeholder="random">
      <button style="width: 20%" type="submit">Submit</button>
    </div>
    <textarea v-model="form.comment" class="reply-comment" placeholder="Comment"/>
    <!--    TODO CAPTCHA-->
  </form>
</template>

<style scoped lang="sass">
.reply-body
  display: block
  border: solid 1px black
  border-radius: 2px
  min-width: 20rem
  text-align: left
  position: fixed
  top: 10rem
  right: 2rem
  padding: 2px

.reply-title
  cursor: move
  padding: 0.25rem
  background: lightgreen
  text-align: center

.reply-title-cross
  position: absolute
  right: 10px
  cursor: grab

.reply-comment
  width: 100%
  outline: medium none
  overflow: auto
  box-sizing: border-box
  text-align: left
</style>