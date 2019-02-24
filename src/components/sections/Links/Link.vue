<template lang="pug">
  .link
    div
      h2.title
        slot(name="title")
      p.content
        slot(name="content")
    div
      slot(name="link")
</template>

<style lang="sass" scoped>
  .link
    display: flex
    flex-direction: column
    justify-content: space-between

    > div:nth-child(2)
      margin-top: 1rem
</style>
