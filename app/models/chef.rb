class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def chef_ingredients
    Ingredient.joins(:dishes_ingredients).distinct.pluck(:name)
  end

end
