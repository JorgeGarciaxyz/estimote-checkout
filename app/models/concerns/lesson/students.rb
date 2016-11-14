module Lesson::Students
  extend ActiveSupport::Concern
  included do
    def available_students
      Student.all
    end
  end
end
