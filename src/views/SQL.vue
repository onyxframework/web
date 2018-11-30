<template lang="pug">
  .sql.view
    app-header(sub="/sql")
    hero
      template(slot="title") Onyx::SQL
      template(slot="description") A delightful SQL ORM for Crystal.
      template(slot="button") Get started
    features
      feature
        template(slot="title") 💪 Strong
        template(slot="content") All models, queries and calls are type-checked during compilation, reducing the amount of runtime errors.
      feature
        template(slot="title") 🤸‍ Slim
        template(slot="content") Thanks to powerful macros, the amount of boileplate code is minimal. Define schemas and create queries in no-time.
      feature
        template(slot="title") 🐘 Abstract
        template(slot="content")
          | The ORM works with any of&nbsp;
          a(href="https://github.com/crystal-lang/crystal-db") crystal-db
          |  compatible databases, i.e. PostgreSQL, MySQL, SQLite and more.
    section.code-features
      //- .stripes
      //-   .stripe
      .wrapper
        code-feature
          template(slot="title") 🌷 Beautiful mapping
          p(slot="description", v-highlight)
            | Special&nbsp;
            a(href="#") schema
            |  macro makes definition of any model fast and enjoyable.
            br
            br
            | The DSL supports almost all types of&nbsp;
            a(href="#") references
            | , i.e. posts is a one-to-many reference, and referrer is many-to-one.
          template(slot="example")
            pre(v-highlight)
              code.crystal.
                require "onyx-sql"

                class User
                  include Onyx::SQL::Model

                  schema users do
                    pkey id : Int32
                    type name : String
                    type last_name : String?
                    type created_at : Time = DB::Default
                    type posts : Array(Post), foreign_key: "user_id"
                    type referrer : self, key: "referrer_id"
                  end
                end

                user = User.new(name: "John")
        code-feature
          template(slot="title") ✊️ Typed models
          p(slot="description") If you try to set a model field to a wrong type, a compilation time error would be raised!
          template(slot="example")
            pre(v-highlight)
              code.crystal.
                # TODO: Put the error example here,
                # it's likely to be multi-line
                user = User.new(name: 42)

                # TODO: Put the error example here,
                # it's likely to be multi-line
                user.name = 42
        code-feature
          template(slot="title") 👊 Typed queries
          p(slot="description")
            | The&nbsp;
            a(href="#") query builder
            | , beautiful and intuitive, would raise in compilation time on type mismatch as well.
          template(slot="example")
            pre(v-highlight)
              code.crystal.
                q = User.where(id: 1)
                pp q.to_s # SELECT * FROM users WHERE id = ?

                user = repo.query(q).first
                pp user # User(@id=1, @name="John")

                # Compilation-time error
                query = User.where(id: "foo")
        code-feature
          template(slot="title") 🍢 Powerful joins
          p(slot="description")
            | The query builder is able to&nbsp;
            a(href="#") join
            |  references, optionally preloading them right into the queried model.
          template(slot="example")
            pre(v-highlight)
              code.crystal.
                class Post
                  include Onyx::SQL::Model

                  schema posts do
                    pkey id : Int32
                    type content : String
                    type author : User, key: "user_id"
                  end
                end

                query = Post
                  .select(:id)
                  .where(id: 1)
                  .join(:author, select: {:name})

                post = repo.query(query).first
                pp post # Post(@id=1, @author=User(@name="John"))
        code-feature
          template(slot="title") 📜 Sufficient logging
          p(slot="description")
            | A number of built-in&nbsp;
            a(href="#") loggers
            |  log valuable information for further analysis.
          template(slot="example")
            pre(v-highlight)
              code.crystal.
                repo = Onyx::SQL::Repository.new(
                  Onyx::SQL::Logger::Standard.new
                )

                repo.query(User.where(id: 1))
              code.
                <span class="terminal-magenta">[sql] SELECT * FROM users WHERE id = ?</span>
                <span class="terminal-gray">115µs</span>
                <span class="terminal-magenta">[map] User</span>
                <span class="terminal-gray">20µs</span>
        code-feature
          template(slot="title") ⌨️️ Convenient CLI
          p(slot="description")
            | The Onyx&nbsp;
            a(href="#") Command Line Interface
            |  helps to automate routine actions.
          template(slot="example")
            pre(v-highlight)
              code.shell.
                $ onyx model user
                <span class="terminal-gray">Created src/models/user.cr</span>
                $ onyx migration create_users
                <span class="terminal-gray">Created db/migrations/001_create_users.sql</span>
    section.links
      .wrapper
        .link
          div
            h2.title 📚 Documentation
            p.content A structured, well-organaized online-book with code example will guide you through the glorious world of development with Onyx::SQL.
          div
            //- a(href="https://docs.onyxframework.org/sql") Explore at docs.onyxframework.org/sql →
            a.button.small(href="https://docs.onyxframework.org/sql") Explore the docs
        .link
          div
            h2.title ⚙️ API
            p.content
              | Dive into raw methods and classes documentation with API docs automatically built after every commit to the master branch with&nbsp;
              a(href="https://crystal-lang.org/docs/using_the_compiler#crystal-docs") crystal docs
              |  command.
          div
            //- a(href="https://api.onyxframework.org/sql") Open api.onyxframework.org/sql →
            a.button.small(href="https://api.onyxframework.org/sql") Open the API
        .link
          div
            h2.title 🐙 GitHub
            p.content Create issues, propose Pull Requests - the well known GitHub workflow is at your service.
          div
            //- a(href="https://github.com/onyxframework/sql") Visit github.com/onyxframework/sql →
            a.button.small(href="https://github.com/onyxframework/sql") @onyxframework/sql
        .link
          div
            h2.title 💬 Gitter
            p.content Join the talks regarding Onyx::SQL in the instant chatting Gitter room.
          div
            //- a(href="https://gitter.im/onyxframework/sql") Join gitter.im/onyxframework/sql →
            a.button.small(href="https://gitter.im/onyxframework/sql") @onyxframework/sql
        .link
          div
            h2.title 💭 Forum
            p.content
              | Enjoy the civilized discussion and ask thorough questions on our&nbsp;
              a(href="https://www.discourse.org/") Discourse
              | -based forum
          div
            //- a(href="https://forum.crystalcommunity.org/") Go to the forum →
            a.button.small(href="https://forum.crystalcommunity.org/") Go to the forum
        .link
          div
            h2.title 🐦 Twitter
            p.content Subscribe to receive the framework updates and also just to chat a little.
          div
            //- a(href="https://twitter.com/onyxframework") Subsribe to @onyxframework →
            a.button.small(href="https://twitter.com/onyxframework") @onyxframework
    section.commercial
      .stripes
        .stripe
      .wrapper
        a.card(href="https://onyxframework.com/sql")
          div
            h2 💰 Want some more?
            p
              | Along with commercial licenses, Professional&nbsp;
              span.pro pro
              |  and Enterprise&nbsp;
              span.ent ent
              |  users get additonal Onyx::SQL functionality and the following benefits:
            ul
              li Enchanced security with model-migration validations
              li CLI enriched with migrations-related functionality
              li A professional web UI with querying history and stats and errors logging
              li Access to the private GitHub community
              li Access to the Slack team
          div
            a.button(href="https://onyxframework.com/sql") Visit onyxframework.com
    app-footer
