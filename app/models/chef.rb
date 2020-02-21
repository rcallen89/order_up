class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def chef_ingredients
    Ingredient.joins(:dishes_ingredients).distinct.pluck(:name)
  end

  def three_most_pop
    require 'pry'; binding.pry
    Ingredient.joins(:dishes_ingredients).group_by(:ingredient_id).count(:ingredient_id)
  end

end
