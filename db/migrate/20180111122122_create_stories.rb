class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :name
      t.string :sprint
      t.string :description
      t.string :label
      t.boolean :complete

      t.timestamps
    end
  end
end
