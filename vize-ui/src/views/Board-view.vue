<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'
import { useRoute } from 'vue-router'

const API_CLIENT = axios.create({
  baseURL: 'http://localhost:8080',
})

function getThreads() {
  const threads = ref([])
  const loading = ref(false)
  const error = ref(null)

  const fetchThreads = async () => {
    loading.value = true
    error.value = null
    try {
      threads.value = (await API_CLIENT.get(`/threads`.concat(useRoute().path))).data
    } catch (err) {
      console.error('Error fetching threads:', err)
      error.value = err.response?.data?.message || err.message || 'Failed to fetch threads.'
    } finally {
      loading.value = false
    }
  }
  return {
    threads,
    loading,
    error,
    fetchThreads
  }
}

const { threads, fetchThreads } = getThreads()

onMounted(() => {
  fetchThreads()
})
</script>

<template>
  {{threads}}
  <h1>Test</h1>
</template>

<style scoped lang="sass"></style>
