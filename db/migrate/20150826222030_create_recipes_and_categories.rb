class CreateRecipesAndCategories < ActiveRecord::Migration
  def change
   create_table(:categories_recipes) do |t|
      t.belongs_to(:recipe)
      t.belongs_to(:category)
  end
 end
end
