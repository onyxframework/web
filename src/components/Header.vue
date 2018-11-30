<template lang="pug">
  header
    .content
      .left
        router-link.logo(to="/")
          img(src="/img/logo-name.svg")
        router-link.sub(v-if="sub", to="sub") {{subTitle}}
      .right.menu
        a(:href="docsURL") Docs
        a(:href="apiURL") API
        a(:href="gitHubURL") GitHub
        a(href="#") Pro
        a(href="#") Enterprise
</template>

<script>
  export default {
    props: {
      sub: {
        type: String,
        default: null
      }
    },
    computed: {
      docsURL () {
        return 'https://docs.onyxframework.org' + (this.sub || '')
      },
      apiURL () {
        return 'https://api.onyxframework.org' + (this.sub || '')
      },
      gitHubURL () {
        return 'https://github.com/onyxframework' + (this.sub || '')
      },
      subTitle () {
        return this.$route.name
      }
    }
  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/mixins.sass'

  header
    +center

    position: absolute
    top: 2rem
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

  .left > *
    display: inline-block
    line-height: 1
    vertical-align: middle

    &:nth-child(2)
      margin-left: 1rem

  .logo img
    height: 1rem

  .menu
    a /* stylelint-disable no-descending-specificity */
      padding: 1rem
</style>
