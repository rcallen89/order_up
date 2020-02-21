require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "chef_ingredients" do
    it 'brings a list of ingredient names use by that chef' do
      @chef = Chef.create!(name: "Wilson")
      @ingredient_1 = Ingredient.create!(name: "Cheese", calories: 100)
      @ingredient_2 = Ingredient.create!(name: "Noodles", calories: 200)
      @ingredient_3 = Ingredient.create!(name: "Test", calories: 200)
      @dish_1 = @chef.dishes.create!(name: "Noodles and Cheese", description: "It's not Mac and Cheese")
      @dishes_ingredients1 = DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
      @dishes_ingredients1 = DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)

      expect(@chef.chef_ingredients).to eq(["Cheese", "Noodles"])
    end
  end
end
