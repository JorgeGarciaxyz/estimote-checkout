class Lesson < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :classroom, :hour,  presence: true
  validates :name, length: { minimum: 6 }

  # Pending relationships
end
