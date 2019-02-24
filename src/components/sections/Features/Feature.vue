<template lang="pug">
  .feature
    .title
      slot(name="title")
    .content
      slot(name="content")
</template>

<style lang="sass" scoped>
  .feature
    .title
      font-size: 1.5rem
      font-weight: bold

    .content
      margin-top: 1rem
</style>
