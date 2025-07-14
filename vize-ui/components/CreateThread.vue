<script setup lang="ts">
import {useBoardStore} from "~/stores/boards";

const currentPath: string = useRoute().path.slice(1);
const boardStore = useBoardStore()
const boardCode: string = boardStore.getBoardByCode(currentPath).code;

const form = ref({
      boardCode: boardCode,
      title: '',
      content: ''
    }
)

function createThread() {
  $fetch(`${useRuntimeConfig().public.backendUrl}/threads`, {
    method: 'POST',
    body: form.value
  })
}
</script>

<template>
  <form class="create-thread-body" @submit.prevent="createThread">
    <div class="create-thread-title">
      <input v-model="form.title" required class="create-thread-title-input" placeholder="title">
      <input class="create-thread-submit" type="submit" placeholder="submit">
    </div>
    <div class="create-thread-text">
      <textarea v-model="form.content" required class="create-thread-text-input" placeholder="Commentary"/>
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