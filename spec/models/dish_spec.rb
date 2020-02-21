require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dishes_ingredients}
    it {should have_many(:ingredients).through(:dishes_ingredients)}
  end

  describe "calorie_count" do
    it "can total the calories in a dish" do
    @chef = Chef.create!(name: "Wilson")
    @ingredient_1 = Ingredient.create!(name: "Cheese", calories: 100)
    @ingredient_2 = Ingredient.create!(name: "Noodles", calories: 200)
    @dish_1 = @chef.dishes.create!(name: "Noodles and Cheese", description: "It's not Mac and Cheese")
    @dishes_ingredients1 = DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @dishes_ingredients1 = DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)

    expect(@dish_1.calorie_count).to eq(300)
    end
  end
end
