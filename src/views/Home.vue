<template lang="pug">
  .home.view
    app-header
    hero
      template(slot="title") Powerful framework for modern applications
      template(slot="description") Built on Crystal, Onyx Framework brings previously unseen combination of speed and joy to the world of development.
      template(slot="button") Get started
    features
      feature
        template(slot="title") 💨 Fast
        template(slot="content")
          | Onyx Framework is built on&nbsp;
          a(href="https://crystal-lang.org") Crystal
          |  — a compiled language on top of LLVM, which makes it C-fast.
      feature
        template(slot="title") 🔋 Efficient
        template(slot="content") Crystal has minimum footprint in RAM and is compiled to tiny binaries executable on most platforms.
      feature
        template(slot="title") 🔒 Safe
        template(slot="content") Thanks to Crystal being compiled, you can catch bugs during development, reducing the amount of runtime errors.
      feature
        template(slot="title") 👶 Simple
        template(slot="content") Onyx Framework is designed to be as newcomer-friendly as possible, still leaving a space to grow with your knowledge.
      feature
        template(slot="title") 🍃 Beautiful
        template(slot="content") Crystal syntax is heavily inspired by Ruby, making the process of development a true joy while staying full OOP.
      feature
        template(slot="title") 📦 Modular
        template(slot="content") Onyx Framework consists of multiple loosely-coupled components, perfectly designed for common application needs.
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
          //- router-link.card(to="/rest")
          a.card(href="#")
            .content
              h3.title 🌎 Onyx::REST
              p.description A REST framework to build blazingly fast action-based APIs. Features common middleware, routing, strongly-typed HTTP params and JSON rendering.
            a(href="#") Learn more →
          router-link.card(to="/sql")
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
          a.link(href="#") Visit github.com/onyxframework →
        .item
          .content
            h2.heading 💰 Businesses backed
            p We also believe in fair usage of the open-source software. Onyx Framework components have a number of features available to Professional and Enterprise licensees only. Commercial license allows you to join Slack and GitHub Teams-based community, thus able to participate in the development process as well.
          a.link(href="#") Visit onyxframework.com →
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
    app-footer
</template>

<script>
  import Header from '@/components/Header.vue'
  import Footer from '@/components/Footer.vue'
  import Features from '@/components/Features.vue'
  import Feature from '@/components/Feature.vue'
  import Hero from '@/components/Hero.vue'

  export default {
    components: {
      AppHeader: Header,
      AppFooter: Footer,
      Features,
      Feature,
      Hero
    }
  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/variables.sass'
  @import '@/assets/styles/mixins.sass'

  $color-light-gray: #f3f3f3
  $border: 1px solid $color-light-gray

  section.components
    padding: 7rem 0 4rem
    background-color: $color-light-gray

    .stripes
      .stripe:nth-of-type(1)
        top: -3rem
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

      .additional a
        font-weight: bold

    .cards
      display: grid
      grid-template-columns: 1fr 1fr 1fr
      grid-column-gap: 1.2rem
      margin-top: 1.4rem

    .card
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

        .link
          margin-top: 1rem

          &:hover /* stylelint-disable no-descending-specificity */
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

    .wrapper
      display: grid
      grid-template-columns: 1fr 1fr
      grid-column-gap: 1.5rem

      .card
        padding: 2rem
</style>
