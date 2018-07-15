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

  field :me, Types::UserType do
    description "The current user"
    resolve ->(user, args, ctx) {
      User.first
    }
  end

  field :all_home_groups, types[Types::HomeGroupType] do
    description "The current user"
    resolve ->(user, args, ctx) {
      HomeGroup.all
    }
  end

  # Example of how to get an array but from GraphQL-ruby 
  # field :someArray, types[Types::SomeArrayType] do
end
