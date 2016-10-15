class CreateEnrolledStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :enrolled_students do |t|
      t.references :lesson, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
