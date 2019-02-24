<template lang="pug">
  section.features
    .stripes(v-if="displayStripes")
      .stripe
    .wrapper
      slot
</template>

<script>
  export default {
    props: {
      displayStripes: {
        type: Boolean,
        default: true
      }
    }
  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/variables.sass'
  @import '@/assets/styles/mixins.sass'

  .features
    +center
    background-color: white

    .stripe:nth-of-type(1)
      top: -3rem
      left: 0
      z-index: 0
      width: 100%
      height: 6rem
      background-color: white
      transform: skewY(-2deg)

    .wrapper
      display: grid
      grid-column-gap: 1.5rem
      grid-row-gap: 1.5rem
      grid-template-columns: 1fr 1fr 1fr

      max-width: calc(#{$max-width} + 4rem)
      padding: 3rem 2rem

      color: $color-text-black

      @media (max-width: 768px)
        grid-template-columns: auto
</style>
