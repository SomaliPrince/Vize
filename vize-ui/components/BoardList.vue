<script setup lang="ts">
import type {Board} from "~/types/data";
import {useBoardStore} from "~/stores/boards";

await useBoardStore().fetchBoardData();
const boards: Board[] = useBoardStore().getBoardItems;

</script>

<template>
  <span class="board-list">
    <NuxtLink
        style="margin-right: 10px"
        external
        :to="'/'">
      HOME
    </NuxtLink>
    &#91;
    <!--IGNORE THIS WARN-->
    <NuxtLink
        v-for="(board, index) in boards"
        :key="board.code"
        :to="{ name: 'board', params: { board: board.code } }"
        external
        class="board-code">
      {{ board.code }}
      <code v-if="index < boards.length - 1">&#47;</code>
    </NuxtLink>
    &#93;
  </span>
</template>

<style scoped lang="sass">
.board-list
  display: flex
  align-items: flex-start
  justify-content: flex-start
  font-family: "Courier 10 Pitch", system-ui
  font-size: medium

.board-code
  text-decoration: none
  color: black
  cursor: pointer
  padding-left: 0.25rem
  padding-right: 0.25rem

  &:hover
    color: #16a34a
    transition: color 0.2s ease-in-out
</style>
