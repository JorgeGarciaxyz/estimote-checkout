class AssistancesController < ApplicationApiController

  include ValidateUserInLesson

  before_action :set_enrolled_student, only: [:create]

  def create
    if uuid_is_valid(create_params[:uuid])
      student_is_in_class = is_student_in_lesson(@enrolled_student, create_params[:lesson_id])
      if student_is_in_class
        if !(Assistance.where("created_at >= ?", Time.zone.today.beginning_of_day).where(enrolled_student_id: @enrolled_student.id).any?)
          Assistance.create(is_present: create_params[:is_present],
                            enrolled_student_id: @enrolled_student.id)
        end
      end
    end
  end

  def set_false_assistances
    lesson = Lesson.find(params[:id])
    lesson.enrolled_students.each do |enrolled_student|
      if !(Assistance.where("created_at >= ?", Time.zone.today.beginning_of_day).where(enrolled_student_id: enrolled_student.id).any?)
        Assistance.create(is_present: false, enrolled_student_id: enrolled_student.id)
      end
    end
  end

  def index
    @lesson = Lesson.find(params[:id])
    render layout: 'application'
  end

  private

  def set_enrolled_student
    if uuid_is_valid(create_params[:uuid])
      student = Student.find_by(uuid: create_params[:uuid])
      @enrolled_student = EnrolledStudent.find_by(student_id: student.id, lesson_id: create_params[:lesson_id])
    end
  end

  def create_params
    params.require(:assistance).permit(:is_present, :uuid, :lesson_id)
  end
end
