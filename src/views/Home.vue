<template lang="pug">
  .home.view
    app-header
    section.hero
      .stripes
        .stripe
        .stripe
      .wrapper
        img.logo(src="/img/logo.svg" draggable="false")
        h1.title Powerful framework for modern applications
        p.description Built on Crystal, Onyx Framework brings previously unseen combination of speed and joy to the world of development.
        a.button.hover-raise(href="https://docs.onyxframework.org") Get started
    features
      feature
        template(slot="title")
          i.twa.twa-leaves.twa-lg
          |  Beautiful
        template(slot="content")
          p
            | Crystal syntax is heavily inspired by&nbsp;
            b Ruby
            | , making the process of development a true joy while staying full OOP.
      feature
        template(slot="title")
          i.twa.twa-dash.twa-lg
          |  Fast
        template(slot="content")
          p
            | Crystal is a compiled language on top of LLVM, which makes it up to&nbsp;
            b x75 times
            |  faster than most of Ruby applications on web.
      feature
        template(slot="title")
          i.twa.twa-battery.twa-lg
          |  Efficient
        template(slot="content")
          p
            | Crystal has&nbsp;
            b minimal footprint
            |  on CPU and RAM compared to interpreted languages and is compiled to binary executables.
      feature
        template(slot="title")
          i.twa.twa-lock.twa-lg
          |  Safe
        template(slot="content")
          p
            | Thanks to Crystal being compiled, you can&nbsp;
            b catch bugs early
            |  during development, reducing the amount of runtime errors.
      feature
        template(slot="title")
          i.twa.twa-baby.twa-lg
          |  Simple
        template(slot="content")
          p
            | Onyx Framework is designed to be as&nbsp;
            b newcomer-friendly
            |  as possible, still leaving a space to grow with your knowledge.
      feature
        template(slot="title")
          i.twa.twa-building-construction.twa-lg
          |  Modular
        template(slot="content")
          p
            | Onyx Framework consists of multiple loosely-coupled&nbsp;
            b components
            | , perfectly designed for common application needs.
    section.components
      .bg
      .stripes
        .stripe
      .wrapper
        .cards
          router-link.card(to="/onyx")
            .content
              h2.title Onyx
              p.description Top-level macros for daily development, essentially a glue between all other components.
            router-link(to="/onyx") Learn more →
          router-link.card(to="/http")
            .content
              h2.title Onyx::HTTP
              p.description A collection of HTTP handlers (i.e. middleware) to build modern HTTP applications. Acts as foundation for other components.
            router-link(to="/http") Learn more →
          router-link.card(to="/rest")
            .content
              h2.title Onyx::REST
              p.description An opinionated REST framework with separate business and rendering layers, inspired by Hanami, powered by Onyx::HTTP.
            router-link(to="/rest") Learn more →
          router-link.card(to="/sql")
            .content
              h2.title Onyx::SQL
              p.description An SQL ORM for SQL databases. Features beautiful schema definition DSL and strongly-typed Query builder.
            router-link(to="/sql") Learn more →
          .card.wip
            .content
              h2.title Onyx::EDA (WIP)
              p.description An Event-Driven Architecture framework for Crystal to build reactive applications.
          .card.wip
            .content
              h2.title Onyx::CLI (WIP)
              p.description A convenient Command Line Interface to build Onyx applications even faster!
    section.community
      .stripes
        .stripe
      .wrapper
        .item
          .content
            h2.heading
              i.twa.twa-lg.twa-busts-in-silhouette
              |  Driven by community
            p
              | We believe that open-source software benefits everyone, that's why Onyx Framework is licensed under MIT. You can participate in the development process by opening issues and pull requests on GitHub and communicating in our&nbsp;
              a(href="https://gitter.im/onyxframework" target="_blank") Gitter chat
              | .
          a.link(href="https://github.com/onyxframework") Visit GitHub →
        .item
          .content
            h2.heading
              i.twa.twa-lg.twa-dove
              |  Supported by you
            p We also believe in fair usage of the open-source software. Continuous financing ensures long life and prosperity of the project. Join the list of patrons which help Onyx Framework to evolve or make your company one of the sponsors.
          router-link.link(to="/patrons") See the patrons →
    section.customers
      .wrapper
        a(href="https://github.com/vladfaust/crystalworld" target="_blank")
          img(src="/img/crystalworld-logo-small.png")
    section.bottom
      .stripes
        .stripe
      .wrapper
        a.card(href="https://blog.onyxframework.org")
          h2.header
            i.twa.twa-lg.twa-newspaper
            |  Visit our blog →
          p.content Read Onyx Framework development and community news, learn about its powers and how-to's.
        a.card(href="https://docs.onyxframework.org")
          h2.header
            i.twa.twa-lg.twa-books
            |  Explore the docs →
          p.content Start building beautiful and fast applications with Onyx Framework in minutes. All you'll need is your laptop and a cup of coffee.
    app-footer
