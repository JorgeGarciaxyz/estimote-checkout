class Lesson < ApplicationRecord
  include Lesson::Users
  include Lesson::Students
  validates :name, presence: true, uniqueness: true
  validates :classroom, :hour,  presence: true
  belongs_to :user
  delegate :name, to: :user, allow_nil: true, prefix: true
  delegate :last_name, to: :user, allow_nil: true, prefix: true
  # Pending relationships
  has_many :enrolled_students, dependent: :destroy
  accepts_nested_attributes_for :enrolled_students, allow_destroy: true, update_only: true

end
