 Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :currentUser do
    type Types::UserType
    resolve -> (obj, args, ctx) {
      ctx[:current_user]
    }
  end

  field :me, Types::UserType do
    description "The current user"
    resolve ->(user, args, ctx) {
      User.first
    }
  end

  field :home_groups, Types::HomeGroupType do
    description "The current Teacher's home_group"
    resolve ->(obj, args, ctx) {
      ctx[:current_user].home_groups
    }
  end

  # field :project do
  #   type Types::ProjectType
  #   argument :id, !types.ID
  #   description "Find Project by ID"

  #   resolve -> (obj, arg, ctx) do
  #     GraphQL::QueryResolver.run(Project, ctx, Types::ProjectType) do
  #       GlobalID::Locator.locate_signed(arg["id"])
  #     end
  #   end
  # end

  field :student, Types::StudentType do
    description "A home_group's student"
    resolve ->(student, args, ctx) {
      Student.first
    }
  end

  field :students, types[Types::StudentType] do
    description "A home_group's student"
    resolve ->(student, args, ctx) {
      Student.all
    }
  end
  # Example of how to get an array but from GraphQL-ruby 
  # field :someArray, types[Types::SomeArrayType] do
end
