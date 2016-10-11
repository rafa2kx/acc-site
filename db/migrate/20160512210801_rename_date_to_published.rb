class RenameDateToPublished < ActiveRecord::Migration
  def change
    rename_column :articles,:date,:published
  end
end
