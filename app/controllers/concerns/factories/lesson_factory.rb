module Factories::LessonFactory
  extend ActiveSupport::Concern
  included do
    def custom_lesson_params_factory(lesson_params)
      custom_params = Hash.new
      custom_params[:name] = lesson_params[:name]
      custom_params[:hour] = lesson_params[:hour]
      custom_params[:classroom] = lesson_params[:classroom]
      custom_params[:user_id] = lesson_params[:user_id]
      custom_params[:id] = lesson_params[:id] if lesson_params[:id].present?
      custom_params[:enrolled_students_attributes] = custom_enrolled_students_attributes(
        lesson_params[:enrolled_students_attributes])
      custom_params
    end
    def custom_enrolled_students_attributes(enrolled_students_params)
      custom_params = Hash.new
      enrolled_students_params.each_with_index do |(key,values), i|
        if values["is_valid"].present?
          custom_params[i] = values.except("is_valid")
        end
      end
      custom_params
    end
  end
end
