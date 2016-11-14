class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :hour
      t.string :classroom
      t.integer :user_id

      t.timestamps
    end
  end
end
