<template lang="pug">
  .home
    section.hero
      .stripes
        .stripe
        .stripe
        .stripe
      .wrapper
        img.logo(src="/img/logo.svg")
        h1.title Powerful framework for modern applications
        h2.brief Built on Crystal, Onyx Framework brings previously unseen combination of speed and joy to the world of development.
        a.button(href="#") Get started
    section.features
      .wrapper
        .feature
          h3 💨 Fast
          p
            | Onyx Framework is built on&nbsp;
            a(href="https://crystal-lang.org") Crystal
            |  — a compiled language on top of LLVM, which makes it C-fast.
        .feature
          h3 🔋 Efficient
          p Crystal has minimum footprint in RAM and is compiled to tiny binaries executable on most platforms.
        .feature
          h3 🔒 Safe
          p Thanks to Crystal being compiled, you can catch bugs during development, reducing the amount of runtime errors.
        .feature
          h3 👶 Simple
          p Onyx Framework is designed to be as newcomer-friendly as possible, still leaving a space to grow with your knowledge.
        .feature
          h3 🍃 Beautiful
          p Crystal syntax is heavily inspired by Ruby, making the process of development a true joy while staying full OOP.
        .feature
          h3 📦 Modular
          p Onyx Framework consists of multiple loosely-coupled components, perfectly designed for common application needs.
    section.components
      vue-particles.particles(
        color="#000000"
        :particleOpacity="1"
        shapeType="edge"
        :hoverEffect="false"
        :clickEffect="false"
        :moveSpeed="2"
        :linesDistance="0"
        :particleSize="2"
      )
      .stripes
        .stripe
      .wrapper
        h2.title 📦 Onyx Components
        .cards
          a.card(href="#")
            .content
              h3.title 🌎 Onyx::REST
              p.description A REST framework to build blazingly fast action-based APIs. Features common middleware, routing, strongly-typed HTTP params and JSON rendering.
            a(href="#") Learn more →
          a.card(href="#")
            .content
              h3.title 🐘 Onyx::SQL
              p.description An SQL ORM to map models to/from databases like PostgreSQL, MySQL and more. Features beautiful schema definition DSL and strongly-typed Query builder.
            a(href="#") Learn more →
          a.card(href="#")
            .content
              h3.title 🏭 Onyx::Background
              p.description A background job processing based on Redis. Features superior performance and simple syntax.
            a(href="#") Learn more →
        p.additional
          | There are also some utility tools like&nbsp;
          a(href="#") 📚 Onyx CLI
          |  and&nbsp;
          a(href="#") 📚 Onyx
          |  top-level macros.
    section.licensing
      .wrapper
        .item
          .content
            h2.heading 🤓 Community driven
            p We believe that open-source software benefits everyone, that's why Onyx Framework has most of its components licensed under AGPL. You can participate in the development process by opening issues and pull requests on GitHub, joining discussions on the forum or chatting in our Gitter Room.
          a(href="#") Visit github.com/onyxframework →
        .item
          .content
            h2.heading 💰 Businesses backed
            p We also believe in fair usage of the open-source software. Onyx Framework components have a number of features available to Professional and Enterprise licensees only. Commercial license allows you to join Slack and GitHub Teams-based community, thus able to participate in the development process as well.
          a(href="#") Visit onyxframework.com →
    section.customers
      .wrapper
        a(href="#")
          img(src="@/assets/img/acme.png")
        a(href="#")
          img(src="@/assets/img/acme.png")
        a(href="#")
          img(src="@/assets/img/acme.png")
        a(href="#")
          img(src="@/assets/img/acme.png")
        a(href="#")
          img(src="@/assets/img/acme.png")
    section.bottom
      .stripes
        .stripe
      .wrapper
        a.card(href="#")
          h2.header 📰 Visit our blog →
          p Read Onyx Framework development and community news, learn about its powers and how-to's. We also write about Crystal Language itself.
        a.card(href="#")
          h2.header 📚 Explore the docs →
          p Start building beautiful and fast applications with Onyx Framework in minutes. All you'll need is your laptop and a cup of coffee.
</template>

