<template lang="pug">
  .rest.view
    app-header(page="onyx")
    hero
      template(#title)
        h1 Onyx
      template(#description)
        p Top-level macros for daily development.
      template(#cta)
        a(href="https://github.com/onyxframework/onyx").button.hover-raise Go to GitHub
    section.brief
      .wrapper
        h2
          i.twa.twa-lg.twa-bulb
          |  Introduction
        p
          | Unlike in traditinal full-stack frameworks, Onyx components are loosely coupled. You can freely mix the shards in a single application. For example, you can take&nbsp;
          router-link(to="/sql") Onyx::SQL
          |  as an ORM but still stay with your preferred web framework.
        p(v-highlight)
          | Onyx top-level macros (
          a(href="https://github.com/onyxframework/onyx") @onyxframework/onyx
          | ) include some code to make the development easier (e.g.&nbsp;
          code.crystal "onyx/env"
          | ), as well as a DSL code for specific components (e.g.&nbsp;
          code.crystal "onyx/rest"
          | ), but the components themselves are&nbsp;
          b separate
          |  shards, you have to explicitly install them.
    features(:displayStripes="false")
      feature
        template(#title)
          i.twa.twa-lg.twa-leaves
          |  Beautiful
        template(#content)
          p
            | Onyx top-level macros hide the complex framework functionality under an&nbsp;
            b expressive
            |  DSL.
      feature
        template(#title)
          i.twa.twa-lg.twa-muscle
          |  Powerful
        template(#content)
          p
            | The DSL covers many scenarios, fitting almost&nbsp;
            b any application
            |  in the wild world.
      feature
        template(#title)
          i.twa.twa-lg.twa-baby
          |  Simple
        template(#content)
          p
            | Onyx top-level macros is the perfect choice for Crystal&nbsp;
            b newcomers
            |  who want to start easy.
    examples
      example
        template(#title)
          i.twa.twa-lg.twa-inbox-tray
          |  Env loader
        template(#description)
          p(v-highlight)
            | Load environment variables from&nbsp;
            code .env.*
            |  and&nbsp;
            code .env.*.local
            |  files, inspired by VueJS.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="#") Read Env docs →
        template(#example)
          pre(v-highlight)
            code.plaintext.
              # .env.development.local
              DATABASE_URL=sqlite3://./my_database.db
            code.crystal.
              require "onyx/env"

              runtime_env DATABASE_URL # Raise if not set

              pp ENV["DATABASE_URL"]
              # =&gt; "sqlite3://./my_database.db"
      example
        template(#title)
          i.twa.twa-lg.twa-scroll
          |  Logger
        template(#description)
          p Initialize an application-wide, environment-aware logger in one line!
          p
            i.twa.twa-books
            |&nbsp;
            a(href="#") Read Logger docs →
        template(#example)
          pre(v-highlight)
            code.crystal.
              require "onyx/logger"

              Onyx.logger.debug("Hello!")
              Onyx.logger.info("Hello!")
              Onyx.logger.error("Hello!")
            code.plaintext.
              <span class="terminal-gray">DEBUG [01:40:55.330 #29724]</span> Hello!
              <span class="terminal-green"> INFO [01:40:55.345 #29724]</span> Hello!
              <span class="terminal-red">ERROR [01:40:55.353 #29724]</span> Hello!
      example
        template(#title)
          i.twa.twa-lg.twa-computer
          |  REST
        template(#description)
          p(v-highlight)
            | Define routes in one line with&nbsp;
            code.crystal Onyx.get
            |  method and its siblings. Launch the server with default middleware with&nbsp;
            code.crystal Onyx.listen
            | .
          p
            i.twa.twa-link
            |&nbsp;
            router-link(to="/rest") Go to Onyx::REST →
        template(#example)
          pre(v-highlight)
            code.crystal.
              require "onyx/rest"

              struct Hello
                include Onyx::REST::Action

                def call
                  context.response &lt;&lt; "Hello, world!"
                end
              end

              Onyx.get "/", Hello
              Onyx.listen
      example
        template(#title)
          i.twa.twa-lg.twa-elephant
          |  SQL
        template(#description)
          p(v-highlight)
            | Access the singleton repository with&nbsp;
            code.crystal Onyx.query
            | ,&nbsp;
            code.crystal Onyx.scalar
            |  and
            code.crystal Onyx.exec
            |  methods.
          p
            i.twa.twa-link
            |&nbsp;
            router-link(to="/sql") Go to Onyx::SQL →
        template(#example)
          pre(v-highlight)
            code.crystal.
              require "onyx/sql"

              class User
                include Onyx::SQL::Model

                schema users do
                  pkey id : Int32
                  type name : String
                end
              end

              user = Onyx.query(User.where(id: 1)).first?
    links(path="/rest")
    app-footer
</template>

<script>
  import Header from '@/components/Header.vue'
  import Footer from '@/components/Footer.vue'
  import Hero from '@/components/sections/Hero.vue'
  import Features from '@/components/sections/Features.vue'
  import Feature from '@/components/sections/Features/Feature.vue'
  import Examples from '@/components/sections/Examples.vue'
  import Example from '@/components/sections/Examples/Example.vue'
  import Links from '@/components/sections/Links.vue'

  export default {
    components: {
      AppHeader: Header,
      Hero,
      Features,
      Feature,
      Examples,
      Example,
      Links,
      AppFooter: Footer
    }
  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/variables.sass'
  @import '@/assets/styles/mixins.sass'

  .brief
    padding: 3rem 0
    background-color: white
    border-bottom: 1px solid $color-light-gray

    p
      line-height: 1.4

    code
      display: inline
      padding: 0.2rem 0.35rem 0.2rem
      font-size: 0.9rem
      vertical-align: 0.05rem
      border-radius: 3px

    h2
      @media (min-width: 768px)
        text-align: center

  footer
    padding-top: 3rem
</style>
