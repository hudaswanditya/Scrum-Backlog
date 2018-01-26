class RemoveSortFormStory < ActiveRecord::Migration[5.1]
  def change
    remove_column :stories, :sort
  end
end
