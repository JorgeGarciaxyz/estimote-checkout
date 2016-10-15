class Lesson < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :classroom, :hour,  presence: true

  # Pending relationships
end
