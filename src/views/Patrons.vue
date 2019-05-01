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
          i.twa.twa-lg.twa-blue-heart
          |  Rare tier supporters
        ul.supporters
          li
            a(href="https://github.com/ljuti" target="_blank") Lauri Jutila
          li
            a(href="https://seendex.ru" target="_blank") Alexander Maslov
        .tier-title.uncommon
          i.twa.twa-lg.twa-green-heart
          |  Uncommon tier supporters
        ul.supporters
          li Anton Yordanov
          li Dainel Vera
        .tier-title.special
          i.twa.twa-lg.twa-pray
          |  Special thanks
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
      background-size: 110px
      transform: skewY(-2deg)
      opacity: 0.05

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
      font-weight: bold
      font-size: 1.5rem

      text-align: center

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

        a
          color: inherit

  footer
    padding-top: 3rem
</style>