</template>

<script>
  import Header from '@/components/Header.vue'
  import Footer from '@/components/Footer.vue'
  import Hero from '@/components/Hero.vue'
  import Features from '@/components/Features.vue'
  import Feature from '@/components/Feature.vue'
  import CodeFeature from '@/components/CodeFeature.vue'

  export default {
    components: {
      AppHeader: Header,
      Hero,
      Features,
      Feature,
      CodeFeature,
      AppFooter: Footer
    }
  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/variables.sass'
  @import '@/assets/styles/mixins.sass'

  $color-light-gray: #f3f3f3

  .features
    padding-bottom: 0.5rem

  .code-features
    padding: 3rem 0
    background-color: white
    border-top: 1px solid $color-light-gray

    .stripe:nth-of-type(1)
      top: -3rem
      left: 0
      z-index: 0
      width: 100%
      height: 6rem
      background-color: white
      transform: skewY(-2deg)

    .wrapper
      display: grid
      grid-row-gap: 1.5rem

  .links
    padding: 3rem 0
    background-color: white
    border-top: 1px solid $color-light-gray

    .wrapper
      display: grid
      grid-template-columns: 1fr 1fr
      grid-column-gap: 1.5rem
      grid-row-gap: 2rem

    .link
      display: flex
      flex-direction: column
      justify-content: space-between

      > div:nth-child(2)
        margin-top: 1rem

  .commercial
    $color-green: #2ea626

    margin-top: -0.5rem
    padding: 0 0 3rem

    .stripe:nth-of-type(1)
      top: -8rem
      left: 0
      width: 100%
      height: 16rem
      background-color: white
      transform: skewY(-2deg)

    .card
      padding: 2rem

      color: $color-text-black
      background: linear-gradient(10deg, transparentize(black, 0.95) 30%, transparent 30%), linear-gradient(-25deg, transparentize(black, 0.92) 40%, transparent 40%)
      background-color: white

      &:hover
        box-shadow: 0 0 100px 5px transparentize($color-green, 0.5)

      > div:nth-child(2)
        text-align: center

    .pro, .ent
      padding: 0.1rem 0.3rem
      color: white
      font-weight: bold
      font-size: 0.7rem
      text-transform: uppercase
      // border: 2px solid black
      border-radius: 4px

    .pro
      background-color: $color-green

    .ent
      background-color: #c0c

    ul
      padding-left: 0
      list-style: none

      li
        &:not(:first-child)
          margin-top: 0.3rem

        &:before
          content: '✅ '

    .button
      background-color: $color-green

      &:hover
        background-color: lighten($color-green, 5)
</style>
