<template>
  <div class="layout-wrapper">
    <header>
      <BoardList />
    </header>
    <main>
      <slot />
    </main>
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
          <p>
            &copy; 2025 Vize. All rights reserved. This site is for educational and research
            purposes.
          </p>
        </div>
      </div>
    </footer>
  </div>
</template>
<script setup lang="ts">
</script>