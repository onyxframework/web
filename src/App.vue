<template lang="pug">
  #app
    app-header
    router-view
    app-footer
</template>

<script>
  import Header from '@/components/Header.vue'
  import Footer from '@/components/Footer.vue'

  export default {
    components: {
      AppHeader: Header,
      AppFooter: Footer
    }
  }
</script>

<style lang="sass">
  @import '@/assets/styles/index.sass'

  html, body
    margin: 0
    padding: 0

  *
    box-sizing: border-box
    transition: all 0.2s ease-out

  body
    background-color: #1a1a1a
</style>
