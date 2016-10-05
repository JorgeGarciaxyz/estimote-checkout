class Student < ApplicationRecord
  validates :full_name, :uuid, :student_number, presence: true, uniqueness: true
  validates :full_name, length: { minimum: 6 }
end
