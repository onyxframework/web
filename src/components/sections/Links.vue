<template lang="pug">
  section.links
    .wrapper
      a-link
        template(#title)
          i.twa.twa-lg.twa-books
          |  Documentation
        template(#content) A well-organaized online-book with code examples will guide you through the world of development with Onyx.
        template(#link)
          a.button.small(:href="'https://docs.onyxframework.com' + path") Explore the docs
      a-link
        template(#title)
          i.twa.twa-lg.twa-gear
          |  API
        template(#content)
          | Dive into raw methods and classes documentation with automatically built API docs.
        template(#link)
          a.button.small(:href="'https://api.onyxframework.com' + path") Open the API
      a-link
        template(#title)
          i.twa.twa-lg.twa-speech-balloon
          |  Gitter
        template(#content) Join the talk in the instant chatting Gitter room. You can join either the lobby or a component-dedicated room.
        template(#link)
          a.button.small(href="https://gitter.im/onyxframework") @onyxframework
      a-link
        template(#title)
          i.twa.twa-lg.twa-bird
          |  Twitter
        template(#content) Subscribe to receive the framework updates and also fell free to tell us about your projects.
        template(#link)
          a.button.small(href="https://twitter.com/onyxframework") @onyxframework
      a-link
        template(#title)
          i.twa.twa-lg.twa-octopus
          |  GitHub
        template(#content) Create issues, propose Pull Requests - the well known GitHub workflow is at your service.
        template(#link)
          a.button.small(:href="'https://github.com/onyxframework' + path") @onyxframework{{path}}
      a-link
        template(#title)
          i.twa.twa-lg.twa-dove
          |  Patrons
        template(#content) Join the list of backers or enslist your company as the project's sponsor.
        template(#link)
          router-link.button.small(to="/patrons") Go to patrons page
</template>

<script>
import Link from "./Links/Link.vue";

export default {
  components: {
    ALink: Link,
  },
  props: {
    path: {
      type: String,
      required: true,
    },
  },
};
</script>

<style lang="sass" scoped>
@import '@/assets/styles/variables.sass'

.links
  padding: 3rem 0
  background-color: white
  border-top: 1px solid $color-light-gray

  .wrapper
    display: grid
    grid-column-gap: 1.5rem
    grid-row-gap: 2rem
    grid-template-columns: 1fr 1fr

    @media (max-width: 768px)
      grid-template-columns: auto
</style>
