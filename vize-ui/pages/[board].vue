<script setup lang="ts">
interface Thread {
  id: number;
  title: string;
}

const currentPath: string = useRoute().path;
const threadsFetch = await useFetch<Thread[]>('http://localhost:8080/threads'.concat(currentPath))
const threads: Thread[] = threadsFetch.data.value || [];
</script>

<template>
  <div>
    <div
        v-for="thread in threads"
        :key="thread.id">
      {{ thread.id }}
      {{ thread.title }}
    </div>
    <h1>{{currentPath}}</h1>
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

<style scoped lang="sass"></style>
