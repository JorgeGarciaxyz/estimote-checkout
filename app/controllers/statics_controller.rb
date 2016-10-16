class StaticsController < ApplicationController

  def home
    #Current user lessons
    @lessons = Lesson.where(user_id: current_user )
  end

  def students_menu
  end

end
