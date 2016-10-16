class EnrolledStudent < ApplicationRecord
  belongs_to :lesson, required: false
  belongs_to :student
  has_many :assistances
  delegate :full_name, to: :student, allow_nil: true, prefix: true
  delegate :student_number, to: :student, allow_nil: true, prefix: true
end
