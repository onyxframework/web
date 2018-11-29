<template lang="pug">
  header
    .content
      a.left.logo(href="#")
        img.name(src="/img/logo-name.svg")
      .right.menu
        a(href="#") Docs
        a(href="#") API
        a(href="#") GitHub
        a(href="#") Pro
        a(href="#") Enterprise
</template>

<script>
  export default {

  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/mixins.sass'

  header
    +center

    position: absolute
    top: 1.5rem
    z-index: 2
    width: 100%

    background-color: transparent

    a
      color: white

      &:hover
        opacity: 0.5

  .content
    display: flex
    justify-content: space-between
    align-items: center

    width: 100%
    max-width: 54rem
    padding-right: 2rem
    padding-left: 2rem

  .logo
    img
      display: inline-block
      vertical-align: middle

      &:nth-child(2)
        margin-left: 0.5rem

    .name
      height: 1rem

  .menu
    a /* stylelint-disable no-descending-specificity */
      padding: 1rem
</style>
