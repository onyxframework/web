<template lang="pug">
  .rest.view
    app-header(page="http")
    hero
      template(#title)
        h1 Onyx::HTTP
      template(#description)
        p A collection of HTTP middleware for Crystal.
      template(#cta)
        a(href="https://docs.onyxframework.org/http").button.hover-raise Read the docs
    features(:displayStripes="false")
      feature
        template(#title)
          i.twa.twa-lg.twa-sparkles
          |  Abstract
        template(#content)
          p
            | Onyx::HTTP acts as&nbsp;
            b foundation
            |  for other Onyx components, but it also can be used stand-alone.
      feature
        template(#title)
          i.twa.twa-lg.twa-thumbsup
          |  Sufficient
        template(#content)
          p It is shipped with routing, errors rescuing, request logging and more, as well as a beautiful server wrapper.
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
          i.twa.twa-lg.twa-violin
          |  Expressive by nature
        template(#description)
          p
            | Paired with&nbsp;
            a(href="https://github.com/onyxframework/onyx") Onyx
            |  top-level macros, the framework allows to define endpoints and launch the server just in few lines of code.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.org/http") Get started →
        template(#example)
          pre(v-highlight)
            code.crystal.
              require "onyx/http"

              Onyx.get "/" do |env|
                env.responser &lt;&lt; "Hello, world!"
              end

              Onyx.listen
      example
        template(#title)
          i.twa.twa-lg.twa-scroll
          |  Rich logging
        template(#description)
          p The default logger logs request response times, as well as their UUIDs and status codes and also errors.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.org/http/logging") Read about logging →
        template(#example)
          pre(v-highlight)
            code.
              <span class="terminal-green">▶</span> Onyx::HTTP::Server is listening at localhost:5000
              <span class="terminal-gray">[d864f2fc]</span>    <span class="terminal-red"><bold>GET</bold> /items/1 <bold>404</bold></span> <span class="terminal-gray">1.145ms</span>
              <span class="terminal-gray">[a21bb87b]</span>   <span class="terminal-green"><bold>POST</bold> /items <bold>201</bold></span> <span class="terminal-gray">8.259ms</span>
              <span class="terminal-gray">[3f7dbe21]</span>    <span class="terminal-green"><bold>GET</bold> /items <bold>200</bold></span> <span class="terminal-gray">11.09ms</span>
              ^C
              <span class="terminal-red">▶</span> Onyx::HTTP::Server is shutting down!
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
