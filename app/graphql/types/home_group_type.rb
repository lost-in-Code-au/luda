module Types
    HomeGroupType = GraphQL::ObjectType.define do
        name "HomeGroup"
        description "Student home groups"

        field :id, !types.ID
        field :title, !types.String 
        # do # Add to HomeGroup db:table ", null: false"
        #     resolve ->(home_group, args, ctx) {
        #          home_group.user.email + '_' + home_group.title
        #     }
        # end

        field :user, !UserType
    end
end
