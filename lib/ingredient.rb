class Ingredient < ActiveRecord::Base

  has_and_belongs_to_many(:recipes)
  validates(:name, :uniqueness => true)

  define_singleton_method(:find_name) do |name|

    found_ingredient = nil
    Ingredient.all().each()do |ingredient|
    if ingredient.name().==(name)
      found_ingredient = ingredient
    end
    found_ingredient
  end
 end
end
