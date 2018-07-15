Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # TODO: Remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :me, Types::UserType do
    description "The current user"
    resolve ->(obj, args, ctx) {
      User.first
    }
  end

  # field :home_group do 
  #   Types::HomeGroupType
  #   argument :id, !types.ID
  #   description "Find home_group"
  #   resolve ->(obj, args, ctx) {
  #     HomeGroup.find(arg["id"])
  #   }
  # end
  
end
