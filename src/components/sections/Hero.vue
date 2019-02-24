<template lang="pug">
  section.hero
    slot(name="additional")
    .wrapper
      .title
        slot(name="title")
      .description
        slot(name="description")
      .cta
        slot(name="cta")
</template>

<style lang="sass">
  @import '@/assets/styles/mixins.sass'

  .hero
    color: white
    text-align: center

    .wrapper
      +center
      flex-direction: column
      margin-top: 5rem
      margin-bottom: 3.5rem

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
      margin-top: 0.5rem

    .cta
      margin-top: 1rem
</style>
