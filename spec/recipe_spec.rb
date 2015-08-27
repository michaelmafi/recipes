require('spec_helper')

describe(Recipe) do

  describe("#ingredients") do
    it("lists the ingredients of the recipe") do
     test_ingredient = Ingredient.create({:name => "tomato"})
     test_recipe = Recipe.new({:name => "Sauce",:instruction => "Just cut it and juice it"})
     expect(test_recipe.ingredients).to(eq([test_ingredients]))
   end
 end


  describe("#categories") do
    it("lists the categories of the recipe") do
     test_category = Category.create({:name => "Vegetable"})
     test_recipe = Recipe.new({:name => "Sauce",:instruction => "Just cut it and juice it"})
     test_recipe.categories.push(test_category)
     expect(test_recipe.categories).to(eq([test_category]))
   end
  end


    it("validates if a name is present") do
      test_recipe = Recipe.new({:name => ""})
      expect(test_recipe.save()).to(eq(false))
    end
  end
