<template lang="pug">
  .view.patrons
    app-header(page="patrons")
    hero
      template(#additional)
        .background
      template(#title)
        h1 Patrons
      template(#description)
        p A list of backers who make it possible for Onyx Framework to live long and prosper.
      template(#cta)
        a(href="https://patreon.com/vladfaust" target="_blank").button.hover-raise Become a patron
    section.patrons
      .stripes
        .stripe
        .stripe
      .wrapper
        .tier-title.rare
          .name-wrapper
            .name Rare tier supporters
        ul.supporters
          li
            a(href="https://github.com/ljuti" target="_blank") Lauri Jutila
          li
            a(href="https://seendex.ru" target="_blank") Alexander Maslov
        .tier-title.uncommon
          .name-wrapper
            .name Uncommon tier supporters
        ul.supporters
          li Dainel Vera
        .tier-title.special
          .name-wrapper
            .name Special thanks
        ul.supporters
          li
            a(href="https://github.com/Pomis" target="_blank") Roman Ismagilov
          li
            a(href="https://www.researchgate.net/profile/Ilya_Kudrov" target="_blank") Ilya Kudrov
          li Mark Gromov
          li Dmitry Antipov
    app-footer
</template>

<script>
  import Header from '@/components/Header.vue'
  import Hero from '@/components/sections/Hero.vue'
  import Footer from '@/components/Footer.vue'

  export default {
    components: {
      AppHeader: Header,
      Hero,
      AppFooter: Footer
    }
  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/variables.sass'
  @import '@/assets/styles/mixins.sass'

  .hero
    position: relative

    .background
      position: absolute
      top: 5%
      left: 5%
      width: 90%
      height: 90%
      background-image: url('/img/wreath.svg')
      background-repeat: round
      background-size: 100px
      transform: skewY(-2deg)
      opacity: 0.025

    .button
      background-color: #f96854

      &:hover
        color: black
        background-color: gold
        box-shadow: 0 0 100px 0 gold

  section.patrons
    margin: 3rem 0
    padding: 2rem 0
    background: white

    .stripe
      left: 0
      z-index: 0
      width: 100%
      height: 6rem

    .stripe:nth-of-type(1)
      top: -3rem
      background-color: white
      transform: skewY(-2deg)

    .stripe:nth-of-type(2)
      bottom: -3rem
      background-color: white
      transform: skewY(-2deg)

    .wrapper
      +center
      flex-direction: column

      & > *:last-child
        margin-bottom: -0.5rem

    .tier-title
      $magic: 0.8rem

      width: 100%
      margin-bottom: $magic
      text-align: center
      border-bottom: 1.5px solid

      .name-wrapper
        margin-bottom: -$magic

      .name
        display: inline-block
        padding: 0 1rem
        font-weight: bold
        font-size: 1.5rem
        background-color: white

      &.rare
        color: #3f51b5

      &.uncommon
        color: #2e7d32

      &.special
        color: #455a64

    ul.supporters
      margin: 1rem 0
      padding: 0
      text-align: center

      li
        font-size: 1.1rem

  footer
    padding-top: 3rem
</style>
