class StaticsController < ApplicationController

  def home
    #User lessons
    @lessons = Lesson.where(user_id: current_user )
  end

  def students_menu
  end

end
