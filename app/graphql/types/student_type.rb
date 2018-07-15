module Types
    StudentType = GraphQL::ObjectType.define do
        name "Student"
        description "Student details"

        field :id, !types.ID
        field :name, !types.String
        field :gpa, !types.String

        field :user, !UserType
        field :home_group, !HomeGroupType
        field :records, !RecordType
    end
end
