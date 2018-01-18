class RemoveColumns < ActiveRecord::Migration[5.1]
  def self.up
    remove_column :stories, :sprint
  end
end
