<template lang="pug">
  .code-feature
    div
      h2.title
        slot(name="title")
      slot(name="description")
    div
      slot(name="example")
</template>

<script>
  export default {

  }
</script>

<style src="highlight.js/styles/darkula.css"></style>

<style lang="sass" scoped>
  @import '@/assets/styles/mixins.sass'

  .code-feature
    display: grid
    grid-template-columns: 35% 65%
    grid-column-gap: 1.5rem

    pre
      code
        padding: 1rem
        padding-right: 0
        line-height: 1.2
        border-radius: 6px
        box-shadow: 0 4px 10px 2px rgba(black, 0.1)

        &:not(:first-of-type)
          margin-top: 0.5rem

    > div
      &:nth-child(1)
        a
          text-decoration: underline

        code
          display: inline
          padding: 0.02rem 0.35rem 0.1rem
          border-radius: 3px

      &:nth-child(2)
        pre:first-child
          margin-top: 0

        pre:last-child
          margin-bottom: 0

        .terminal-magenta
          color: #c47fd0

        .terminal-gray
          color: #656565
</style>
