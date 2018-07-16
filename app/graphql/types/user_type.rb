module Types
    UserType = GraphQL::ObjectType.define do
        name "User"
        description "App user"

        field :id, !types.ID
        field :email, !types.String
        field :name, !types.String
        
        field :current_home_group, Types::HomeGroupType do
            description "The current home_group"
            resolve ->(user, args, ctx) {
                user.home_groups.last
            }
        end

        field :home_group,  !HomeGroupType do
            argument :id, types.ID
            resolve -> (obj, args, ctx) {
                home_groups.find(args[:id])
            }
        end

        field :home_groups,  types[Types::HomeGroupType] do
            description "A user's home_group"
            resolve ->(user, args, ctx) {
                user.home_groups
            }
        end

        # field :students, types[Types::StudentType] do
        #     description "A home_group's student"
        #     resolve ->(user, args, ctx) {
        #         homegroups = user.home_groups_ids
        #         homegroups.each do | home_group |
        #             home_group.students
        #         end
        #     }
        # end

        # Ruby to GraphQL example: field :emailAdress, !type.string, property: :email_address
        # :emailAdress in camel case for GraphQL to understand and add the param "property; :email_adress" for Ruby to understand.
        # !type means that this is a non-null field and cannot return null.
    end
end
