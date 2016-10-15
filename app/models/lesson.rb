class Lesson < ApplicationRecord
  include Lesson::Users
  validates :name, presence: true, uniqueness: true
  validates :classroom, :hour,  presence: true
  belongs_to :user
  delegate :name, to: :user, allow_nil: true, prefix: true
  delegate :last_name, to: :user, allow_nil: true, prefix: true
  # Pending relationships
end