</template>

<script>
  import Header from '@/components/Header.vue'
  import Footer from '@/components/Footer.vue'
  import Features from '@/components/sections/Features.vue'
  import Feature from '@/components/sections/Features/Feature.vue'

  export default {
    components: {
      AppHeader: Header,
      AppFooter: Footer,
      Features,
      Feature
    }
  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/variables.sass'
  @import '@/assets/styles/mixins.sass'

  $border: 1px solid $color-light-gray

  section.hero
    color: white
    text-align: center

    .stripe:nth-of-type(1)
      right: 0
      bottom: -70%
      width: 100%
      height: 100%
      background-color: transparentize(white, 0.9)
      transform: skewY(-20deg)

    .stripe:nth-of-type(2)
      bottom: -70%
      left: 0
      width: 100%
      height: 100%
      background-color: transparentize(white, 0.9)
      transform: skewY(7deg)

    .wrapper
      +center

      flex-direction: column
      margin-top: 10rem
      margin-bottom: 9rem

    .logo
      height: 6rem
      padding: 1rem
      background-color: white
      border-radius: 8px

    .title
      margin-top: 1.25rem

    .description
      max-width: 40rem
      margin-top: 0.75rem
      font-size: 1.2rem

    .button
      margin-top: 1.25rem

  section.features
    z-index: 2

  section.components
    padding: 3rem 0 7rem
    background-color: darken(white, 5)
    border-top: $border

    .bg
      position: absolute
      width: 100%
      height: 100%
      background-image: url('/img/circuit-board.svg')
      background-position: cover
      opacity: 0.025

    .stripe:nth-of-type(1)
      top: -2rem
      left: 0
      z-index: 0
      width: 100%
      height: 4rem
      background-color: white
      transform: skewY(-2deg)

    .wrapper
      +center
      flex-direction: column

      padding-top: 3rem

      > *:not(:first-child)
        margin-top: 1.5rem

      .additional a
        font-weight: bold

    .cards
      display: grid
      grid-column-gap: 1.5rem
      grid-row-gap: 1.5rem
      grid-template-columns: 1fr 1fr 1fr

      @media (max-width: 768px)
        grid-template-columns: auto

    .card
      .description
        margin-bottom: 1rem

      a /* stylelint-disable no-descending-specificity */
        &:hover
          color: black

      &.wip
        color: transparentize(black, 0.6)
        cursor: not-allowed

      .content
        z-index: 1

  section.community
    +center

    color: $color-text-black
    background-color: white
    border-top: $border

    .stripe:nth-of-type(1)
      top: -3rem
      left: 0
      z-index: 0
      width: 100%
      height: 6rem
      background-color: white
      transform: skewY(-2deg)

    /* stylelint-disable no-descending-specificity, rule-empty-line-before */
    .wrapper
      display: grid
      grid-column-gap: 0
      grid-row-gap: 3rem
      grid-template-columns: 1fr 1fr

      @media (max-width: 768px)
        grid-template-columns: auto
        padding: 3rem 2rem

      .item
        display: flex
        flex-direction: column
        justify-content: space-between

        .link
          margin-top: 1rem

          &:hover /* stylelint-disable no-descending-specificity */
            color: black

        @media (min-width: 768px)
          padding: 3rem 2rem

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
      +center

      width: $max-width

      a /* stylelint-disable no-descending-specificity */
        +center
        margin: 0 2rem

        transition: all 0.2s ease-out

        img
          max-width: 100%
          max-height: 3rem
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

      @media (max-width: 768px)
        height: 30rem

    .wrapper
      display: grid
      grid-column-gap: 1.5rem
      grid-row-gap: 1.5rem
      grid-template-columns: 1fr 1fr

      @media (max-width: 768px)
        grid-template-columns: auto

      .card
        padding: 2rem
</style>
