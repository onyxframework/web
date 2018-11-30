<template lang="pug">
  #app
    router-view
</template>

<style src="normalize.css/normalize.css"></style>

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
