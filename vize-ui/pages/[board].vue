<script setup lang="ts">
import type {Board, Thread} from "~/types/data";
import {findBoardByCode} from "~/types/data";

const currentPath: string = useRoute().path;
const threadsFetch = await useFetch<Thread[]>(useRuntimeConfig().public.backendUrl.concat('/threads').concat(currentPath))
const threads: Thread[] = threadsFetch.data.value || [];
const board: Board = findBoardByCode(useNuxtData('boards').data.value, currentPath.slice(1));
</script>

<template>
  <div>
    <div class="header">
      <h1 class="animate-character">/{{ board.code }}/ - {{ board.name }}</h1>
    </div>
    <h1>{{ currentPath }}</h1>
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
