<script setup lang="ts">
import {useThreadStore} from "~/stores/threads";
import type {Thread} from "~/types/data";

const url: string[] = useRoute().path.split("/");
const boardCode: string = url[0]
const threadId: number = Number(url[2]);
await useThreadStore().fetchThreads(boardCode);
const thread: Thread | undefined = useThreadStore().getThreadOnBoard(boardCode, threadId);
</script>

<template>
  <div>
    <div class="thread-body">
      <div class="oppost-body">
        <div class="oppost-details">

        </div>
        <div class="oppost-image"><img class="thread-card-img" src="https://picsum.photos/200/200" alt="Random image">
        </div>
        <article class="oppost-comment">

        </article>
      </div>
    </div>
    <div v-for="post in thread?.posts" :key="post.id" class="post-body">
      <div>{{ post.id }}</div>
      <div>{{ post.comment }}</div>
    </div>
  </div>
</template>

<style scoped lang="sass">

</style>