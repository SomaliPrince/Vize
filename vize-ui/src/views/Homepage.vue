<template>
  <div class="vize-homepage">

    <div class="header">
      <h1 class="animate-character">VIZE</h1>
    </div>

    <div class="boards">

      <div class="active-threads-list">
        <div v-for="thread in activeThreads" :key="thread.id" class="thread-item">
          <div class="thread-content">
            <div class="thread-header">
              <span class="thread-board">{{ thread.board }}</span>
              <span class="thread-id">#{{ thread.id }}</span>
            </div>
            <h3 class="thread-title">{{ thread.title }}</h3>
            <div class="thread-meta">
              <span>{{ thread.replies }} replies</span>
              <span>{{ thread.images }} images</span>
              <span>Last reply: {{ thread.lastReply }}</span>
            </div>
          </div>
        </div>
      </div>

      <div class="statistics-box">
        <div class="stats-grid">
          <div>
            <div class="stat-value">{{ stats.activeUsers }}</div>
            <div class="stat-label">Active Users</div>
          </div>
          <div>
            <div class="stat-value">{{ stats.totalThreads }}</div>
            <div class="stat-label">Active Threads</div>
          </div>
          <div>
            <div class="stat-value">{{ stats.postsToday }}</div>
            <div class="stat-label">Posts Today</div>
          </div>
          <div>
            <div class="stat-value">{{ stats.boardsActive }}</div>
            <div class="stat-label">Active Boards</div>
          </div>
        </div>
      </div>
    </div>

    <footer class="footer">
      <div class="footer-content">
        <div class="footer-links">
          <a href="#">Terms of Service</a>
          <a href="#">Privacy Policy</a>
          <a href="#">Rules</a>
          <a href="#">FAQ</a>
          <a href="#">Contact</a>
          <a href="#">DMCA</a>
        </div>
        <div class="copyright">
          <p>&copy; 2025 Vize. All rights reserved. This site is for educational and research
            purposes.</p>
        </div>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const activeThreads = ref([
  {
    id: 1,
    board: '/b/',
    title: 'Random discussion thread',
    replies: 247,
    images: 15,
    lastReply: '2 min ago'
  },
  {
    id: 2,
    board: '/g/',
    title: 'Technology general',
    replies: 89,
    images: 8,
    lastReply: '5 min ago'
  },
  {
    id: 3,
    board: '/pol/',
    title: 'Current events discussion',
    replies: 156,
    images: 23,
    lastReply: '7 min ago'
  },
  {
    id: 4,
    board: '/v/',
    title: 'Video games thread',
    replies: 203,
    images: 31,
    lastReply: '12 min ago'
  },
  {
    id: 5,
    board: '/fit/',
    title: 'Fitness and health',
    replies: 67,
    images: 4,
    lastReply: '15 min ago'
  },
  {
    id: 6,
    board: '/mu/',
    title: 'Music recommendations',
    replies: 134,
    images: 12,
    lastReply: '18 min ago'
  }
])

const stats = ref({
  activeUsers: 1247,
  totalThreads: 892,
  postsToday: 15439,
  boardsActive: 12
})
</script>

<style lang="sass">
$green-base: #28a745
$green-light: lighten($green-base, 15%)
$green-dark: darken($green-base, 15%)
$animation-delay: 0.1s
$letter-spacing: 5px

.vize-homepage
  background-color: #fff
  color: #000
  font-family: monospace

.header
  text-align: center
  border-bottom: 1px solid #d1d5db

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

.boards
  margin: 0 auto
  padding: 2rem 1rem

  h2
    font-size: 1.5rem
    font-weight: bold
    margin-bottom: 1.5rem
    color: #16a34a

.active-threads-list
  display: flex
  flex-direction: column
  gap: 0.5rem
  margin-bottom: 3rem

.thread-item
  border: 1px solid #d1d5db
  background-color: #f9fafb
  padding: 1rem
  transition: background-color 0.2s ease-in-out
  cursor: pointer

  &:hover
    background-color: #f3f4f6

.thread-content
  display: flex
  align-items: flex-start
  justify-content: space-between

  div
    flex: 1

.thread-header
  display: flex
  align-items: center
  gap: 0.5rem
  margin-bottom: 0.25rem

.thread-board
  font-weight: bold
  color: #16a34a

.thread-id
  font-size: 0.875rem
  color: #6b7280

.thread-title
  font-weight: 600
  margin-bottom: 0.5rem

.thread-meta
  display: flex
  gap: 1rem
  font-size: 0.875rem
  color: #4b5563

.statistics-box
  background-color: #f9fafb
  padding: 1.5rem
  margin-bottom: 2rem

  h3
    font-size: 1.25rem
    font-weight: bold
    margin-bottom: 1rem
    color: #16a34a

.stats-grid
  display: grid
  grid-template-columns: repeat(2, 1fr)
  gap: 1rem
  text-align: center

  @media (min-width: 768px)
    grid-template-columns: repeat(4, 1fr)

.stat-value
  font-size: 1.5rem
  font-weight: bold
  color: #000

.stat-label
  font-size: 0.875rem
  color: #4b5563

.footer
  border-top: 1px solid #d1d5db
  background-color: #f9fafb
  padding: 1.5rem 0
  margin-top: auto

.footer-content
  max-width: 64rem
  margin: 0 auto
  padding: 0 1rem

.footer-links
  display: flex
  flex-wrap: wrap
  justify-content: center
  gap: 1.5rem
  font-size: 0.875rem
  color: #4b5563
  margin-bottom: 1rem

  a
    text-decoration: none
    color: black

    &:hover
      color: #16a34a
      transition: color 0.2s ease-in-out

.copyright
  text-align: center
  font-size: 0.75rem
  color: #6b7280
</style>
