<template lang="pug">
  section.links
    .wrapper
      x-link(:url="'https://docs.onyxframework.org' + path")
        template(slot="title") 📚 Documentation
        template(slot="content") A well-organaized online-book with code examples will guide you through the glorious world of development with Onyx.
        template(slot="link-text") Explore the docs
      x-link(:url="'https://api.onyxframework.org' + path")
        template(slot="title") ⚙️ API
        template(slot="content")
          | Dive into raw methods and classes documentation with API docs, which are automatically built after every commit to master branch.
        template(slot="link-text") Open the API
      x-link(:url="'https://github.com/onyxframework' + path")
        template(slot="title") 🐙 GitHub
        template(slot="content") Create issues, propose Pull Requests - the well known GitHub workflow is at your service.
        template(slot="link-text") @onyxframework{{path}}
      x-link(:url="'https://gitter.im/onyxframework' + path")
        template(slot="title") 💬 Gitter
        template(slot="content") Join the talk in the instant chatting Gitter room.
        template(slot="link-text") @onyxframework{{path}}
      x-link(url="https://forum.crystalcommunity.org/")
        template(slot="title") 💭 Forum
        template(slot="content")
          | Enjoy the civilized discussion and ask thorough questions on our&nbsp;
          a(href="https://www.discourse.org/") Discourse
          | -based forum
        template(slot="link-text") Go to the forum
      x-link(url="https://twitter.com/onyxframework")
        template(slot="title") 🐦 Twitter
        template(slot="content") Subscribe to receive the framework updates and also fell free to tell us about your projects.
        template(slot="link-text") @onyxframework
</template>

<script>
  import Link from './components/Link.vue'

  export default {
    components: {
      XLink: Link
    },
    props: {
      path: {
        type: String,
        required: true
      }
    }
  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/variables.sass'

  .links
    padding: 3rem 0
    background-color: white
    border-top: 1px solid $color-light-gray

    .wrapper
      display: grid
      grid-template-columns: 1fr 1fr
      grid-column-gap: 1.5rem
      grid-row-gap: 2rem
</style>
