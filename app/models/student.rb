class Student < ApplicationRecord
  validates :full_name, :uuid, :student_number, presence: true, uniqueness: true
  validates :full_name, length: { minimum: 6 }
  has_many :enrolled_students, dependent: :destroy
end
