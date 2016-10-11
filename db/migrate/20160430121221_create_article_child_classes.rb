class CreateArticleChildClasses < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.string :type
      t.string :classification
      #RECETAS
      t.string :ingredients
      t.string :recipe_steps
      #NOTICIAS, EVENTOS, HISTORIAS
      t.date :date
      t.string :source
      t.string :author
    end


  end
end