<style lang="sass" scoped>
  @import '@/assets/styles/mixins.sass'

  $color-light-gray: #f3f3f3
  $color-text-black: transparentize(black, 0.15)
  $border: 1px solid $color-light-gray

  .home
    +center

    flex-direction: column
    width: 100%

  section
    +center

    position: relative
    width: 100%

  .wrapper
    z-index: 1
    width: 100%
    max-width: 54rem
    padding-right: 2rem
    padding-left: 2rem

  .stripes
    position: absolute
    top: 0
    left: 0

    z-index: 0

    width: 100%
    height: 100%

    .stripe
      position: absolute

  .card
    display: flex
    flex-direction: column
    justify-content: space-between

    padding: 1.5rem
    color: rgba(black, 0.85)
    background: white
    border-radius: 6px

    box-shadow: 0 4px 10px 2px rgba(black, 0.1)

    &:hover
      box-shadow: 0 4px 10px 2px rgba(black, 0.2)
      transform: translateY(-4px)

  section.hero
    .particles
      position: absolute
      top: 0
      left: 0
      z-index: 0
      width: 100%
      height: 100%

    .stripe:nth-of-type(1)
      bottom: -4rem
      left: 0
      width: 100%
      height: 6rem
      background-color: white
      transform: skewY(-2deg)

    .stripe:nth-of-type(2)
      right: 0
      bottom: -25rem
      width: 100%
      height: 100%
      background-color: transparentize(white, 0.9)
      transform: skewY(-20deg)

    .stripe:nth-of-type(3)
      bottom: -25rem
      left: 0
      width: 100%
      height: 100%
      background-color: transparentize(white, 0.9)
      transform: skewY(7deg)

    .wrapper
      +center

      $top-margin: 1rem
      $padding: 9rem

      flex-direction: column

      padding: $top-margin + $padding 0 $padding
      text-align: center

      > *:not(:first-child)
        margin-top: 1.5rem

    .logo
      height: 5rem
      padding: 1rem
      background-color: white
      border-radius: 8px

    .title, .brief
      margin: 0

      color: white

    .title
      max-width: 40rem

      font-weight: bold
      font-size: 1.4rem
      line-height: 1

    .brief
      max-width: 30rem
      margin-top: 0.5rem !important
      font-weight: normal
      font-size: 1rem

    .button
      &:hover
        $raise: 2px
        box-shadow: 0 3px 15px 0 rgba(black, 0.1)
        transform: translateY(-2px)

  section.features
    z-index: 2
    padding: 3rem 0

    color: $color-text-black
    background-color: white

    .wrapper
      display: grid
      grid-template-columns: 1fr 1fr 1fr
      grid-column-gap: 1.5rem
      grid-row-gap: 0

    .feature
      background-color: white

      a
        font-weight: bold

      h3
        margin-bottom: 0
        font-size: 1.5rem
        line-height: 1

  section.components
    padding: 7rem 0 4rem
    background-color: $color-light-gray

    .stripes
      .stripe:nth-of-type(1)
        top: -4rem
        left: 0
        width: 100%
        height: 6rem
        background-color: white
        transform: skewY(-2deg)

    .particles
      position: absolute
      top: 0
      left: 0
      z-index: 0
      width: 100%
      height: 100%

    .wrapper
      +center
      flex-direction: column

      > *:not(:first-child)
        margin-top: 1.5rem

      .title
        margin: 0

      .additional a
        font-weight: bold

    .cards
      display: grid
      grid-template-columns: 1fr 1fr 1fr
      grid-column-gap: 1.2rem
      margin-top: 1.4rem

    .card
      .title
        margin: 0
        line-height: 1

      .description
        margin-bottom: 1rem

      a /* stylelint-disable no-descending-specificity */
        &:hover
          color: black

  section.licensing
    +center

    color: $color-text-black
    background-color: white

    /* stylelint-disable no-descending-specificity, rule-empty-line-before */
    .wrapper
      display: grid
      grid-template-columns: 1fr 1fr
      grid-column-gap: 0

      .item
        display: flex
        flex-direction: column
        justify-content: space-between

        padding: 5rem 2rem

        .content
          .heading
            margin: 0
            line-height: 1

        a:hover /* stylelint-disable no-descending-specificity */
          color: black

        &:first-of-type
          padding-left: 0

        &:last-of-type
          padding-right: 0

        &:not(:first-of-type)
          border-left: $border

  section.customers
    +center

    padding: 2rem 0

    background-color: white
    border-top: $border

    .wrapper
      display: grid
      grid-template-columns: repeat(5, 1fr)
      max-width: 54rem

      a /* stylelint-disable no-descending-specificity */
        display: block
        margin: 1rem 2rem
        text-align: center

        img
          max-width: 100%
          opacity: 0.5
          filter: grayscale(100%)

        &:hover
          transform: translateY(-4px)

          img
            opacity: 1
            filter: none

  section.bottom
    +center

    padding-bottom: 3rem
    color: $color-text-black

    .stripe:nth-of-type(1)
      top: -6rem
      left: 0
      width: 100%
      height: 12rem
      background-color: white
      transform: skewY(-2deg)

    .stripe:nth-of-type(2)
      top: -8rem
      left: 0
      width: 100%
      height: 100%
      background-color: transparentize(white, 0.9)
      transform: skewY(-12deg)

    .stripe:nth-of-type(3)
      top: -10rem
      right: 0
      width: 100%
      height: 100%
      background-color: transparentize(white, 0.8)
      transform: skewY(10deg)

    .wrapper
      display: grid
      grid-template-columns: 1fr 1fr
      grid-column-gap: 1.5rem

      .card
        padding: 2rem

        .header
          margin: 0
          line-height: 1

        p
          margin-bottom: 0
</style>
