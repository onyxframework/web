<template lang="pug">
  footer
    .wrapper
      .column
        .copyright © Fancy Software LLC
      .column
      .column
        h4.heading Products
        ul
          li
            a(href="#") REST
          li
            a(href="#") SQL
          li
            a(href="#") Background
      .column
        h4.heading Developers
        ul
          li
            a(href="#") Docs
          li
            a(href="#") API
      .column
        h4.heading Resources
        ul
          li
            a(href="#") GitHub
          li
            a(href="#") Gitter
          li
            a(href="#") Crystal Forum
          li
            a(href="#") Crystal Jobs
          li
            a(href="#") Licensing
      .column
        h4.heading Company
        ul
          li
            a(href="#") About
          li
            a(href="#") Customers
          li
            a(href="#") Affiliate program
          li
            a(href="#") Jobs
</template>

<style lang="sass" scoped>
  @import '@/assets/styles/mixins.sass'

  footer
    +center

    padding-bottom: 3rem
    color: white

    .wrapper
      display: grid
      grid-template-columns: repeat(6, 1fr)
      width: 100%
      max-width: 54rem
      padding-right: 2rem
      padding-left: 2rem

    .copyright
      color: transparentize(white, 0.5)
      font-size: 0.8rem

    .column
      color: transparentize(white, 0.3)
      font-size: 0.8rem
      line-height: 1

      .heading
        margin: 0
        font-size: inherit
        text-transform: uppercase

      a
        color: inherit

        &:hover
          color: white

      ul
        padding: 0
        list-style: none

        li
          &:not(:first-of-type)
            margin-top: 0.75rem
</style>
