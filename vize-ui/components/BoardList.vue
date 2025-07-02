<script setup lang="ts">
const codesFetch = await useFetch<string[]>(
    'http://localhost:8080/boards/codes',
    {
      key: 'board-codes'
    });
const codes: string[] = codesFetch.data.value || [];

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
        v-for="(code, index) in codes"
        :key="code"
        :to="{ name: 'board', params: { board: code } }"
        external
        class="board-code">
      {{ code }}
      <code v-if="index < codes.length - 1">&#47;</code>
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
