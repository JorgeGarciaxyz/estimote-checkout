class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @student.update_attributes(student_params)
      redirect_to students_path
    else
      render 'edit'
    end
  end

  def destroy
    if @student.destroy
      redirect_to students_path
    else
      redirect_to root_path
    end
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:full_name, :uuid, :student_number)
    end
    
end
