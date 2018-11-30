<template lang="pug">
  section.features
    .stripes
      .stripe
    .wrapper
      slot
</template>

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
      grid-template-columns: 1fr 1fr 1fr
      grid-column-gap: 1.5rem
      grid-row-gap: 1.5rem

      max-width: $max-width
      padding: 2rem 0

      color: $color-text-black
</style>
