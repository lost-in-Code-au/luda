 Types::QueryType = GraphQL::ObjectType.define do
	name "Query"
	# Add root-level fields here.
	# They will be entry points for queries on your schema.

	# TODO: test
	field :testField, types.String do
		description "An example field added by the generator"
		resolve ->(obj, args, ctx) {
			"Hello World!"
		}
	end

	# GraphQl API

	field :currentUser do
		type Types::UserType
		resolve -> (obj, args, ctx) {
			ctx[:current_user]
		}
	end

	field :home_group,  Types::HomeGroupType do
		argument :id, types.ID
		resolve -> (obj, args, ctx) {
			HomeGroup.find(args[:id])
		}
	end

	field :home_groups, Types::HomeGroupType do
		description "The current Teacher's home_group"
		resolve ->(obj, args, ctx) {
			ctx[:current_user].home_groups
		}
	end

	field :student, Types::StudentType do
		description "A home_group's student"
		argument :id, types.ID
		resolve ->(student, args, ctx) {
			Student.find(args[:id])
		}
	end

	field :students, types[Types::StudentType] do
		description "A home_group's student"
		resolve ->(student, args, ctx) {
			Student.all
		}
	end
end

# Example of how to get an array but from GraphQL-ruby 
# field :someArray, types[Types::SomeArrayType] do