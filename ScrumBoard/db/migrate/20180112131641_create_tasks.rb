class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :details
      t.string :story
      t.string :status

      t.timestamps
    end
  end
end
