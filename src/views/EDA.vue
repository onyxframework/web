<template lang="pug">
  .rest.view
    app-header(page="eda")
    hero
      template(#title)
        h1 Onyx::EDA
      template(#description)
        p An Event-Driven Architecture framework to build reactive applications.
      template(#cta)
        a(href="https://docs.onyxframework.org/http").button.hover-raise Read the docs
    features(:displayStripes="false")
      feature
        template(#title)
          i.twa.twa-lg.twa-dash
          |  Fast
        template(#content)
          p
            | Onyx::EDA adds almost&nbsp;
            b no overhead
            | , allowing to get notified about events instantly.
      feature
        template(#title)
          i.twa.twa-lg.twa-gem
          |  Expressive
        template(#content)
          p
            | Subscribe, unsubscribe and emit events — the syntax is&nbsp;
            b simple and straightforward
            | .
      feature
        template(#title)
          i.twa.twa-lg.twa-baby
          |  Simple
        template(#content)
          p
            | Onyx::EDA is also designed to be as easy-to-understand for&nbsp;
            b newcomers
            |  as possible.
    examples
      example
        template(#title)
          i.twa.twa-lg.twa-one
          |  Define events
        template(#description)
          p Events are simple containers for data which is consumed by subscribers.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.org/eda") Get started →
        template(#example)
          pre(v-highlight)
            code.crystal.
              require "onyx/eda"

              struct UserCreated
                include Onyx::EDA::Event

                getter id

                def initialize(@id : Int32)
                end
              end
      example
        template(#title)
          i.twa.twa-lg.twa-two
          |  Subscribe
        template(#description)
          p Subscribers will get notified as soon as the event is emitted.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.org/eda/subscriptions") Read about subscriptions →
        template(#example)
          pre(v-highlight)
            code.crystal.
              class NewUserNotifier
                def initialize
                  channel.subscribe(self, UserCreated) do |event|
                    puts "New user created with id \#{event.id}"
                  end
                end
              end

              NewUserNotifier.new
      example
        template(#title)
          i.twa.twa-lg.twa-electric-plug
          |  Choose backend
        template(#description)
          p In addition to default in-memory channel, you can (and should) use Redis channel to build distributed applications.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.org/eda/channel/redis") Read about Redis channel →
        template(#example)
          pre(v-highlight)
            code.crystal.
              Onyx.channel(:redis)

              # From now on, all events are emitted to
              # a Redis stream. And all subscribers
              # read from this stream as well
    links(path="/eda")
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
