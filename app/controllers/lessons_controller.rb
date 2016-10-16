class LessonsController < ApplicationController
  include Factories::LessonFactory
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    custom_params = custom_lesson_params_factory(lesson_params)
    @lesson = Lesson.new(custom_params)
    if @lesson.save
      redirect_to lessons_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @lesson.update_attributes(lesson_params)
      redirect_to lessons_path
    else
      render 'edit'
    end
  end

  def destroy
    if @lesson.destroy
      redirect_to lessons_path
    else
      redirect_to lessons_path
    end
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:name, :hour, :classroom, :user_id,
        enrolled_students_attributes: [:id, :student_id, :is_valid, :lesson_id])
    end
end
