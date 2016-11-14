class RemoveLessonIdAndStudentIdFromAssistances < ActiveRecord::Migration[5.0]
  def change
    remove_column :assistances, :lesson_id, :integer
    remove_column :assistances, :student_id, :integer
  end
end
