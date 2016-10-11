class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :article_id
      t.string :name
      t.timestamps null: false
    end
  end
end
