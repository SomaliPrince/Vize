<script setup>
import Thread from "@/components/Thread.vue";
import {ref} from "vue";

const threadLength = 8;
const stats = ref({
  activeUsers: 1247,
  totalThreads: 892,
  postsToday: 15439,
  boardsActive: 12
})
</script>

<template>
  <div class="vize-homepage">
    <div class="header">
      <h1 class="animate-character">VIZE</h1>
    </div>

    <h1 class="popular-threads">Popular threads</h1>
    <div class="threads">
      <Thread v-for="index in threadLength" :message="threadLength"/>
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

<style lang="sass">
.vize-homepage
  background-color: #fff
  color: #000
  font-family: monospace

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

.active-threads-list
  display: flex
  flex-direction: column
  gap: 0.5rem
  margin-bottom: 3rem

.popular-threads
  margin: 2rem
  text-align: center
  text-transform: uppercase
  background: linear-gradient(90deg, #2563eb, #7dd3fc, #22c55e, #15803d);
  background-size: 300% 100%
  background-clip: text
  -webkit-background-clip: text
  -webkit-text-fill-color: transparent
  animation: gradientFlow 3s ease-in-out infinite alternate

.threads
  display: grid
  grid-template-columns: repeat(4, 10rem)
  justify-content: center
  gap: 4rem
  width: 100%
  border: black

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
