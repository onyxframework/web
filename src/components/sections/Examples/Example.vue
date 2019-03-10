<template lang="pug">
  .example
    div
      h2.title
        slot(name="title")
      slot(name="description")
    div.code
      slot(name="example")
</template>

<style src="highlight.js/styles/monokai.css"></style>

<style lang="sass">
  .hljs-keyword, .hljs-title, .hljs-literal
    font-weight: normal
</style>

<style lang="sass" scoped>
  @import '@/assets/styles/mixins.sass'

  .example
    display: grid
    grid-column-gap: 1rem
    grid-template-columns: 1fr 2fr

    @media (max-width: 768px)
      grid-template-columns: auto

      .code
        display: none

    pre
      code
        padding: 1.5rem
        padding-right: 0
        line-height: 1.4
        border-radius: 6px

        &:not(:first-of-type)
          margin-top: 0.5rem

    > div
      &:nth-child(1)
        p
          line-height: 1.4

        code
          display: inline
          padding: 0.2rem 0.35rem 0.2rem
          font-size: 0.9rem
          vertical-align: 0.05rem
          border-radius: 3px

          a
            color: inherit

      &:nth-child(2)
        pre:first-child
          margin-top: 0

        pre:last-child
          margin-bottom: 0

        img
          max-width: 100%

        b
          font-weight: bold

        .terminal-magenta
          color: #c47fd0

        .terminal-gray
          color: #656565

        .terminal-green
          color: lighten(green, 10)

        .terminal-red
          color: lighten(red, 10)

        .terminal-cyan
          color: darken(cyan, 15)
</style>
