<script setup lang="ts">
import {useThreadStore} from "~/stores/threads";
import type {OpPost, Post} from "~/types/data";
import ReplyWindow from "~/components/ReplyWindow.vue";

const url: string[] = useRoute().path.split("/");
const boardCode: string = url[1]
const threadId: number = Number(url[3]);
await useThreadStore().fetchThreads(boardCode);
const posts: Post[] = useThreadStore().getThreadPostsOnBoard(boardCode, threadId);
const op: OpPost = useThreadStore().getThreadOpPostOnBoard(boardCode, threadId)
const isReplying = ref(false);
const replyWindow = ref<InstanceType<typeof ReplyWindow>>();

const reply = async (postId: string) => {
  isReplying.value = true;
  await nextTick();
  if (replyWindow.value != null) replyWindow.value.appendId(postId);
}
</script>

<template>
  <div class="thread-body">
    <ReplyWindow
        v-if="isReplying"
        ref="replyWindow"
        :board="boardCode"
        :thread="threadId"
        @close-reply="isReplying = false"/>

    <div class="thread-op-body">
      <div class="thread-post-details">
        <span class="thread-post-details-name">{{ op.name }}&ensp;</span>
        <!--    TODO security-->
        <span class="thread-post-details-user">Anonymous&ensp;</span>
        <span class="thread-post-details-date">{{ op.createdAt }}&ensp;</span>
        <span>№</span>
        <span class="thread-post-details-id" @click="reply(`${op.id.toString()} (OP)`)">{{ op.id }}</span>
      </div>
      <div class="thread-op-images">
        <!--      TODO list images (figures)-->
        <figure class="thread-op-image-id">
          <figcaption>
            img data
          </figcaption>
          <a><img
              src="/home/ranmaru/Pictures/pfp/d6b3a76086be1a412b96321243b600ca50e8c9cd59591b65120e2a2b4620ea82.jpg"
              alt="20x20"></a>
        </figure>
      </div>
      <article class="thread-op-comment">{{ op.comment }}</article>
    </div>
    <div class="thread-posts-body">
      <div v-for="post in posts" :key="post.id" class="thread-post-body">
        <div class="thread-post-details">
          <!--    TODO security-->
          <span class="thread-post-details-user">Anonymous&ensp;</span>
          <span class="thread-post-details-date">{{ post.createdAt }}&ensp;</span>
          <span>№</span>
          <span class="thread-post-details-id" @click="reply(post.id.toString())">{{ post.id }}</span>
        </div>
        <article class="thread-post-comment">{{ post.comment }}</article>
      </div>
    </div>
  </div>
</template>

<style scoped lang="sass">
.thread-body
  margin: 2rem

.thread-post-details
  display: flex
  flex-flow: row wrap
  align-items: center
  box-sizing: border-box
  word-break: break-word
  word-wrap: break-word

.thread-op-image-id
  float: left
  display: block
  flex-flow: row wrap
  margin: 0
  box-sizing: border-box
  word-break: break-word
  word-wrap: break-word

.thread-op-comment
  padding: 2rem
  overflow: auto
  display: block

.thread-post-comment
  padding: 1rem
  overflow: auto
  display: block

.thread-post-body
  padding-left: 2rem
  overflow: auto
  display: block

.thread-post-details-id
  cursor: grab
</style>