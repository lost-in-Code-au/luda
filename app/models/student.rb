class Student < ApplicationRecord
  belongs_to :home_groups
  has_many :records
end
