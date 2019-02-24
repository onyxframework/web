<template lang="pug">
  .rest.view
    app-header(page="rest")
    hero
      template(#title)
        h1 Onyx::REST
      template(#description)
        p An opinionated REST framework for Crystal.
      template(#cta)
        a(href="https://docs.onyxframework.org/rest").button.hover-raise Read the docs
    features(:displayStripes="false")
      feature
        template(#title)
          i.twa.twa-lg.twa-rocket
          |  Scalable
        template(#content)
          p
            | Onyx::REST uses action-view approach, which allows applications to&nbsp;
            b scale
            |  without a hassle.
      feature
        template(#title)
          i.twa.twa-lg.twa-lock
          |  Safe
        template(#content)
          p
            | Type-safe params ensure that only&nbsp;
            b valid
            |  HTTP parameters are passed to an endpoint.
      feature
        template(#title)
          i.twa.twa-lg.twa-baby
          |  Simple
        template(#content)
          p
            | Onyx::REST is designed to be simple for newcomers but to&nbsp;
            b grow
            |  with a developer's knowledge of Crystal.
    examples
      example
        template(#title)
          i.twa.twa-lg.twa-clapper
          |  View, Action!
        template(#description)
          p(v-highlight)
            | While&nbsp;
            code.crystal Action
            |  is responsible for encapsulating business logic,&nbsp;
            code.crystal View
            |  object represents the rendering layer.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://api.onyxframework.org/rest/Onyx/REST/Action.html") Read Action docs →
            br
            i.twa.twa-books
            |&nbsp;
            a(href="https://api.onyxframework.org/rest/Onyx/REST/View.html") Read View docs →
        template(#example)
          pre(v-highlight)
            code.crystal.
              require "onyx/rest"

              struct Views::User
                include Onyx::REST::View

                def initialize(@user : ::User)
                end

                json do
                  field "id", @user.id
                end
              end

              struct Actions::Users::Get
                include Onyx::REST::Action

                def call
                  user = User.new(id: 1)
                  return Views::User.new(user)
                end
              end

              Onyx.get "/users", Actions::Users::Get
      example
        template(#title)
          i.twa.twa-lg.twa-label
          |  Handy macros
        template(#description)
          p(v-highlight)
            | You can leverage the language's potential by specifying types of HTTP&nbsp;
            code.crystal params
            |  to cast to, rendering error otherwise. Nested params are supported too.
          p(v-highlight)
            | You can also define&nbsp;
            code.crystal errors
            |  types for a particular action, reducing the possibility of a human mistake and making errors independent from rendering.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://api.onyxframework.org/rest/Onyx/REST/Action.html#params%28%26block%29-macro") Read params docs →
            br
            i.twa.twa-books
            |&nbsp;
            a(href="https://api.onyxframework.org/rest/Onyx/REST/Action.html#errors%28%26block%29-macro") Read errors docs →
        template(#example)
          pre(v-highlight)
            code.crystal.
              struct Actions::Users::Get
                include Onyx::REST::Action

                params do
                  path do
                    type id : Int32
                  end
                end

                errors do
                  type UserNotFound(404)
                end

                def call
                  pp typeof(params.path.id) # Int32

                  if params.path.id &lt; 1
                    raise UserNotFound(404).new
                  end
                end
              end

              Onyx.get "/users/:id", Actions::Users::Get
      example
        template(#title)
          i.twa.twa-lg.twa-zap
          |  Websockets
        template(#description)
          p
            | As the web becomes more interactive, an ability to create websocket connections is crucial for an application.&nbsp;
            i Luckily
            | , it's a no-brainer with Channels.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://api.onyxframework.org/rest/Onyx/REST/Channel.html") Read Channel docs →
        template(#example)
          pre(v-highlight)
            code.crystal.
              class Channels::Notifications
                include Onyx::REST::Channel

                @@subscriptions = Array(self).new

                params do
                  path do
                    type id : Int32
                  end
                end

                def on_open
                  @@subscriptions[params.path.id] = self
                end

                def notify(payload : String)
                  socket.send(payload)
                end

                def self.notify(id : Int32, payload : String)
                  if socket = @@subscriptions[id]?
                    socket.notify(payload)
                  end
                end
              end

              Onyx.ws "/users/:id", Channels::Notifications

              message = "You've got a new message"
              Channels::Notifications.notify(1, message)
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
  @import '@/assets/styles/mixins.sass'

  footer
    padding-top: 3rem
</style>
