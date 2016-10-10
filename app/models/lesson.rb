class Lesson < ApplicationRecord
  validates :name, :hour, presence: true, uniqueness: true
  validates :classroom, presence: true
  validates :name, length: { minimum: 6 }

  # Pending relationships
end
