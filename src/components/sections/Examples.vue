<template lang="pug">
  section.examples
    .wrapper
      slot
</template>

<style lang="sass" scoped>
  @import '@/assets/styles/variables.sass'

  .examples
    padding: 3rem 0
    background-color: white
    border-top: 1px solid $color-light-gray

    .wrapper
      display: grid
      grid-row-gap: 1.5rem

      @media (max-width: 768px)
        grid-row-gap: 3rem
</style>
