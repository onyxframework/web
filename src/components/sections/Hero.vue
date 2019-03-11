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

<style lang="sass" scoped>
  @import '@/assets/styles/mixins.sass'

  .hero
    color: white
    text-align: center

    .wrapper
      +center

      flex-direction: column
      margin-top: 5rem
      margin-bottom: 3.5rem

    .title
      margin-top: 1.25rem

    .description
      max-width: 20rem
      margin-top: 0.5rem
      font-size: 1.1rem

    .cta
      margin-top: 1rem
</style>
