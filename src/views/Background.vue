<template lang="pug">
  .background.view
    app-header(component="background")
    section-component-hero
      template(slot="title") Onyx::Background
      template(slot="description") A fast background job processing for Crystal.
      template(slot="button") Read the docs
    section-features
      feature
        template(slot="title") ⏱ Fast
        template(slot="content") Onyx::Background is built on Crystal, allowing to process tens thousands of jobs per second.
      feature
        template(slot="title") 🔋 Efficient
        template(slot="content") The RAM footprint of Onyx::Background binaries is virtually negliable.
      feature
        template(slot="title") 🔒 Type-Safe
        template(slot="content") A Job takes certain arguments, and it will raise in compile-time on argument type mismatch.
      feature
        template(slot="title") 👍 Agnostic
        template(slot="content") Background is designed to be language-agnostic. Its logic s can be recreated in any language.
      feature
        template(slot="title") ⚖️ Permittable
        template(slot="content") There is no per-host locking or dependency on threads amount. Use it as much as you want.
      feature
        template(slot="title") 🍃 Beautiful
        template(slot="content") Inspired by plain Ruby, the code is full OOP, and the syntax is clean and simple.
    section-examples
      example
        template(slot="title") 🍭 Delightful syntax
        template(slot="description")
          p(v-highlight)
            | Defining a job is as simple as including a module and defining the&nbsp;
            code perform
            |  method.
          p(v-highlight)
            | Job arguments are stored in JSON, and&nbsp;
            code.crystal Onyx::Background::Job
            |  includes&nbsp;
            code.crystal
              a(href="https://crystal-lang.org/api/0.27.0/JSON/Serializable.html", target="_blank") JSON::Serializable
            | , which is pretty straightforward.
          p
            a(href="#") 📚 Read Job docs →
            br
            a(href="#") 📚 Read Manager docs →
            br
            a(href="#") 📚 Read Worker docs →
        template(slot="example")
          pre(v-highlight)
            code.crystal.
              require "onyx-background"

              class MyJob
                include Onyx::Background::Job

                def initialize(@sleep : Int32)
                end

                def perform
                  sleep(@sleep)
                end
              end
            code.crystal.
              require "./my_job"

              manager = Onyx::Background::Manager.new
              manager.enqueue(MyJob.new(5))
            code.crystal.
              require "./my_job"

              worker = Onyx::Background::Worker.new
              worker.run
      example
        template(slot="title") ⏰️ Delayed jobs
        template(slot="description")
          p(v-highlight)
            | It's easy to postpone a job execution, the syntax supports&nbsp;
            code.crystal in:
            |  and&nbsp;
            code.crystal at:
            |  arguments.
          p
            a(href="#") 📚 Read delaying docs →
        template(slot="example")
          pre(v-highlight)
            code.crystal.
              # Enqueue with special arguments
              manager.enqueue(MyJob.new(5), in: 5.minutes)

              # Watcher is required to process ready jobs
              watcher = Onyx::Background::Watcher.new
              watcher.run
      example
        template(slot="title") 👀 Redis-backed UI
        template(slot="description")
          p The open-source version includes a simple Redis-backed VueJS User Interface.
          p
            a(href="#") 📚 Read UI docs →
        template(slot="example")
          img(src="https://placeholder.pics/svg/600x300")
      example
        template(slot="title")
          span.pro
          |  Job tags
        template(slot="description")
          p Job tagging allows to define flexible concurrency limit rules.
          p The limits can also be read from JSON or YAML config files.
          p
            a(href="#") 📚 Read limits docs →
            br
            a(href="#") 💰 Compare licenses →
        template(slot="example")
          pre(v-highlight)
            code.crystal.
              class Jobs::Billing
                tag "stripe"
              end

              # Or declare job tags explicitly
              manager.enqueue(
                Jobs::Billing,
                tags: {"stripe", "stripe:billing"}
              )

              manager.apply_limits({
                stripe: {
                  hour: 60, # Limit to 60 "stripe" jobs per hour
                  billing: {
                    minute: 1
                  }
                }
              })
      example
        template(slot="title")
          span.pro
          |  Waiting
        template(slot="description")
          p(v-highlight)
            code.crystal wait
            |  blocks the program unless all jobs by their UUIDs or tags are performed.
          p
            a(href="#") 📚 Read waiting docs →
            br
            a(href="#") 💰 Compare licenses →
        template(slot="example")
          pre(v-highlight)
            code.crystal.
              uuid = manager.enqueue(MyJob.new(3))

              manager.wait(uuid) do |uuid, success?|
                puts "Finished the job, ✔️ = \#{success?}"
              end

              manager.wait("stipe") do |uuid, success?|
                puts "Finished stripe job \#{uuid}, ✔️ = \#{success?}"
              end

              puts "Finished all stipe jobs!"
      example
        template(slot="title")
          span.pro
          |  CRON jobs
        template(slot="description")
          p It's fairly easy to declare CRON schedule for jobs. It supports reading from JSON or YAML config files as well.
          p
            a(href="#") 📚 Read CRON docs →
            br
            a(href="#") 💰 Compare licenses →
        template(slot="example")
          pre(v-highlight)
            code.crystal.
              scheduler = Onyx::Background::Scheduler.new([
                {
                  description: "My Job running every minute",
                  job: MyJob.new(5),
                  cron: "* * * * *"
                }
              ])

              scheduler.run
    section-links(path="/background")
    commercial(path="/background", stripe-height="16rem")
      template(slot="title") 💰 Want some more?
      ul(slot="benefits")
        li Unlimited hosts to use Onyx::Background on
        li Top-level macros to reduce boilerplate code, i.e. singleton Manager
        li Job tags with concurrency limits
        li Waiting for specific jobs or tags to proceeed
        li CRON jobs scheduling
        li A professional web UI with history and statistics
        li Web UI seamlessly integrated with Onyx::REST and Onyx::Background
        li
          span.ent
          |  Reliable unlimited multi-threading
        li
          span.ent
          |  Logging jobs' output to a backend (Redis or DB)
        li
          span.ent
          |  Redis-side job arguments encryption
        li
          span.ent
          |  Advanced metrics
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
      Commercial,
      AppFooter: Footer
    }
  }
</script>

<style lang="sass" scoped>
  @import '@/assets/styles/variables.sass'
  @import '@/assets/styles/mixins.sass'

  .features
    padding-bottom: 0.5rem
</style>
