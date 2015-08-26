
require('spec_helper')

describe(Ingredient) do

  describe("#ingredients") do
    it("validates if the ingredients are unique") do
     test_ingredient = Ingredient.create({:name => "tomato"})
     test_ingredient2 = Ingredient.create({:name => "tomato"})
     expect(test_ingredient2.save()).to(eq(false))
   end
 end
end
