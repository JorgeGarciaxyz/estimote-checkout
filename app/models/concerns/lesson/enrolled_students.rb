module Lesson::EnrolledStudents
  extend ActiveSupport::Concern
  included do
    def available_enrolled_students
      enrolled_students = Student.all.map do |student|
        EnrolledStudent.new(student_id: student.id, lesson_id: self.id)
      end
    end
  end
end
