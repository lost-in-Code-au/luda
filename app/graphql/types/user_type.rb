module Types
    UserType = GraphQL::ObjectType.define do
        name "User"
        description "App user"

        field :id, !types.ID
        field :email, !types.String
        field :name, !types.String

        # Ruby to GraphQL example: field :emailAdress, !type.string, property: :email_address
        # :emailAdress in camel case for GraphQL to understand and add the param "property; :email_adress" for Ruby to understand.
        # !type means that this is a non-null field and cannot return null.
    end
end
