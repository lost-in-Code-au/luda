class CreateHomeGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :home_groups do |t|
      t.string :title, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
