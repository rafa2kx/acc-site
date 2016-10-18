class AddColumnSlug < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.string :slug
    end
    add_index :articles, :slug, :unique => true
  end
end
