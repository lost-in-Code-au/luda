module Types
    StudentType = GraphQL::ObjectType.define do
        name "Student"
        description "Student details"

        field :id, !types.ID
        field :name, !types.String
        # field :gpa, !types.String
        
        field :home_group, !HomeGroupType
        field :user, !UserType do
            description "A student's home_group Teacher"
            resolve ->(student, args, ctx) {
                student.home_group.user
            }
        end

        # field :records, !RecordType
    end
end
