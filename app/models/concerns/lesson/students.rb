module Lesson::Users
  extend ActiveSupport::Concern
  included do
    def available_students
      Student.all
    end
  end
end
