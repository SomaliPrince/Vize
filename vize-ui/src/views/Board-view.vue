<script setup lang="ts">
import { useRoute } from 'vue-router'

const route = useRoute()
const rofl = async () => {
  return route.path;
}
</script>

<template>
  {{ rofl }}
  <h1>Test</h1>
</template>

<style scoped lang="sass"></style>
