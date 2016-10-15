class EnrolledStudent < ApplicationRecord
  belongs_to :lesson
  belongs_to :student
  has_many :assistances
end
