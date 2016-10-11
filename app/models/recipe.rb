class Recipe < Article
  ALL = 'all'
  ANTIQUE_CLASS = 'antiques'
  CLASSIC_CLASS = 'classics'
  MODERN_CLASS = 'moderns'

  before_create :set_recipe_values

  def set_recipe_values
    if !ingredients_before_type_cast.nil?
      ingredients_string = ''
      ingredients_before_type_cast.each do |key, ingredient|
        ingredients_string << "##{ingredient[:name]}"
      end
      self.ingredients = ingredients_string
    end

    # if !steps_before_type_cast.nil?
    #   steps_string = ''
    #   step_number = 0
    #   steps_before_type_cast.each do |key, step|
    #     step_number += 1
    #     steps_string << "##{step_number}- #{step[:name]}"
    #   end
    #   self.steps = steps_string
    # end
  end
end

