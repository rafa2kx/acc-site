class AddAddressToArticle < ActiveRecord::Migration
  def change

    change_table :articles do |t|
      t.string :address
    end

  end
end
