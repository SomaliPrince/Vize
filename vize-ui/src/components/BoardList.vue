<script setup>
import {onMounted, ref} from 'vue'
import axios from 'axios'

const API_CLIENT = axios.create({
  baseURL: 'http://localhost:8080'
})

function getBoardCodes() {
  const boardCodes = ref([])
  const loading = ref(false)
  const error = ref(null)

  const fetchBoardCodes = async () => {
    loading.value = true
    error.value = null
    try {
      boardCodes.value = (await API_CLIENT.get(`/boards/codes`)).data
    } catch (err) {
      console.error('Error fetching board codes:', err)
      error.value = err.response?.data?.message || err.message || 'Failed to fetch board codes.'
    } finally {
      loading.value = false
    }
  }
  return {
    boardCodes,
    loading,
    error,
    fetchBoardCodes
  }
}

const {boardCodes, loading, error, fetchBoardCodes} = getBoardCodes()

onMounted(() => {
  fetchBoardCodes()
})
</script>

<template>
<span class="board-list">
      &#91;
      <a class="board-code"
         v-for="(boardCode, index) in boardCodes" :key="boardCode">
        {{ boardCode }}
        <code v-if="index < boardCodes.length - 1">&#47;</code>
      </a>
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
  padding-left: 0.25rem
  padding-right: 0.25rem

</style>
