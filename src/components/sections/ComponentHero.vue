<template lang="pug">
  section.component-hero
    .stripes
      .stripe
      .stripe
    .wrapper
      h1.title
        slot(name="title")
      p.description
        slot(name="description")
      a.button.hover-raise(:href="buttonUrl")
        slot(name="button")
</template>

<script>
  export default {
    props: {
      buttonUrl: {
        type: String,
        default: '#'
      }
    }
  }
</script>

<style lang="sass">
  @import '@/assets/styles/mixins.sass'

  .component-hero
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
      img
        height: 5rem
        padding: 1rem
        background-color: white
        border-radius: 8px

      &:hover
        box-shadow: 0 3px 15px 0 rgba(black, 0.1)
        transform: translateY(-2px)

    .title
      margin-top: 1.25rem

    .description
      max-width: 40rem
      margin-top: 0.75rem

    .button
      margin-top: 1.25rem
</style>
