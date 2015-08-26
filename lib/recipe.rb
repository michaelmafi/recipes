class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:categories)

  validates(:name, :presence => true)
  validates(:rating, numericality: {greater_than_or_equal_to: 0})

  define_singleton_method(:find_name) do |name|

    found_recipe = nil
    Recipe.all().each() do |recipe|
      if recipe.name().==(name)
        found_recipe = recipe
      end
    end
    found_recipe
  end
  

end
