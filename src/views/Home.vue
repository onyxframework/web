<template lang="pug">
  .home
    section.hero
      vue-particles(
        color="#ffffff"
        :particleOpacity="1"
        shapeType="edge"
        :particleSize="3"
        :linesWidth="0"
        :lineOpacity="0"
        :hoverEffect="false"
        :clickEffect="false"
        :moveSpeed="2"
      )
      img.logo(src="/img/logo.svg")
      h1 Onyx Framework
      h2 Enjoy the performance 💪
      a.button.hover-raise(href="#") Get started
    section.brief-description
      .wrapper
        p.description
          | Powered by&nbsp;
          a(target="_blank" href="https://crystal-lang.org") Crystal
          |  — a compiled language on top of&nbsp;
          a(target="_blank" href="https://llvm.org") LLVM
          |  — Onyx Framework applications run faster while consuming less.
        p.links
          a.button(target="_blank" href="https://github.com/onyxframework")
            i.feather-github
            span GitHub
          a.button(target="_blank" href="https://twitter.com/onyxframework")
            i.feather-twitter
            span Twitter
          a.button(target="_blank" href="https://gitter.im/onyxframework")
            i.feather-message-square
            span Gitter
          a.button(target="_blank" href="https://t.me/onyxframework")
            i.feather-send
            span Telegram
    section.language-features
      .wrapper
        .feature
          h1 Fast ⚡️
          p Orders-of-magnitude-faster than Ruby applications you've got used to. Processing speeds comparable with languages like Go, Rust and even C.
        .feature
          h1 Solid 💪
          p Crystal is a compiled language, which allows to catch bugs early, reducing the amount of unexpected errors in production.
        .feature
          h1 Beautiful 🍃
          p If you love Ruby syntax and expressiveness, you'll definitely fall in love with Crystal as well!
    section.framework-components
      .wrapper
        h2 Onyx Framework components:
        .components
          .component
            .up
              h2 Onyx
              .description Macros for better day-to-day development process
            .down
              a.button(target="_blank" href="https://github.com/onyxframework/onyx")
                i.feather-github
                span Open on GitHub
          .component
            .up
              h2 Onyx::HTTP
              .description A collection of HTTP helpers to fit common application needs
            .down
              a.button(target="_blank" href="https://github.com/onyxframework/http")
                i.feather-github
                span Open on GitHub
          .component
            .up
              h2 Onyx::REST
              .description Opinionated REST API framework designed to scale fast
            .down
              a.button(target="_blank" href="https://github.com/onyxframework/rest")
                i.feather-github
                span Open on GitHub
          .component
            .up
              h2 Onyx::SQL
              .description A database-agnostic SQL ORM with beautiful DSL done right
            .down
              a.button(target="_blank" href="https://github.com/onyxframework/sql")
                i.feather-github
                span Open on GitHub
          .component
            .up
              h2 Onyx::EDA
              .description An Event-Driven Architecture framework to build reactive apps
            .down
              a.button(target="_blank" href="https://github.com/onyxframework/eda")
                i.feather-github
                span Open on GitHub
        h2
          abbr(title="Work In Progress") WIP
          |  components:
        .wip-components
          .component
            .up
              h2 Onyx::CLI
              .description Official Command Line Interface to perform various tasks
            .down
              a.button(target="_blank" href="https://github.com/onyxframework/cli")
                i.feather-github
                span Open on GitHub
          .component
            .up
              h2 Onyx::GraphQL
              .description A business-grade type-safe GraphQL framework
            .down
              a.button(target="_blank" href="https://github.com/onyxframework/rest")
                i.feather-github
                span Open on GitHub
    section.framework-features
      .wrapper
        .feature
          h1 Great starting point 📚
          p
            | Are you entirely new to the&nbsp;
            a(href="https://crystal-lang.org") Crystal Language
            | ? Onyx Framework is an ideal starting point to dive into the world of web-development (and more) with Crystal!
          p
            | All the framework components are designed to be as simple for newcomers as possible, hiding its complexity under powerful&nbsp;
            abbr(title="Domain Specific Language") DSL
            | , which reduces bolierplate code. Onyx respects configuration over convention, and all macros expand to clean, understandable code — no magic involved 🤓
          pre.code-example(v-highlight)
            code.crystal.
              require "onyx/http"

              Onyx.get "/" do |env|
                env.response << "Hello Onyx!"
              end

              Onyx.listen(5000)
        .feature
          h1 Scales with your knowledge 🚀
          p
            | While the DSL is a great for beginners, your applications may start needing custom functionality. Thanks to the MIT license, you are not limited in extending the framework! Moreover, with the help of the rich&nbsp;
            a(href="https://api.onyxframework.org") API documentation
            | , hacking becomes a piece of cake! 🍰
          pre.code-example(v-highlight)
            code.crystal.
              module Onyx::SQL::Model
                def foo
                  puts "That's a custom function!"
                end
              end
        .feature
          h1 Backed by you ❤️
          p
            | Onyx Framework, as most of my other projects, is MIT-licensed, and its development is driven by the love of the community and businesses. Become a patron today to support a dozen of Crystal shards and projects maintained by me,&nbsp;
            a(target="_blank" href="https://vladfaust.com") Vlad Faust
            | .
    section.supporters
      .wrapper
        img.wreath(src="/img/wreath.svg")
        a.patreon-button(target="_blank" href="https://patreon.com/vladfaust")
          img(src="/img/patreon-button.svg")
        ul.rare
          .title Rare tier supporters:
          li
            a.colored(href="https://github.com/ljuti") Lauri Jutila
        ul.special
          .title Special thanks:
          li
            a.colored(href="https://github.com/Pomis") Roman Ismagilov
          li
            a.colored(href="https://www.researchgate.net/profile/Ilya_Kudrov") Ilya Kudrov
          li
            span Dmitry Antipov
          li
            span Awesome Crystal community 👥
          li
            span Awesome Crystal core team 👾
