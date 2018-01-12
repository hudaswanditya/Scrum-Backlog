class CreateSprints < ActiveRecord::Migration[5.1]
  def change
    create_table :sprints do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.string :label

      t.timestamps
    end
  end
end
