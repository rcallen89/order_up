require 'rails_helper'

RSpec.describe 'Dish Show Page', type: :feature do
  before :each do
    @chef = Chef.create!(name: "Wilson")
    @ingredient_1 = Ingredient.create!(name: "Cheese", calories: 100)
    @ingredient_2 = Ingredient.create!(name: "Noodles", calories: 200)
    @dish_1 = @chef.dishes.create!(name: "Noodles and Cheese", description: "It's not Mac and Cheese")
  end
  context 'as a visitor' do
    it 'shows the name of the chef and a list of ingredients' do
      visit "dishes/#{@dish_1.id}"

      expect(page).to have_content("Noodles and Cheese")
      expect(page).to have_content("Chef: Wilson")
      expect(page).to have_content("Description: It's not Mac and Cheese")
      expect(page).to have_content("Calories: 300")

      within "#ingredients" do
        expect(page).to have_content("Cheese\nNoodles")
      end
    end
  end
end