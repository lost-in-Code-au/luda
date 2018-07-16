class Student < ApplicationRecord
  belongs_to :home_group
  has_many :records
end
