<template lang="pug">
  .feature
    h3.title
      slot(name="title")
    p.content
      slot(name="content")
</template>

<style lang="sass" scoped>
  .feature
    a
      font-weight: bold

    .title
      font-size: 1.5rem
</style>
