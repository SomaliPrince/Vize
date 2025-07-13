<script setup lang="ts">
import type {Thread} from "~/types/data";
import {useBoardStore} from "~/stores/boards";
import CreateThread from "~/components/CreateThread.vue";

const currentPath: string = useRoute().path.slice(1);

const threadsFetch = await useFetch<Thread[]>(`${useRuntimeConfig().public.backendUrl}/threads${currentPath}`)
const threads: Thread[] = threadsFetch.data.value || [];
const boardStore = useBoardStore()

const isCreatingThread = ref(false);

await useAsyncData(
    async () => {
      await boardStore.fetchBoardData();
      return boardStore.getBoardByCode(currentPath)
    }
);

const board = computed(() => boardStore.getBoardByCode(currentPath))
</script>

<template>
  <div>
    <div class="thread-catalog-header">
      <img
          class="thread-catalog-img"
          src="public/temp-title.png" alt="header">
      <div class="thread-catalog-board-list">/{{ board.code }}/ - {{ board.name }}</div>
    </div>
    <hr style="width: 75%">
    <div class="create-thread-btn" @click="isCreatingThread = !isCreatingThread">
      [
      <span v-if="!isCreatingThread" class="create-thread-btn-text">Start a new thread</span>
      <span v-else class="create-thread-btn-text">Close</span>
      ]
    </div>
    <CreateThread v-if="isCreatingThread"/>
    <div class="threads">
      <ThreadCard
          v-for="thread in threads"
          :id="thread.id"
          :key="thread.id"
          :title="thread.title"
      />
    </div>
  </div>
</template>

<style scoped lang="sass">
.threads
  justify-content: center
  display: flex
  flex-flow: wrap
  align-items: flex-start

.thread-catalog-header
  text-align: center

.thread-catalog-img
  width: 500px
  height: 150px

.create-thread-btn
  user-select: none
  text-align: center
  font-size: 1.5rem

.create-thread-btn-text:hover
  cursor: grab
  color: green


.thread-catalog-board-list
  font-size: clamp(1rem, 15vw, 3rem)
  font-weight: 650
  letter-spacing: 0.05em
  text-transform: uppercase
  background: linear-gradient(90deg, #15803d, #22c55e, #7dd3fc, #2563eb)
  background-size: 300% 100%
  background-clip: text
  -webkit-background-clip: text
  -webkit-text-fill-color: transparent
  animation: gradientFlow 3s ease-in-out infinite alternate

  @keyframes gradientFlow
    0%
      background-position: 0 0
    100%
      background-position: 100% 0

.header
  text-align: center

  .animate-character
    font-size: clamp(4rem, 15vw, 12rem)
    font-weight: 900
    letter-spacing: 0.1em
    text-transform: uppercase
    background: linear-gradient(90deg, #15803d, #22c55e, #7dd3fc, #2563eb)
    background-size: 300% 100%
    background-clip: text
    -webkit-background-clip: text
    -webkit-text-fill-color: transparent
    animation: gradientFlow 3s ease-in-out infinite alternate

    @keyframes gradientFlow
      0%
        background-position: 0 0
      100%
        background-position: 100% 0

  p
    font-size: 1.125rem
    color: #4b5563
</style>
