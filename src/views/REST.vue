<template lang="pug">
  .rest.view
    app-header(sub="/rest")
    hero
      template(slot="title") Onyx::REST
      template(slot="description") A delightful SQL ORM for Crystal.
      template(slot="button") Read docs
    section.features
      .stripes
        .stripe
      .wrapper
        feature
          template(slot="title") Beautiful mapping
          p(slot="description")
            | With special schema definition DSL defining a model is fast and convenient.
            br
            br
            | The DSL supports all types of references, i.e.&nbsp;
            code.crystal posts
            |  is a one-to-many reference, and&nbsp;
            code.crystal referrer
            |  is many-to-one.
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
        feature
          template(slot="title") Strongly-typed models
          p(slot="description") If you try to set a model field to a wrong type, a compilation time error would be raised!
          template(slot="example")
            pre(v-highlight)
              code.crystal.
                # TODO: Put the error example here,
                # it's likely to be multi-line
                user = User.new(name: 42)

                # TODO: Put the error example here,
                # it's likely to be multi-line
                user.name = 42
        feature
          template(slot="title") Strongly-typed query builder
          p(slot="description") It's beautiful and intuitive, would raise in compilation time on type mismatch as well.
          template(slot="example")
            pre(v-highlight)
              code.crystal.
                q = User.where(id: 1)
                pp q.to_s # SELECT * FROM users WHERE id = ?

                user = Onyx::SQL::Repository.new.query(q).first
                pp user # User(@id=1, @name="John")

                # Compilation-time error
                query = User.where(id: "foo")
        feature
          template(slot="title") First-class joins support
          p(slot="description") The query builder is able to join references, optionally preloading them right into the queried model.
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
                  .select(:content)
                  .where(id: 1)
                  .join(:author, select: {:name})

                post = repo.query(query).first
                pp post # Post(@id=1, @author=User(@name="John"))
    app-footer
</template>

<script>
  import Header from '@/components/Header.vue'
  import Footer from '@/components/Footer.vue'
  import Hero from '@/components/Hero.vue'
  import Feature from '@/components/CodeFeature.vue'

  export default {
    components: {
      AppHeader: Header,
      Hero,
      Feature,
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
