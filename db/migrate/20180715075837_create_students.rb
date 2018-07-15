class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :student_id, null: false
      t.belongs_to :home_group, foreign_key: true

      t.timestamps
    end
    change_column :home_groups, :title, :string, null: false
  end
end
