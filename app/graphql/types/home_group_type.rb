module Types
    HomeGroupType = GraphQL::ObjectType.define do
        name "HomeGroup"
        description "Student home groups"

        field :id, !types.ID
        field :title, !types.String 
        field :user, !UserType
        field :student, !StudentType

        field :students, types[Types::StudentType] do
            description "A home_group's student"
            resolve ->(home_group, args, ctx) {
              home_group.students.all
            }
        end
    end
end

#  Example custom reslover in queries!
#  field :title, !types.String do
#     resolve ->(home_group, args, ctx) {
#          home_group.user.email + '_' + home_group.title
#     }
# end