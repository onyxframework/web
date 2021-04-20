<template lang="pug">
  .sql.view
    app-header(page="sql")
    hero
      template(#title)
        h1 Onyx::SQL
      template(#description)
        p A delightful, type-safe and database-agnostic SQL ORM with clean architecture.
      template(#cta)
        a(href="https://docs.onyxframework.com/sql").button.hover-raise Read the docs
    features(:displayStripes="false")
      feature
        template(#title)
          i.twa.twa-lg.twa-muscle
          |  Powerful
        template(#content)
          p
            | Define fields and references, build&nbsp;
            b type-safe
            |  queries and work with&nbsp;
            b any
            |  SQL database.
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
          i.twa.twa-lg.twa-lollipop
          |  Sweet DSL
        template(#description)
          p(v-highlight)
            | Special&nbsp;
            code.crystal schema
            |  macro makes definition of any model fast, safe and enjoyable.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.com/sql/schema") Read Schema docs →
        template(#example)
          pre(v-highlight)
            code.crystal.
              require "onyx/sql"

              class User
                include Onyx::SQL::Model

                schema users do
                  pkey id : Int32

                  type name : String,
                    not_null: true

                  type created_at : Time,
                    not_null: true,
                    default: true
                end
              end
      example
        template(#title)
          i.twa.twa-lg.twa-elephant
          |  Query builder
        template(#description)
          p The SQL query builder would raise in compilation time on argument type mismatch.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.com/sql/query") Read Query docs →
        template(#example)
          pre(v-highlight)
            code.crystal.
              user = Onyx::SQL.query(User.where(id: 1)).first?
              pp user
              # &lt;User @id=1, @name="John",
              #   @created_at=#&lt;Time ...&gt;&gt;

              User.where(id: "foo") # Compilation-time error
              User.select(:unknown) # Compilation-time error
      example
        template(#title)
          i.twa.twa-lg.twa-link
          |  Joins
        template(#description)
          p The query builder is able to join references, optionally preloading them right into the queried model.
          p
            i.twa.twa-books
            |&nbsp;
            a(href="https://docs.onyxframework.com/sql/query") Read Query docs →
        template(#example)
          pre(v-highlight)
            code.crystal.
              cclass Post
                include Onyx::SQL::Model

                schema posts do
                  pkey id : Int32

                  type author : User,
                    not_null: true,
                    key: "author_id"

                  type content : String,
                    not_null: true

                  type created_at : Time,
                    not_null: true,
                    default: true
                end
              end

              posts = Onyx::SQL.query(Post
                .join(author: true) do |x|
                  x.select(:id, :name)
                  x.where(name: "John")
                end
              )

              pp posts.first
              # &lt;Post @id=1, @author=&lt;User @id=1 @name="John"&gt;,
              #   @content="Hello, world!"&gt;
    links(path="/sql")
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
@import '@/assets/styles/variables.sass'
@import '@/assets/styles/mixins.sass'

footer
  padding-top: 3rem
</style>
