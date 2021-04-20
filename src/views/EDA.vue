<template lang="pug">
  .rest.view
    app-header(page="eda")
    hero
      template(#title)
        h1 Onyx::EDA
      template(#description)
        p An Event-Driven Architecture framework to build reactive applications.
      template(#cta)
        a(href="https://docs.onyxframework.com/http").button.hover-raise Read the docs
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
            a(href="https://docs.onyxframework.com/eda") Get started →
        template(#example)
          pre(v-highlight)
            code.crystal.
              require "onyx/eda/memory"

              struct NewUser
                include Onyx::EDA::Event

                getter id

                def initialize(@id : Int32)
                end
              end
      example
        template(#title)
          i.twa.twa-lg.twa-two
          |  Subscribe to events
        template(#description)
          p Subscribers will get notified as soon as the event is emitted.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.com/eda/subscriptions") Read about subscriptions →
        template(#example)
          pre(v-highlight)
            code.crystal.
              class NewUserNotifier
                include Onyx::EDA::Subscriber(NewUser)

                def handle(event)
                  puts "New user created with id \#{event.id}"
                end
              end

              NewUserNotifier.new.subscribe(Onyx::EDA.memory)
      example
        template(#title)
          i.twa.twa-lg.twa-three
          |  Emit events
        template(#description)
          p That easy.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.com/eda/subscriptions") Read about subscriptions →
        template(#example)
          pre(v-highlight)
            code.crystal.
              Onyx::EDA.memory.emit(NewUser.new(1))

              # I even have to write some more words
              # To align them with the paragraph aside
              # One line, can you imagine that?!
      example
        template(#title)
          i.twa.twa-lg.twa-electric-plug
          |  Backend of your choice
        template(#description)
          p In addition to an in-memory channel, you can (and should) use Redis channel to build distributed applications.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.com/eda/channel/redis") Read about Redis channel →
        template(#example)
          pre(v-highlight)
            code.crystal.
              require "onyx/eda/redis"

              NewUserNotifier.new.subscribe(Onyx::EDA.redis)

              # From now on, all events are emitted to
              # a Redis stream. And all subscribers
              # read from this stream as well.
              # It's like magic, but not really.
              # The code is pretty simple and transparent.
    links(path="/eda")
    app-footer
</template>

<script>
import Header from "@/components/Header.vue";
import Footer from "@/components/Footer.vue";
import Hero from "@/components/sections/Hero.vue";
import Features from "@/components/sections/Features.vue";
import Feature from "@/components/sections/Features/Feature.vue";
import Examples from "@/components/sections/Examples.vue";
import Example from "@/components/sections/Examples/Example.vue";
import Links from "@/components/sections/Links.vue";

export default {
  components: {
    AppHeader: Header,
    Hero,
    Features,
    Feature,
    Examples,
    Example,
    Links,
    AppFooter: Footer,
  },
};
</script>

<style lang="sass" scoped>
@import '@/assets/styles/mixins.sass'

footer
  padding-top: 3rem
</style>
