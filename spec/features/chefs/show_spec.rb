require 'rails_helper'

RSpec.describe 'Chef Show Page', type: :feature do
  before :each do
    @chef = Chef.create!(name: "Wilson")
    @ingredient_1 = Ingredient.create!(name: "Cheese", calories: 100)
    @ingredient_2 = Ingredient.create!(name: "Noodles", calories: 200)
    @ingredient_3 = Ingredient.create!(name: "Red Sauce", calories: 200)
    @ingredient_4 = Ingredient.create!(name: "NeverUsedTest", calories: 200)
    @dish_1 = @chef.dishes.create!(name: "Noodles and Cheese", description: "It's not Mac and Cheese")
    @dish_2 = @chef.dishes.create!(name: "Sauce and Noodles", description: "It's really not Mac and Cheese")
    @dishes_ingredients1 = DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @dishes_ingredients2 = DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    @dishes_ingredients3 = DishesIngredient.create!(dish: @dish_2, ingredient: @ingredient_2)
    @dishes_ingredients4 = DishesIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)
  end

  context 'as a visitor' do
    it 'should show name, and a list of ingredient links' do
      visit "/chefs/#{@chef.id}"

      expect(page).to have_content("Name: Wilson")

      click_on "Chef Ingredients"

      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")


      expect(page).to have_content("Cheese")
      expect(page).to have_content("Noodles", count: 1)
      expect(page).to have_content("Red Sauce")
    end
  end
end