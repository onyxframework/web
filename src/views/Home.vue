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
      h2 Enjoy the performance
      a.button.hover-raise(href="#") Get started
    section.brief-description
      .wrapper
        p.description
          | Powered by&nbsp;
          a(href="https://crystal-lang.org") Crystal
          |  — a compiled language on top of&nbsp;
          a(href="https://llvm.org") LLVM
          |  — Onyx Framework applications run faster while consuming less.
        p.links
          a(href="https://github.com/onyxframework")
            i.feather-github
            span GitHub
          a(href="https://twitter.com/onyxframework")
            i.feather-twitter
            span Twitter
          a(href="https://t.me/onyxframework")
            i.feather-send
            span Telegram
    section.language-features
      .wrapper
        .feature
          h1 Fast
          p Orders-of-magnitude-faster than Ruby applications you've got used to. Processing speeds comparable with languages like Go, Rust and even C.
        .feature
          h1 Solid
          p Crystal is a compiled language, which allows to catch bugs early, reducing the amount of unexpected errors in production.
        .feature
          h1 Beautiful
          p If you love Ruby for its syntax, you'll definitely fall in love with Crystal as well!
    section.benchmarks
      .wrapper
        i Insert benchmarks here
    section.framework-features
      .wrapper
        .feature
          h1 Great starting point
          p
            | Entirely new to the&nbsp;
            a(href="https://crystal-lang.org") Crystal Language
            | ? Onyx Framework is an ideal starting point to dive into the world of web-development (and more) with Crystal!
          p
            i Insert tutorial and docs links here
          pre.code-example(v-highlight)
            code.crystal.
              require "onyx/rest"

              Onyx.get "/" do
                "Hello Onyx!"
              end

              Onyx.listen
        .feature
          h1 Scales with your knowledge
          p Ready to move on with your hobby project? You can easily add new features and expand the framework with functionality you need.
          p
            i Insert docs links here
          pre.code-example(v-highlight)
            code.crystal.
              class Onyx::REST::Server
                def foo
                  puts "That's a custom function!"
                end
              end
        .feature
          h1 Built for business
          p
            | Already feeling confident enough to build a real-world project on the Onyx Framework or ship applications to your clients faster? Visit&nbsp;
            a(href="https://onyxframework.com") onyxframework.com
            |  to find out how it can suit your business needs.
</template>

<style src="highlight.js/styles/darkula.css"></style>

<style lang="sass" scoped>
  @import '@/assets/styles/mixins.sass'

  $border: 0.5px solid #eee
  $max-width: 50rem
  $media-tablet: 768px

  section
    +center

    padding: 2rem

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
      border-radius: 4px

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
      grid-template-columns: repeat(3, 1fr)
      grid-column-gap: 1rem

      margin-top: 1rem

      @media (max-width: $media-tablet)
        grid-template-columns: 100%
        grid-row-gap: 1rem

      a
        display: block
        width: 100%
        padding: 0.5rem 1rem

        color: white
        text-decoration: none
        background-color: black

        border-radius: 4px

        i
          margin-right: 0.5rem

        &:hover
          box-shadow: 0 3px 15px 0 rgba(black, 0.1)
          transform: translateY(-1px)

        &:not(:first-of-type)
          // margin-left: 1rem

  .language-features
    .wrapper
      display: grid
      grid-template-columns: repeat(3, 1fr)
      grid-column-gap: 2rem

      @media (max-width: $media-tablet)
        grid-template-columns: 100%
        grid-row-gap: 2rem

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
        border-radius: 4px
</style>
