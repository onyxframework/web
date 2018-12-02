<template lang="pug">
  .link
    div
      h2.title
        slot(name="title")
      p.content
        slot(name="content")
    div
      a.button.small(:href="url")
        slot(name="link-text")
</template>

<script>
  export default {
    props: {
      url: {
        type: String,
        required: true
      }
    }
  }
</script>

<style lang="sass" scoped>
  .link
    display: flex
    flex-direction: column
    justify-content: space-between

    > div:nth-child(2)
      margin-top: 1rem
</style>
