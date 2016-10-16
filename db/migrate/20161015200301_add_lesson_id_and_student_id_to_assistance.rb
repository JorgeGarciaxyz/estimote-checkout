class AddLessonIdAndStudentIdToAssistance < ActiveRecord::Migration[5.0]
  def change
    add_column :assistances, :lesson_id, :integer
    add_column :assistances, :student_id, :integer
  end
end
