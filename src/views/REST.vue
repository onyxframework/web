<template lang="pug">
  .rest.view
    app-header(component="rest")
    section-component-hero
      template(slot="title") Onyx::REST
      template(slot="description") An opinionated REST framework for Crystal.
      template(slot="button") Read the docs
    section-features
      feature
        template(slot="title") ⏱ Fast
        template(slot="content") Onyx::REST is built on Crystal -- a compiled language on top of LLVM, which leads to rendering in matter of micro seconds instead of millis.
      feature
        template(slot="title") 🔋 Efficient
        template(slot="content") Compiled Crystal server binaries consume much less RAM than dynamic languages frameworks you got used to.
      feature
        template(slot="title") 🍃 Beautiful
        template(slot="content") Crystal's syntax is inspired by Ruby, making it an absolute joy. Onyx::REST aims to keep the beauty as much as possible.
      feature
        template(slot="title") 🚀 Scalable
        template(slot="content") Onyx::REST uses action-view approach, which allows applications to grow without a hassle.
      feature
        template(slot="title") 🔒 Safe
        template(slot="content") Type-safe params take care of ensuring that only valid HTTP parameters are passed to an endpoint.
      feature
        template(slot="title") 👶 Simple
        template(slot="content") Onyx::REST is designed to be simple for newcomers but to grow with a developer's knowledge of Crystal.
    section-examples
      example
        template(slot="title") 🎬 View, Action!
        template(slot="description")
          p(v-highlight)
            | While&nbsp;
            code.crystal Action
            |  is responsible for encapsulating business logic,&nbsp;
            code.crystal View
            |  object represents the rendering layer and can have any rendering methods, i.e.&nbsp;
            code.crystal .to_json
            |  or&nbsp;
            code.crystal .to_html
            | .
          p
            a(href="#") 📚 Read Action docs →
            br
            a(href="#") 📚 Read View docs →
        template(slot="example")
          pre(v-highlight)
            code.crystal.
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
      example
        template(slot="title") 😎 Handy macros
        template(slot="description")
          p(v-highlight)
            | You can leverage the language's potential by specifying types of HTTP&nbsp;
            code.crystal params
            |  to cast to, rendering error otherwise. Nested params are supported too.
          p
            | You can also define&nbsp;
            code.crystal errors
            |  types for a particular action, reducing the possibility of a human mistake and making errors independent from rendering.
          p
            a(href="#") 📚 Read params docs →
            br
            a(href="#") 📚 Read errors docs →
        template(slot="example")
          pre(v-highlight)
            code.crystal.
              struct Actions::Users::Get
                params do
                  type id : Int32
                end

                errors do
                  type UserNotFound(404)
                end

                def call
                  pp typeof(params.id) # Int32

                  if params.id &lt; 1
                    raise UserNotFound(404).new
                  end
                end
              end
      example
        template(slot="title") ⚡️ Websockets
        template(slot="description")
          p
            | As the web becoming more interactive, an ability to create websocket connections is crucial for an application.&nbsp;
            i Luckily
            | , it's a no-brainer with Channels.
          p
            a(href="#") 📚 Read Channel docs →
        template(slot="example")
          pre(v-highlight)
            code.crystal.
              class Channels::Notifications
                include Onyx::REST::Channel

                @@subscriptions = Array(self).new

                params do
                  type id : Int32
                end

                def on_open
                  @@subscriptions[params.id] = self
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

              Onyx::REST.draw do
                ws "/users/:id", Channels::Notifications
              end

              message = "You've got a new message"
              Channels::Notifications.notify(1, message)
      example
        template(slot="title") 📜 Beautiful logging
        template(slot="description")
          p It's important to have a great developer experience. That's why the visuals are top-notch in Onyx::REST.
          p
            a(href="#") 📚 Read about logging →
        template(slot="example")
          pre(v-highlight)
            code.
              ⬢ Onyx::Server is listening on localhost:5000...

              <span class="terminal-green">   GET /users/1 200</span> <span class="terminal-gray">20µs</span>
              <span class="terminal-red">  POST /users/1 404</span> <span class="terminal-gray">67µs</span>
              <span class="terminal-cyan">    WS /users/1 100</span> <span class="terminal-gray">...</span>

              ⬢ Onyx::Server is shutting down!
      example
        template(slot="title")
          span.pro
          |  Top-level macros
        template(slot="description")
          p One of many Onyx::REST Pro features is useful macros and a singleton server configuration with common middleware set up, which is absolutely optional.
          p(v-highlight)
            | Powerful&nbsp;
            code.crystal auth
            |  macro defines common authentication workflows, including Basic and JWT auth.
          p
            a(href="#") 📚 Read configuration docs →
            br
            a(href="#") 📚 Read auth docs →
            br
            br
            a(href="#") 💰 Compare licenses →
        template(slot="example")
          pre(v-highlight)
            code.crystal.
              struct Actions::User::Get
                auth User # Return 401 if not authenticated

                def call
                  pp typeof(auth.user) # User
                end
              end

              # Auth macro
              Onyx.auth User, jwt: { exp: Time.now + 1.month }

              # Draw routes
              Onyx.get "/user/:id", Actions::User::Get

              # Call .to_json on all views
              Onyx.render(:json)

              # Listen on port 5000
              Onyx.listen(5000)
    section-links(path="/rest")
    commercial(path="/rest", stripe-height="12rem")
      ul(slot="benefits")
        li Top-level macros to reduce boilerplate code, including authentication
        li Convenient CLI to automate routine actions
        li Application structure exporting (i.e. routes, actions, params)
        li A professional web UI with requests analytics and errors logging
        li Web UI seamlessly integrated with Onyx::SQL and Onyx::Background
        li Built-in integrations with third-party services (e.g. Sentry, DataDog)
        li
          span.ent
          |  Reliable multi-threading
        li
          span.ent
          |  SAML SSO authentication
        li
          span.ent
          |  Deep performance insights
    app-footer
</template>

<script>
  import Header from '@/components/Header.vue'
  import Footer from '@/components/Footer.vue'
  import SectionComponentHero from '@/components/sections/ComponentHero.vue'
  import SectionFeatures from '@/components/sections/Features.vue'
  import Feature from '@/components/sections/components/Feature.vue'
  import SectionExamples from '@/components/sections/Examples.vue'
  import Example from '@/components/sections/components/Example.vue'
  import SectionLinks from '@/components/sections/Links.vue'
  import Link from '@/components/sections/components/Link.vue'
  import Commercial from '@/components/sections/Commercial.vue'

  export default {
    components: {
      AppHeader: Header,
      SectionComponentHero,
      SectionFeatures,
      Feature,
      SectionExamples,
      Example,
      SectionLinks,
      XLink: Link,
      Commercial,
      AppFooter: Footer
    }
  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/mixins.sass'

  .features
    padding: 2rem 0
    background-color: white

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
</style>
