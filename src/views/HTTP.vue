<template lang="pug">
  .rest.view
    app-header(page="http")
    hero
      template(#title)
        h1 Onyx::HTTP
      template(#description)
        p An opinionated web framework to build scalable web applications.
      template(#cta)
        a(href="https://docs.onyxframework.org/http").button.hover-raise Read the docs
    features(:displayStripes="false")
      feature
        template(#title)
          i.twa.twa-lg.twa-dash
          |  Fast
        template(#content)
          p
            | Powered by Crystal, the framework has&nbsp;
            b outstanding
            |  performance comparable to Go and even C.
      feature
        template(#title)
          i.twa.twa-lg.twa-gem
          |  Expressive
        template(#content)
          p
            | Onyx::HTTP has a&nbsp;
            b beautiful
            |  DSL to build full-featured and safe applications in less time.
      feature
        template(#title)
          i.twa.twa-lg.twa-baby
          |  Simple
        template(#content)
          p
            | Onyx::HTTP, just as other Onyx components, is designed to be as simple for&nbsp;
            b newcomers
            |  as possible.
    examples
      example
        template(#title)
          i.twa.twa-lg.twa-candy
          |  Sweet DSL
        template(#description)
          p
            | The framework allows to run a server in just a few lines of code.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.org/http") Get started →
        template(#example)
          pre(v-highlight)
            code.crystal.
              require "onyx/http"

              Onyx.get "/" do |env|
                env.response << "Hello, world!"
              end

              Onyx.listen
      example
        template(#title)
          i.twa.twa-lg.twa-bus-stop
          |  Endpoints
        template(#description)
          p
            | You can encapsulate your business logic into separate endpoint objects.
            br
            br
            | They would parse incoming params and emit resulting views to render, as well as take care of expected errors.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.org/http/endpoints") Read about endpoints →
        template(#example)
          pre(v-highlight)
            code.
              struct GetUser
                include Onyx::HTTP::Endpoint

                params do
                  path do
                    type id : Int32
                  end
                end

                errors do
                  type UserNotFound(404)
                end

                def call
                  user = Onyx.query(User
                    .where(id: params.path.id)
                  ).first?
                  raise UserNotFound.new unless user

                  return UserView.new(user)
                end
              end

              Onyx.get "/users/:id", GetUser
      example
        template(#title)
          i.twa.twa-lg.twa-eyes
          |  Views
        template(#description)
          p You also can move your rendering logic into separate view objects.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.org/http/views") Read about views →
        template(#example)
          pre(v-highlight)
            code.
              struct UserView
                include Onyx::HTTP::View

                def initialize(@user : User)
                end

                json id: @user.id, name: @user.name
              end
      example
        template(#title)
          i.twa.twa-lg.twa-zap
          |  Channels
        template(#description)
          p Webosockets can be conveniently wrapped in Channel objects.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.org/http/channels") Read about channels →
        template(#example)
          pre(v-highlight)
            code.
              struct Echo
                include Onyx::HTTP::Channel

                def on_message(message)
                  socket.send(message)
                end
              end

              Onyx.ws "/", Echo
    links(path="/http")
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
  @import '@/assets/styles/mixins.sass'

  footer
    padding-top: 3rem
</style>