</template>

<style src="highlight.js/styles/darkula.css"></style>

<style lang="sass" scoped>
  @import '@/assets/styles/mixins.sass'

  $border: 0.5px solid #ddd
  $max-width: 50rem
  $media-tablet: 768px

  section
    +center

    padding: 3rem

    &:not(:last-of-type)
      border-bottom: $border

    .wrapper
      width: 100%
      max-width: $max-width

  .hero
    +center

    position: relative

    flex-direction: column
    padding-top: 4rem
    padding-bottom: 4rem

    color: white
    text-align: center
    background-color: black

    .logo
      z-index: 1
      height: 5rem
      margin-bottom: 0.5rem
      padding: 0.75rem
      background-color: white
      border-radius: 6px

    h1, h2, .button
      z-index: 1

    h1
      margin-top: 0.5rem

    h2
      margin-top: 0.25rem
      font-weight: normal
      font-size: 1.2rem

    .button
      margin-top: 1rem
      font-size: 1.2rem
      background-color: lighten(green, 5)

    #particles-js
      position: absolute
      z-index: 0
      width: 100%
      height: 100%

  .brief-description
    font-size: 1.2rem
    text-align: center

    .wrapper
      +center
      flex-direction: column

    .description
      max-width: 40rem

    .links
      display: grid
      grid-column-gap: 1rem
      grid-template-columns: repeat(4, 1fr)

      margin-top: 1rem

      @media (max-width: $media-tablet)
        grid-template-columns: 100%
        grid-row-gap: 1rem

      a
        display: block
        width: 100%

        color: white
        background-color: black

  .language-features
    .wrapper
      display: grid
      grid-column-gap: 2rem
      grid-template-columns: repeat(3, 1fr)

      @media (max-width: $media-tablet)
        grid-template-columns: 100%
        grid-row-gap: 2rem

  .components, .wip-components
    display: grid

    grid-column-gap: 2rem
    grid-row-gap: 2rem
    grid-template-columns: repeat(3, 1fr)

    margin-top: 1.5rem

    .component
      display: flex
      flex-direction: column
      justify-content: space-between

      padding: 2rem
      border: $border
      border-radius: 6px

      // box-shadow: 0 1px 5px 0 rgba(black, 0.2)

      .down
        margin-top: 1rem

        .button
          width: 100%
          font-size: 90%
          background-color: black

      .description
        margin-top: 1rem

  .components
    margin-bottom: 1.5rem

  .framework-features
    .wrapper
      display: grid
      grid-row-gap: 1rem
      grid-template-columns: 100%

    .feature
      max-width: 100%

    .code-example
      max-width: 100%

      code
        padding: 1rem
        line-height: 1.4
        border-radius: 6px

  .supporters
    .wrapper
      display: flex
      flex-direction: column
      justify-content: center
      align-items: center

      & > *:not(:first-child)
        margin-top: 1rem

    .wreath
      height: 10rem
      padding-bottom: 0.5rem

    .patreon-button
      display: inline-block
      line-height: 0

      &:hover
        box-shadow: 0 3px 15px 0 rgba(black, 0.1)
        transform: translateY(-1px)

      img
        height: 3rem

    ul
      padding: 0
      text-align: center
      list-style: none

      .title
        margin-bottom: 0.75rem
        font-size: 1.1rem

      li
        font-weight: bold
        font-size: 1.2rem

      &.rare
        .colored
          color: blue
</style>
