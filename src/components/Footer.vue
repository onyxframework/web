<template lang="pug">
  footer
    .wrapper
      .column
        .copyright © Fancy Software LLC
      .column
      .column
        h4.heading Components
        ul
          li
            router-link(to="/http") HTTP
          li
            router-link(to="/sql") SQL
          li
            router-link(to="/eda") EDA
      .column
        h4.heading Developers
        ul
          li
            a(href="https://docs.onyxframework.org") Docs
          li
            a(href="https://api.onyxframework.org") API
      .column
        h4.heading Resources
        ul
          li
            a(href="https://github.com/onyxframework") GitHub
          li
            a(href="https://gitter.im/onyxframework") Gitter
          li
            a(href="https://crystaljobs.org") Crystal Jobs
      .column
        h4.heading Project
        ul
          li
            a(href="https://blog.onyxframework.org") Blog
          li
            a(href="#") About
          li.patrons
            router-link(to="/patrons") Patrons
</template>

<style lang="sass" scoped>
  @import '@/assets/styles/mixins.sass'

  footer
    +center

    padding-bottom: 3rem
    color: white

    .wrapper
      display: grid
      grid-row-gap: 1.5rem
      grid-template-columns: repeat(6, 1fr)
      width: 100%
      max-width: 54rem
      padding-right: 2rem
      padding-left: 2rem

      @media (max-width: 768px)
        grid-template-columns: auto

        .column
          font-size: 1rem

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
        font-weight: normal

        &:hover
          color: white

      ul
        padding: 0
        list-style: none

        li
          &:not(:first-of-type)
            margin-top: 0.75rem

          &.patrons
            color: gold
            text-shadow: 0 0 20px gold
</style>
