class AddEnrolledStudentIdToAssistances < ActiveRecord::Migration[5.0]
  def change
    add_column :assistances, :enrolled_student_id, :integer
  end
end
