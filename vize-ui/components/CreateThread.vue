<script setup lang="ts">
import {useBoardStore} from "~/stores/boards";

const form = reactive({
      boardCode: String,
      title: String,
      content: String
    }
)

const currentPath: string = useRoute().path.slice(1);
const boardStore = useBoardStore()
const boardCode: string = boardStore.getBoardByCode(currentPath).code;

function createThread() {
  $fetch(`${useRuntimeConfig().public.backendUrl}/ping`, {
    method: 'POST',
    body: form
  })
}
</script>

<template>
  <form class="create-thread-body" @submit.prevent="createThread">
    <div class="create-thread-title">
      <input required name="title" class="create-thread-title-input" placeholder="title">
      <input name="boardCode" hidden :value="boardCode">
      <input class="create-thread-submit" type="submit" placeholder="submit">
    </div>
    <div class="create-thread-text">
      <textarea required name="content" class="create-thread-text-input" placeholder="Commentary"/>
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