class Category < ActiveRecord::Base

  has_and_belongs_to_many(:recipes)

  define_singleton_method(:find_name) do |name|
    found_name = nil
    Category.all().each()do |category|
    if category.name().==(name)
      found_name = name
    end
    found_name
  end
end

end
