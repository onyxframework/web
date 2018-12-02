<template lang="pug">
  .sql.view
    app-header(component="sql")
    section-component-hero
      template(slot="title") Onyx::SQL
      template(slot="description") A delightful SQL ORM for Crystal.
      template(slot="button") Read the docs
    section-features
      feature
        template(slot="title") 🔒 Type-safe
        template(slot="content") All models and method calls are type-checked during compilation, reducing the amount of runtime errors.
      feature
        template(slot="title") 🤸‍ Slim
        template(slot="content") Thanks to the powerful macros, the amount of boileplate code is minimal. Define schemas, insert and update models in no-time.
      feature
        template(slot="title") 🐘 Abstract
        template(slot="content")
          | The ORM works with any of&nbsp;
          a(href="https://github.com/crystal-lang/crystal-db") crystal-db
          |  compatible databases, i.e. PostgreSQL, MySQL, SQLite and more.
      feature
        template(slot="title") ⏱ Fast
        template(slot="content") Thanks to Crystal, the process of model mapping usually takes microseconds.
      feature
        template(slot="title") 📝 Extensible
        template(slot="content")
          | Onyx::SQL only takes care of mapping and building queries to raw SQL, thus leaving space to further extensions.
      feature
        template(slot="title") 🍃 Beautiful
        template(slot="content") Crystal's syntax is inspired by Ruby, making it an absolute joy. Onyx::SQL aims to keep the beauty as much as possible.
    section-examples
      example
        template(slot="title") 🔒 Type-safe mapping
        template(slot="description")
          p(v-highlight)
            | Special&nbsp;
            code.crystal schema
            |  macro makes definition of any model fast, safe and enjoyable.
          p The DSL supports almost all types of references i.e. posts is a one-to-many reference, and referrer is many-to-one.
          p
            a(href="#") 📚 Read schema docs →
            br
            a(href="#") 📚 Read about type safety →
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

              query = "SELECT * FROM users WHERE id = 1"
              user = repo.query(User, query).first
              pp user # User(@id=1, @name="John")

              # Compilation-time error, wrong name type
              User.new(name: 42)

              # Compilation-time error, wrong name type
              user.name = 42
      example
        template(slot="title") ♻️ Insert and update
        template(slot="description")
          p These are convenient and type-safe as well!
          p
            a(href="#") 📚 Read insert docs →
            br
            a(href="#") 📚 Read update docs →
        template(slot="example")
          pre(v-highlight)
            code.crystal.
              user = User.new(name: "John")
              user = repo.query(user.insert).first
              pp user.id # 1

              changeset = user.changeset
              changeset.name = 42 # Compilation-time error
              changeset.name = "Jake"
              repo.exec(changeset.update)

              query = "SELECT name FROM users WHERE id = ?"
              pp repo.scalar(query, 1) # "Jake"
      example
        template(slot="title") 📜 Logging
        template(slot="description")
          p A number of built-in loggers will log valuable information for further analysis.
          p
            a(href="#") 📚 Read about loggers →
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
      example
        template(slot="title")
          span.pro
          |  Query builder
        template(slot="description")
          p With Onyx::SQL Pro comes the query builder, beautiful and intuitive, which would raise in compilation time on argument type mismatch.
          p
            a(href="#") 📚 Read query builder docs →
            br
            a(href="#") 💰 Compare licenses →
        template(slot="example")
          pre(v-highlight)
            code.crystal.
              q = User.where(id: 1)
              pp q.to_s # SELECT * FROM users WHERE id = ?

              user = repo.query(q).first
              pp user # User(@id=1, @name="John")

              # Compilation-time error
              query = User.where(id: "foo")
      example
        template(slot="title")
          span.pro
          |  Powerful joins
        template(slot="description")
          p The query builder is able to join references, optionally preloading them right into the queried model.
          p
            a(href="#") 📚 Read join docs →
            br
            a(href="#") 💰 Compare licenses →
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
    section-links(path="/sql")
    commercial(path="/sql")
      template(slot="title") 💰 Want some more?
      ul(slot="benefits")
        li Top-level macros to reduce boilerplate code, i.e. singleton repository
        li Convenient CLI to automate routine actions
        li A professional web UI with querying history, stats and errors logging
        li Web UI seamlessly integrated with Onyx::REST and Onyx::Background
        li
          span.ent
          |  Compilation-time query validations
        li
          span.ent
          |  Compilation-time model-migration validations
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
  @import '@/assets/styles/variables.sass'
  @import '@/assets/styles/mixins.sass'

  .features
    padding-bottom: 0.5rem
</style>
