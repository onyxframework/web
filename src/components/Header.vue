<template lang="pug">
  header
    .content
      .left
        router-link.logo(to="/")
          img(src="/img/logo-name.svg")
        router-link.sub(v-if="selectedComponent", to="selectedComponent.path") {{selectedComponent.name}}
      .right.menu
        a(:href="docsURL") Docs
        a(:href="apiURL") API
        a(:href="gitHubURL") GitHub
        a(href="#") Pro
        a(href="#") Enterprise
</template>

<script>
  import Dropdown from 'vue-dropdowns'

  export default {
    components: {
      Dropdown
    },
    props: {
      component: {
        type: String,
        default: null
      }
    },
    data () {
      return {
        components: [{
          name: 'REST',
          path: '/rest'
        }, {
          name: 'SQL',
          path: '/sql'
        }, {
          name: 'Background',
          path: '/background'
        }]
      }
    },
    computed: {
      selectedComponent () {
        switch (this.component) {
        case 'rest':
          return this.components[0]
        case 'sql':
          return this.components[1]
        case 'background':
          return this.components[2]
        default:
          return null
        }
      },
      docsURL () {
        let add = this.component ? this.component.path : ''
        return 'https://docs.onyxframework.org' + add
      },
      apiURL () {
        let add = this.component ? this.component.path : ''
        return 'https://api.onyxframework.org' + add
      },
      gitHubURL () {
        let add = this.component ? this.component.path : ''
        return 'https://github.com/onyxframework' + add
      }
    },
    methods: {
      onSelected () {

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
