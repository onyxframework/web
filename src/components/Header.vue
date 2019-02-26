<template lang="pug">
  header
    .content
      .left
        router-link.logo(to="/")
          img(src="/img/logo-name.svg")
        router-link.sub(v-if="selectedPage", :to="selectedPage.path") {{selectedPage.name}}
      .right.menu
        a(:href="docsURL") Docs
        a(:href="apiURL") API
        a(:href="gitHubURL") GitHub
</template>

<script>
  import Dropdown from 'vue-dropdowns'

  export default {
    components: {
      Dropdown
    },
    props: {
      page: {
        type: String,
        default: null
      }
    },
    data () {
      return {
        pages: [{
          name: 'Onyx',
          path: '/onyx',
          component: true
        }, {
          name: 'HTTP',
          path: '/http',
          component: true
        }, {
          name: 'REST',
          path: '/rest',
          component: true
        }, {
          name: 'SQL',
          path: '/sql',
          component: true
        }, {
          name: 'EDA',
          path: '/eda',
          component: true
        }, {
          name: 'Patrons',
          path: '/patrons',
          component: false
        }]
      }
    },
    computed: {
      selectedPage () {
        switch (this.page) {
        case 'onyx':
          return this.pages[0]
        case 'http':
          return this.pages[1]
        case 'rest':
          return this.pages[2]
        case 'sql':
          return this.pages[3]
        case 'eda':
          return this.pages[4]
        case 'patrons':
          return this.pages[5]
        default:
          return null
        }
      },
      docsURL () {
        let add = (this.selectedPage && this.selectedPage.component) ? this.selectedPage.path : ''
        return 'https://docs.onyxframework.org' + add
      },
      apiURL () {
        let add = (this.selectedPage && this.selectedPage.component) ? this.selectedPage.path : ''
        return 'https://api.onyxframework.org' + add
      },
      gitHubURL () {
        let add = (this.selectedPage && this.selectedPage.component) ? this.selectedPage.path : ''
        return 'https://github.com/onyxframework' + add
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
      font-weight: normal

      transition: all 0.2s ease-out

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

    &.sub
      margin-left: 1rem
      vertical-align: 0

      @media (max-width: 768px)
        display: none

  .logo img
    height: 1rem

  .menu
    a /* stylelint-disable no-descending-specificity */
      padding: 1rem
</style>
