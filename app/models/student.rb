class Student < ApplicationRecord
  validates :full_name, :uuid, :student_number, presence: true, uniqueness: true
end
