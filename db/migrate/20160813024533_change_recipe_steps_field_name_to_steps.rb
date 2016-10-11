class ChangeRecipeStepsFieldNameToSteps < ActiveRecord::Migration
  def change
    rename_column :articles,:recipe_steps,:steps
  end
end
