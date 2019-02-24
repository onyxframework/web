<template lang="pug">
  .sql.view
    app-header(page="sql")
    hero
      template(#title)
        h1 Onyx::SQL
      template(#description)
        p A delightful SQL ORM for Crystal.
      template(#cta)
        a(href="https://docs.onyxframework.org/sql").button.hover-raise Read the docs
    features(:displayStripes="false")
      feature
        template(#title)
          i.twa.twa-lg.twa-muscle
          |  Powerful
        template(#content)
          p Define fields and references, build type-safe queries and work with any SQL database.
      feature
        template(#title)
          i.twa.twa-lg.twa-leaves
          |  Beautiful
        template(#content)
          p
            | Exceptionally&nbsp;
            b expressive
            |  schema DSL allows to define reliable mapping in just a few lines of code.
      feature
        template(#title)
          i.twa.twa-lg.twa-baby
          |  Simple
        template(#content)
          p
            | The ORM is absolutely&nbsp;
            b SOLID
            | , every models is a simple object. No complex ActiveRecord stuff.
    examples
      example
        template(#title)
          i.twa.twa-lg.twa-lock
          |  Type-safe models
        template(#description)
          p(v-highlight)
            | Special&nbsp;
            code.crystal schema
            |  macro makes definition of any model fast, safe and enjoyable.
          p The DSL supports almost all types of references, i.e. in the code aside posts is a one-to-many reference, and referrer is many-to-one.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://api.onyxframework.org/sql/Onyx/SQL/Model.html") Read Model docs →
        template(#example)
          pre(v-highlight)
            code.crystal.
              require "onyx/sql"

              class User
                include Onyx::SQL::Model

                schema users do
                  pkey id : Int32
                  type name : String
                  type last_name : String
                  type created_at : Time, default: true
                  type posts : Array(Post), foreign_key: "user_id"
                  type referrer : self, key: "referrer_id"
                end
              end

              user = User.new(name: "John")

              query = "SELECT * FROM users WHERE id = 1"
              user = Onyx.query(User, query).first
              pp user # =&gt; &lt;User @id=1 @name="John"&gt;
      example
        template(#title)
          i.twa.twa-lg.twa-construction-worker
          |  Query builder
        template(#description)
          p(v-highlight)
            | With Onyx::SQL comes the query builder, beautiful and intuitive, which would raise in compilation time on argument type mismatch on many methods, including&nbsp;
            code.crystal where
            |  and&nbsp;
            code.crystal join
            | .
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://api.onyxframework.org/sql/Onyx/SQL/Query.html") Read Query docs →
        template(#example)
          pre(v-highlight)
            code.crystal.
              user = User.new(name: "John")
              user = Onyx.query(user.insert).first
              pp user.id # =&gt; 1

              changeset = user.changeset

              # Compilation-time error, `name` must be `String`
              changeset.update(name: 42)

              changeset.update(name: "Jake") # OK
              Onyx.exec(user.update(changeset))

              # Compilation-time error, `id` must be `Int32`
              query = User.where(id: "foo")

              query = User.where(id: 1) # OK
              pp query.to_s # "SELECT * FROM users WHERE id = ?"

              user = Onyx.query(query).first
              pp user # =&gt; &lt;User @id=1 @name="John"&gt;
      example
        template(#title)
          i.twa.twa-lg.twa-link
          |  Powerful joins
        template(#description)
          p The query builder is able to join references, optionally preloading them right into the queried model.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://api.onyxframework.org/sql/Onyx/SQL/Query.html#join%28%2A%2Con%3AString%3F%3Dnil%2Cas_as%3AString%3F%3Dnil%2Ctype%3AJoinType%3D%3Ainner%2C%2A%2Avalues%3A%2A%2AU%2C%26block%29%3AselfforallU-instance-method") Read join docs →
        template(#example)
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
                .join(author: true) do |q|
                  q.select(:name)
                end

              post = repo.query(query).first
              pp post # =&gt; &lt;Post @author=&lt;User @name="John"&gt;&gt;
      example
        template(#title)
          i.twa.twa-lg.twa-scroll
          |  Beautiful logging
        template(#description)
          p A number of built-in loggers will log valuable information for further analysis.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://api.onyxframework.org/sql/Onyx/SQL/Repository/Logger.html") Read Logger docs →
        template(#example)
          pre(v-highlight)
            code.crystal.
              Onyx.query(User.where(id: 1))
            code.
              <span class="terminal-magenta">[sql] SELECT * FROM users WHERE id = ?</span>
              <span class="terminal-gray">115µs</span>
              <span class="terminal-magenta">[map] User</span>
              <span class="terminal-gray">20µs</span>
    links(path="/sql")
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

  footer
    padding-top: 3rem
</style>
