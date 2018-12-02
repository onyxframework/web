<template lang="pug">
  section.commercial
    .stripes
      .stripe(:style="{ top: '-' + stripeHeight, height: 'calc(' + stripeHeight + ' * 2)' }")
    .wrapper
      a.card(:href="'https://onyxframework.com' + path")
        div
          h2.title 💰 Want some more?
          p.description
            | Along with commercial licenses and access to private Slack and GitHub communities, Professional&nbsp;
            span.pro
            |  and Enterprise&nbsp;
            span.ent
            |  users get additonal benefits, including:
          .benefits
            slot(name="benefits")
        div
          p See the full comparison:
          a.button(:href="'https://onyxframework.com' + path") Visit onyxframework.com{{path}}
</template>

<script>
  export default {
    props: {
      path: {
        type: String,
        required: true
      },
      stripeHeight: {
        type: String,
        default: '8rem'
      }
    }
  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/variables.sass'

  .commercial
    $color-green: #2ea626

    margin-top: -0.5rem
    padding: 0 0 3rem

    .stripe:nth-of-type(1)
      // top: -8rem
      left: 0
      width: 100%
      // height: 16rem
      background-color: white
      transform: skewY(-2deg)

    .card
      padding: 2rem

      color: $color-text-black
      background: linear-gradient(10deg, transparentize(black, 0.95) 30%, transparent 30%), linear-gradient(-25deg, transparentize(black, 0.92) 40%, transparent 40%)
      background-color: white

      &:hover
        box-shadow: 0 0 50px 10px white

      > div:nth-child(1)
        display: flex
        flex-direction: column
        align-items: center

      > div:nth-child(2)
        text-align: center

        p
          margin-bottom: 0.5rem
          font-size: 0.9rem

    .description
      text-align: center

    ul
      padding-left: 0
      list-style: none

      li
        &:not(:first-child)
          margin-top: 0.4rem

        &:before
          content: '✅ '

    .button
      background-color: $color-green

      &:hover
        background-color: lighten($color-green, 5)
</style>
